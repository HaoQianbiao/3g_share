//
//  BigWhiteViewController.h
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BigWhiteViewController : UIViewController
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITextField* textField;
@property (nonatomic, strong) UITableView* tableView;

@end

NS_ASSUME_NONNULL_END
