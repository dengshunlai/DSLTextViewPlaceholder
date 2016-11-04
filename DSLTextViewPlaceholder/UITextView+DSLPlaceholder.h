//
//  UITextView+DSLPlaceholder.h
//  DSLTextViewPlaceholderExample
//
//  Created by 邓顺来 on 16/11/3.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (DSLPlaceholder)

@property (strong, nonatomic) NSString *dsl_textView_placeholder;

@property (assign, nonatomic) CGFloat dsl_textView_placeholder_fontSize;

@property (strong, nonatomic) UIColor *dsl_textView_placeholder_color;

@property (assign, nonatomic) NSInteger dsl_textView_maxLength;

@end
