//
//  RegisterViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/25.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _buttonAll = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,  self.view.bounds.size.height)];
    [_buttonAll addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventTouchUpInside];
    _buttonAll.adjustsImageWhenHighlighted = NO;
    UIImage* image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/kaiji1.png"];
    [_buttonAll setImage:image forState:UIControlStateNormal];
    [self.view addSubview:_buttonAll];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(140, 120, 140, 140)];
    [imageView setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/login_logo.png"]];
    [_buttonAll addSubview:imageView];
    
    
    
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.frame = CGRectMake(50, 380, 300, 60);
    _nameTextField.font = [UIFont systemFontOfSize:25];
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _nameTextField.delegate = self;
    UIImageView* userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
    userImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/user_img.png"];
    _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 10, 3, 40)];
    _lineImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/line.png"];
    [_nameTextField setValue:[NSNumber numberWithInt:55] forKey:@"paddingLeft"];
    [_nameTextField addSubview:userImageView];
    [_nameTextField addSubview:_lineImageView];
    [_buttonAll addSubview:_nameTextField];
    
    _passwordTextField = [[UITextField alloc] init];
    _passwordTextField.frame = CGRectMake(50, 460, 300, 60);
    _passwordTextField.font = [UIFont systemFontOfSize:25];
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.delegate = self;
    userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
    userImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/pass_img.png"];
    _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 10, 3, 40)];
    _lineImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/line.png"];
    [_passwordTextField setValue:[NSNumber numberWithInt:55] forKey:@"paddingLeft"];
    [_passwordTextField addSubview:userImageView];
    [_passwordTextField addSubview:_lineImageView];
    [_buttonAll addSubview:_passwordTextField];
    
    _messageTextField = [[UITextField alloc] init];
    _messageTextField.frame = CGRectMake(50, 300, 300, 60);
    _messageTextField.font = [UIFont systemFontOfSize:25];
    _messageTextField.borderStyle = UITextBorderStyleRoundedRect;
    _messageTextField.delegate = self;
    userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    userImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/img4.png"];
    _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 10, 3, 40)];
    _lineImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/line.png"];
    [_messageTextField setValue:[NSNumber numberWithInt:55] forKey:@"paddingLeft"];
    [_messageTextField addSubview:userImageView];
    [_messageTextField addSubview:_lineImageView];
    [_buttonAll addSubview:_messageTextField];
    
    
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 225, 225, 225, 1 });
    
    _registerButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 540, 200, 50)];
    [_registerButton setTitle:@"确认注册" forState:UIControlStateNormal];
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:30];
    _registerButton.titleLabel.tintColor = [UIColor whiteColor];
    _registerButton.layer.borderWidth = 1;
    [_registerButton.layer setBorderColor:colorref];
    [_registerButton.layer setMasksToBounds:YES];
    [_registerButton.layer setCornerRadius:5];
    [_registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [_buttonAll addSubview:_registerButton];
    
    
}

-(void) pressRegister {
    /*表示把要传的值让代理人先拿着*/
    [self.delegate pushNameText:_nameTextField.text];
    [self.delegate pushPasswordText:_passwordTextField.text];
    /*从第二界面回到第一界面*/
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    //将视图的Y坐标向上移动，以使下面腾出地方用于软键盘的显示
    self.buttonAll.frame = CGRectMake(0, -100, self.buttonAll.frame.size.width, self.buttonAll.frame.size.height);
    [UIView commitAnimations];
}
//取消第一响应，也就是输入完毕，屏幕恢复原状
-( void )textFieldDidEndEditing:(UITextField *)textField
{
    //滑动效果
    [_passwordTextField resignFirstResponder];
    [_nameTextField resignFirstResponder];
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    //恢复屏幕
    self.buttonAll.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
    
}



@end
