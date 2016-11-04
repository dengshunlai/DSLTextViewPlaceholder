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
    
    _textView.dsl_textView_placeholder = @"最多输入50个字符..";
    _textView.dsl_textView_maxLength = 50;
    
    
    UITextView *textView2 = [[UITextView alloc] initWithFrame:CGRectMake(20, 200, [UIScreen mainScreen].bounds.size.width - 40, 88)];
    [self.view addSubview:textView2];
    textView2.dsl_textView_placeholder = @"最多输入10个字符..";
    textView2.dsl_textView_maxLength = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)endEdit:(UIControl *)sender {
    [self.view endEditing:YES];
}

@end
