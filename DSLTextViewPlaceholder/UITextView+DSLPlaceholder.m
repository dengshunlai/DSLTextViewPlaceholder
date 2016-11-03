//
//  UITextView+DSLPlaceholder.m
//  DSLTextViewPlaceholderExample
//
//  Created by 邓顺来 on 16/11/3.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "UITextView+DSLPlaceholder.h"
#import <objc/runtime.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface UITextView ()

@property (strong, nonatomic) UILabel *dsl_textView_placeholderLabel;

@end

@implementation UITextView (DSLPlaceholder)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method original = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
        Method exchange = class_getInstanceMethod(self, @selector(dsl_textView_placeholder_dealloc));
        method_exchangeImplementations(original, exchange);
    });
}

- (void)dsl_textView_placeholder_dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
    [self dsl_textView_placeholder_dealloc];
}

- (NSString *)dsl_textView_placeholder
{
    return objc_getAssociatedObject(self, @selector(dsl_textView_placeholder));
}

- (void)setDsl_textView_placeholder:(NSString *)dsl_textView_placeholder
{
    objc_setAssociatedObject(self, @selector(dsl_textView_placeholder), dsl_textView_placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.dsl_textView_placeholderLabel.text = dsl_textView_placeholder;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dsl_textViewTextDidChange:) name:UITextViewTextDidChangeNotification object:nil];
}

- (UILabel *)dsl_textView_placeholderLabel
{
    UILabel *label = objc_getAssociatedObject(self, @selector(dsl_textView_placeholderLabel));
    if (!label) {
        self.dsl_textView_placeholderLabel = label = [[UILabel alloc] init];
        label.font = self.font;
        label.textColor = UIColorFromRGB(0xbfbfbf);
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:label];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[label]-5-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[label]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];
    }
    return label;
}

- (void)setDsl_textView_placeholderLabel:(UILabel *)dsl_textView_placeholderLabel
{
    objc_setAssociatedObject(self, @selector(dsl_textView_placeholderLabel), dsl_textView_placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)dsl_textViewTextDidChange:(NSNotification *)notification
{
    if (self.dsl_textView_placeholder.length) {
        if (self.text.length) {
            self.dsl_textView_placeholderLabel.hidden = YES;
        } else {
            self.dsl_textView_placeholderLabel.hidden = NO;
        }
    }
}

@end
