//
//  LoginViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/25.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "ArticleViewController.h"
#import "ActivityViewController.h"
#import "PersonMessageViewController.h"
@interface LoginViewController () <UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _buttonAll = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,  self.view.bounds.size.height)];
    [_buttonAll addTarget:self action:@selector(textFieldDidEndEditing:) forControlEvents:UIControlEventTouchUpInside];
    _buttonAll.adjustsImageWhenHighlighted = NO;
    UIImage* image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/kaiji1.png"];
    [_buttonAll setImage:image forState:UIControlStateNormal];
    [self.view addSubview:_buttonAll];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(140, 140, 140, 140)];
    [imageView setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/login_logo.png"]];
    [_buttonAll addSubview:imageView];


    
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.frame = CGRectMake(50, 370, 300, 60);
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
    _passwordTextField.frame = CGRectMake(50, 450, 300, 60);
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
    

    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 225, 225, 225, 1 });
    
    _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(70, 540, 110, 50)];
    [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:30];
    _loginButton.titleLabel.tintColor = [UIColor whiteColor];
    _loginButton.layer.borderWidth = 1;
    [_loginButton.layer setBorderColor:colorref];
    [_loginButton.layer setMasksToBounds:YES];
    [_loginButton.layer setCornerRadius:5];
    [_loginButton addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    [_buttonAll addSubview:_loginButton];
    
    _registerButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 540, 110, 50)];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:30];
    _registerButton.titleLabel.tintColor = [UIColor whiteColor];
    _registerButton.layer.borderWidth = 1;
    [_registerButton.layer setBorderColor:colorref];
    [_registerButton.layer setMasksToBounds:YES];
    [_registerButton.layer setCornerRadius:5];
    [_registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [_buttonAll addSubview:_registerButton];
    
    UILabel* loginLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 600, 120, 50)];
    loginLabel.text = @"自动登录";
    loginLabel.font = [UIFont systemFontOfSize:15];
    [_buttonAll addSubview:loginLabel];
    
    _automaticLogin = [[UIButton alloc] initWithFrame:CGRectMake(40, 610, 25, 25)];
    [_automaticLogin setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/checkbox_unchecked.png"] forState:UIControlStateNormal];
    [_automaticLogin addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [_buttonAll addSubview:_automaticLogin];
    
    
}

-(void) press {
    if (_automaticLogin.selected == YES) {
        [_automaticLogin setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/checkbox_unchecked.png"] forState:UIControlStateNormal];
        _automaticLogin.selected = NO;
    } else {
        [_automaticLogin setImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/checkbox_checked.png"] forState:UIControlStateNormal];
        _automaticLogin.selected = YES;
    }
}
-(void) pushNameText:(NSString *)nameText {
    _strName = nameText;
}
-(void) pushPasswordText:(NSString *)passwordText {
    _strPassword = passwordText;
}
-(void) pressLogin {
    if (([_strName isEqualToString:_nameTextField.text] && [_strPassword isEqualToString:_passwordTextField.text]) && (_nameTextField.text != nil) && (_passwordTextField != nil)) {
        HomeViewController* homeViewController = [[HomeViewController alloc] init];
        SearchViewController* searchViewController = [[SearchViewController alloc] init];
        ArticleViewController* articleViewController = [[ArticleViewController alloc] init];
        ActivityViewController* activityViewController = [[ActivityViewController alloc] init];
        PersonMessageViewController* personMessageViewController = [[PersonMessageViewController alloc] init];
        
        homeViewController.tabBarItem.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/share+4.18最终/新建文件夹/素材/logo/radio_button_home.png"];
        searchViewController.tabBarItem.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/share+4.18最终/新建文件夹/素材/logo/radio_button_search.png"];
        articleViewController.tabBarItem.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/share+4.18最终/新建文件夹/素材/logo/radio_button_note.png"];
        activityViewController.tabBarItem.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/share+4.18最终/新建文件夹/素材/logo/radio_button_cup.png"];
        personMessageViewController.tabBarItem.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/share+4.18最终/新建文件夹/素材/logo/radio_button_user.png"];
        
        UINavigationController* navigationControllerHome = [[UINavigationController alloc] initWithRootViewController:homeViewController];
        UINavigationController* navigationControllerSearch = [[UINavigationController alloc] initWithRootViewController:searchViewController];
        UINavigationController* navigationControllerArticle = [[UINavigationController alloc] initWithRootViewController:articleViewController];
        UINavigationController* navigationControllerActivity = [[UINavigationController alloc] initWithRootViewController:activityViewController];
        UINavigationController* navigationControllerPersonMessage = [[UINavigationController alloc] initWithRootViewController:personMessageViewController];
        homeViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button1_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        searchViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button2_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        articleViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button3_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        activityViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button4_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        personMessageViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/button5_pressed.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        NSArray* arrayNavigationController = [[NSArray alloc] initWithObjects:navigationControllerHome, navigationControllerSearch, navigationControllerArticle, navigationControllerActivity, navigationControllerPersonMessage, nil];
        UITabBarController* tabBarController = [[UITabBarController alloc] init];
        tabBarController.viewControllers = arrayNavigationController;
        tabBarController.tabBar.barStyle = UIBarStyleBlack;
        tabBarController.tabBar.translucent = NO;
        [self presentViewController:tabBarController animated:YES completion:nil];
    } else {
        _alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号或密码错误或不存在，请重新输入或注册！！！" preferredStyle:UIAlertControllerStyleAlert];
        [_alertView addAction:[UIAlertAction actionWithTitle:@"sure" style:UIActionSheetStyleDefault handler:nil]];
        [self presentViewController:_alertView animated:true completion:nil];
    }
}

-(void) pressRegister {
    RegisterViewController* registerViewController = [[RegisterViewController alloc] init];
    registerViewController.delegate = self;
    [self presentViewController:registerViewController animated:YES completion:nil];
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
