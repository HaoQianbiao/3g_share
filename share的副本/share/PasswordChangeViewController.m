//
//  PasswordChangeViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "PasswordChangeViewController.h"

@implementation PasswordChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textFieldOne = [[UITextField alloc] initWithFrame:CGRectMake(130, 20, 200, 40)];
    _textFieldOne.font = [UIFont systemFontOfSize:20];
    _textFieldOne.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldOne.delegate = self;
    _textFieldOne.secureTextEntry = YES;
    _labelOne = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 100, 40)];
    _labelOne.text = @"旧密码";
    _labelOne.font = [UIFont systemFontOfSize:18];
    _textFieldTwo = [[UITextField alloc] initWithFrame:CGRectMake(130, 70, 200, 40)];
    _textFieldTwo.font = [UIFont systemFontOfSize:20];
    _textFieldTwo.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldTwo.delegate = self;
    _textFieldTwo.secureTextEntry = YES;
    _labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(30, 70, 100, 40)];
    _labelTwo.text = @"新密码";
    _labelTwo.font = [UIFont systemFontOfSize:18];
    _textFieldThree = [[UITextField alloc] initWithFrame:CGRectMake(130, 120, 200, 40)];
    _textFieldThree.font = [UIFont systemFontOfSize:20];
    _textFieldThree.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldThree.delegate = self;
    _textFieldThree.secureTextEntry = YES;
    _labelThree = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, 100, 40)];
    _labelThree.text = @"确认密码";
    _labelThree.font = [UIFont systemFontOfSize:18];
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(180, 200, 60, 40);
    _button.backgroundColor = [UIColor blackColor];
    [_button setTitle:@"提交" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_labelOne];
    [self.view addSubview:_labelTwo];
    [self.view addSubview:_labelThree];
    [self.view addSubview:_textFieldOne];
    [self.view addSubview:_textFieldTwo];
    [self.view addSubview:_textFieldThree];
    [self.view addSubview:_button];
}

-(void) press {
    if ([_textFieldTwo.text isEqualToString:_textFieldThree.text]) {
        
        [_textFieldOne resignFirstResponder];
        [_textFieldThree resignFirstResponder];
        [_textFieldTwo resignFirstResponder];
        _alert = [UIAlertController alertControllerWithTitle:nil message:@"修改成功" preferredStyle:UIAlertControllerStyleAlert];
        [_alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIActionSheetStyleDefault handler:nil]];
        [self presentViewController:_alert animated:YES completion:nil];
    } else {
        [_textFieldOne resignFirstResponder];
        [_textFieldThree resignFirstResponder];
        [_textFieldTwo resignFirstResponder];
        self.alert = [UIAlertController alertControllerWithTitle:nil message:@"密码不一致" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:_alert animated:YES completion:nil];
        [self performSelector:@selector(dismiss:) withObject:_alert afterDelay:2];
    }
    
}

-(void) dismiss:(UIAlertController*) alert {
    [alert dismissViewControllerAnimated:YES completion:nil];
}
@end
