//
//  BigWhiteTableViewCell.h
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BigWhiteTableViewCell : UITableViewCell
@property (nonatomic, strong) UIView* view;
@property (nonatomic, strong) UIImageView* imageViewOne;
@property (nonatomic, strong) UIImageView* imageViewTwo;
@property (nonatomic, strong) UILabel* headLabelOne;
@property (nonatomic, strong) UILabel* headLabelTwo;
@property (nonatomic, strong) UILabel* detailedLabelOne;
@property (nonatomic, strong) UILabel* detailedLabelTwo;
@property (nonatomic, strong) UILabel* detailedLabelThree;
@property(nonatomic, strong) UIButton* thumbsupButton;
@property(nonatomic, strong) UIButton* watchButton;
@property(nonatomic, strong) UIButton* shareButton;
@end

NS_ASSUME_NONNULL_END
