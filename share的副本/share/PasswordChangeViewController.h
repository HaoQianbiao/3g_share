//
//  PasswordChangeViewController.h
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PasswordChangeViewController : UIViewController
<UITextFieldDelegate>
@property (nonatomic, strong) UIButton* button;
@property (nonatomic, strong) UITextField* textFieldOne;
@property (nonatomic, strong) UITextField* textFieldTwo;
@property (nonatomic, strong) UITextField* textFieldThree;
@property (nonatomic, strong) UIAlertController* alert;
@property (nonatomic, strong) UILabel* labelOne;
@property (nonatomic, strong) UILabel* labelTwo;
@property (nonatomic, strong) UILabel* labelThree;
@end

NS_ASSUME_NONNULL_END
