//
//  ArticleOneTableViewCell.h
//  share
//
//  Created by haoqianbiao on 2021/7/28.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArticleOneTableViewCell : UITableViewCell
@property (nonatomic, strong) UIView* view;
@property (nonatomic, strong) UIImageView* imageview;
@property (nonatomic, strong) UILabel* headLabel;
@property (nonatomic, strong) UILabel* detailedLabelOne;
@property (nonatomic, strong) UILabel* detailedLabelTwo;
@property(nonatomic, strong) UIButton* thumbsupButton;
@property(nonatomic, strong) UIButton* watchButton;
@property(nonatomic, strong) UIButton* shareButton;
@end

NS_ASSUME_NONNULL_END
