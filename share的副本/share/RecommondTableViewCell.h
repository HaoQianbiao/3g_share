//
//  RecommondTableViewCell.h
//  share
//
//  Created by haoqianbiao on 2021/7/28.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecommondTableViewCell : UITableViewCell
@property(nonatomic,strong) UIButton* shareButtonBig;
@property(nonatomic,strong) UIButton* shareButtonImage;
@property(nonatomic,strong) UIButton* shareButtonText;
@property(nonatomic,strong) UILabel* detailedLabelOne;
@property(nonatomic,strong) UILabel* detailedLabelTwo;
@property(nonatomic,strong) UILabel* detailedLabelThree;
@property(nonatomic,strong) UIButton* thumbsupButton;
@property(nonatomic,strong) UIButton* watchButton;
@property(nonatomic,strong) UIButton* shareButton;
@property (nonatomic, strong) NSMutableArray* detailedArray;
@property (nonatomic, strong) NSString* listImage;
@property (nonatomic, strong) NSMutableArray* shareButtonBigArray;
@end

NS_ASSUME_NONNULL_END
