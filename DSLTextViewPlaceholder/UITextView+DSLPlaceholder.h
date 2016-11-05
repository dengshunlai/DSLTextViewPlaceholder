//
//  UITextView+DSLPlaceholder.h
//  DSLTextViewPlaceholderExample
//
//  Created by 邓顺来 on 16/11/3.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (DSLPlaceholder)

/**
 placeholder
 */
@property (strong, nonatomic) NSString *dsl_textView_placeholder;

/**
 placeholder字体大小，不传默认与textView的字体大小一致
 */
@property (assign, nonatomic) CGFloat dsl_textView_placeholder_fontSize;

/**
 placeholder颜色，默认0xbfbfbf
 */
@property (strong, nonatomic) UIColor *dsl_textView_placeholder_color;

/**
 限制textView输入的最大长度，0表示不限制
 */
@property (assign, nonatomic) NSInteger dsl_textView_maxLength;

@end
