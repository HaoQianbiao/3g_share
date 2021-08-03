//
//  RegisterViewController.h
//  share
//
//  Created by haoqianbiao on 2021/7/25.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RegisterViewControllerDelegate<NSObject>
-(void) pushNameText:(NSString*) nameText;
-(void) pushPasswordText:(NSString*) passwordText;
@end
@interface RegisterViewController : UIViewController
@property (nonatomic, strong) UIButton* buttonAll;
@property (nonatomic, strong) UITextField* nameTextField;
@property (nonatomic, strong) UITextField* passwordTextField;
@property (nonatomic, strong) UIImageView* lineImageView;
@property (nonatomic, strong) UITextField* messageTextField;
@property (nonatomic, strong) UIButton* registerButton;
@property (nonatomic, assign) id<RegisterViewControllerDelegate>delegate;
@end


