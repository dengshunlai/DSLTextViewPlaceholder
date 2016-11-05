//
//  DemoViewController.m
//  DSLTextViewPlaceholderExample
//
//  Created by 邓顺来 on 16/11/3.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "DemoViewController.h"
#import "UITextView+DSLPlaceholder.h"
//#import "UITextView+A.h"

@interface DemoViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //设置placeholder
    _textView.dsl_textView_placeholder = @"最多输入50个字符..";
    //限制最大输入长度
    _textView.dsl_textView_maxLength = 50;
    //placeholder颜色，默认0xbfbfbf
    //_textView.dsl_textView_placeholder_color = [UIColor purpleColor];
    //placeholder字体大小，不传默认与textView的字体大小一致
    //_textView.dsl_textView_placeholder_fontSize = 16;
    
    UITextView *textView2 = [[UITextView alloc] initWithFrame:CGRectMake(20, 200, [UIScreen mainScreen].bounds.size.width - 40, 88)];
    [self.view addSubview:textView2];
    textView2.dsl_textView_placeholder = @"最多输入20个字符..";
    textView2.dsl_textView_maxLength = 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)endEdit:(UIControl *)sender {
    [self.view endEditing:YES];
}

@end
