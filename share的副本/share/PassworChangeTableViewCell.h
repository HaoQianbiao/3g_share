//
//  PassworChangeTableViewCell.h
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PassworChangeTableViewCell : UITableViewCell

@property (nonatomic, strong) UITextField* textFieldOne;
@property (nonatomic, strong) UITextField* textFieldTwo;
@property (nonatomic, strong) UITextField* textFieldThree;
@property (nonatomic, strong) NSString* strFirst;
@property (nonatomic, strong) NSString* strSecond;
@property (nonatomic, strong) UIAlertController* alert;
@property (nonatomic, strong) UIButton *button;
@end

NS_ASSUME_NONNULL_END
