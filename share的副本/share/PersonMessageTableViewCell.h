//
//  PersonMessageTableViewCell.h
//  share
//
//  Created by haoqianbiao on 2021/7/27.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonMessageTableViewCell : UITableViewCell
@property (nonatomic, strong) UIView* view;
@property (nonatomic, strong) UILabel* headLabel;
@property (nonatomic, strong) UILabel* detailedLabel;
@property (nonatomic, strong) UILabel* personalSignatureLabel;
@property (nonatomic, strong) UIButton* thumbsupButton;
@property (nonatomic, strong) UIButton* upLoadButton;
@property (nonatomic, strong) UIButton* watchButton;
@end

NS_ASSUME_NONNULL_END
