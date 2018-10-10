//
//  HQViewController.m
//  HQTextFieldDemo
//
//  Created by Mr_Han on 2018/10/10.
//  Copyright © 2018年 Mr_Han. All rights reserved.
//

#import "HQViewController.h"
#import "HQTextField.h"

@interface HQViewController ()

@property (nonatomic, strong) HQTextField *textField;

@end

@implementation HQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        
    // 创建一个warnTextField
    self.textField = [[HQTextField alloc]initWithFrame:CGRectMake(60, 200, 200, 30)];
    self.textField.placeholder = @"请输入用户名";
    [self.view addSubview:self.textField];
    [self.textField becomeFirstResponder];
    
    // 创建一个button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(20, 260, 100, 30);
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(showWarn) forControlEvents:UIControlEventTouchUpInside];
}

// 文本框警示
- (void)showWarn {
    [self.textField showWarn];
}

@end
