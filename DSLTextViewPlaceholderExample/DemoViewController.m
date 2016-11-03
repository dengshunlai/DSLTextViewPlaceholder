//
//  DemoViewController.m
//  DSLTextViewPlaceholderExample
//
//  Created by 邓顺来 on 16/11/3.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "DemoViewController.h"
#import "UITextView+DSLPlaceholder.h"

@interface DemoViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _textView.dsl_textView_placeholder = @"最多输入100个字符..";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
