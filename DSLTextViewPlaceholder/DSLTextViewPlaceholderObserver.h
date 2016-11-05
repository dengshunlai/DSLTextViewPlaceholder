//
//  DSLTextViewPlaceholderObserver.h
//  DSLTextViewPlaceholderExample
//
//  Created by 邓顺来 on 16/11/5.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSLTextViewPlaceholderObserver : NSObject

@property (weak, nonatomic) UITextView *textView;

- (void)setupNotification;

- (void)removeNotification;

@end
