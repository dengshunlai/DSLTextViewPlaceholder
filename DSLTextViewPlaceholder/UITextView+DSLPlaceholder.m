//
//  UITextView+DSLPlaceholder.m
//  DSLTextViewPlaceholderExample
//
//  Created by 邓顺来 on 16/11/3.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "UITextView+DSLPlaceholder.h"
#import "DSLTextViewPlaceholderObserver.h"
#import <objc/runtime.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface UITextView ()

@property (strong, nonatomic) UILabel *dsl_textView_placeholderLabel;
@property (strong, nonatomic) DSLTextViewPlaceholderObserver *dsl_textView_placeholder_obsever;

@end

@implementation UITextView (DSLPlaceholder)

- (NSString *)dsl_textView_placeholder
{
    return objc_getAssociatedObject(self, @selector(dsl_textView_placeholder));
}

- (void)setDsl_textView_placeholder:(NSString *)dsl_textView_placeholder
{
    objc_setAssociatedObject(self, @selector(dsl_textView_placeholder), dsl_textView_placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.dsl_textView_placeholderLabel.text = dsl_textView_placeholder;
    [self.dsl_textView_placeholder_obsever removeNotification];
    [self.dsl_textView_placeholder_obsever setupNotification];
}

- (CGFloat)dsl_textView_placeholder_fontSize
{
    return [objc_getAssociatedObject(self, @selector(dsl_textView_placeholder_fontSize)) doubleValue];
}

- (void)setDsl_textView_placeholder_fontSize:(CGFloat)dsl_textView_placeholder_fontSize
{
    objc_setAssociatedObject(self, @selector(dsl_textView_placeholder_fontSize), [NSNumber numberWithDouble:dsl_textView_placeholder_fontSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.dsl_textView_placeholderLabel.font = [UIFont systemFontOfSize:dsl_textView_placeholder_fontSize];
}

- (UIColor *)dsl_textView_placeholder_color
{
    return objc_getAssociatedObject(self, @selector(dsl_textView_placeholder_color));
}

- (void)setDsl_textView_placeholder_color:(UIColor *)dsl_textView_placeholder_color
{
    objc_setAssociatedObject(self, @selector(dsl_textView_placeholder_color), dsl_textView_placeholder_color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.dsl_textView_placeholderLabel.textColor = dsl_textView_placeholder_color;
}

- (NSInteger)dsl_textView_maxLength
{
    return [objc_getAssociatedObject(self, @selector(dsl_textView_maxLength)) integerValue];
}

- (void)setDsl_textView_maxLength:(NSInteger)dsl_textView_maxLength
{
    objc_setAssociatedObject(self, @selector(dsl_textView_maxLength), [NSNumber numberWithInteger:dsl_textView_maxLength], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (DSLTextViewPlaceholderObserver *)dsl_textView_placeholder_obsever
{
    DSLTextViewPlaceholderObserver *obsever = objc_getAssociatedObject(self, @selector(dsl_textView_placeholder_obsever));
    if (!obsever) {
        self.dsl_textView_placeholder_obsever = obsever = [[DSLTextViewPlaceholderObserver alloc] init];
        obsever.textView = self;
    }
    return obsever;
}

- (void)setDsl_textView_placeholder_obsever:(DSLTextViewPlaceholderObserver *)dsl_textView_placeholder_obsever
{
    objc_setAssociatedObject(self, @selector(dsl_textView_placeholder_obsever), dsl_textView_placeholder_obsever, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)dsl_textView_placeholderLabel
{
    UILabel *label = objc_getAssociatedObject(self, @selector(dsl_textView_placeholderLabel));
    if (!label) {
        self.dsl_textView_placeholderLabel = label = [[UILabel alloc] init];
        if (self.dsl_textView_placeholder_fontSize) {
            label.font = [UIFont systemFontOfSize:self.dsl_textView_placeholder_fontSize];
        } else {
            if (self.font) {
                label.font = self.font;
            } else {
                label.font = [UIFont systemFontOfSize:12];
            }
        }
        if (self.dsl_textView_placeholder_color) {
            label.textColor = self.dsl_textView_placeholder_color;
        } else {
            label.textColor = UIColorFromRGB(0xbfbfbf);
        }
        UIView *textContainerView;
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:NSClassFromString(@"_UITextContainerView" )]) {
                textContainerView = view;
            }
        }
        [textContainerView addSubview:label];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [textContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[label]-5-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];
        [textContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[label]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];
    }
    return label;
}

- (void)setDsl_textView_placeholderLabel:(UILabel *)dsl_textView_placeholderLabel
{
    objc_setAssociatedObject(self, @selector(dsl_textView_placeholderLabel), dsl_textView_placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)dsl_textView_placeholder_textDidChange
{
    if (self.dsl_textView_placeholder.length) {
        if (self.text.length) {
            self.dsl_textView_placeholderLabel.hidden = YES;
        } else {
            self.dsl_textView_placeholderLabel.hidden = NO;
        }
    }
    if (self.dsl_textView_maxLength > 0) {
        if (self.text.length > self.dsl_textView_maxLength) {
            self.text = [self.text substringToIndex:self.dsl_textView_maxLength];
        }
    }
}

@end
