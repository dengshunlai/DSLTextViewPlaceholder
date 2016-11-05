//
//  DSLTextViewPlaceholderObserver.m
//  DSLTextViewPlaceholderExample
//
//  Created by 邓顺来 on 16/11/5.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "DSLTextViewPlaceholderObserver.h"

@implementation DSLTextViewPlaceholderObserver

- (void)setupNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChange) name:UITextViewTextDidChangeNotification object:self.textView];
}

- (void)removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self.textView];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self.textView];
}

- (void)textViewTextDidChange
{
    SEL selector = NSSelectorFromString(@"dsl_textView_placeholder_textDidChange");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self.textView performSelector:selector];
#pragma clang diagnostic pop
}

@end
