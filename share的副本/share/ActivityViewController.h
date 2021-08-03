//
//  ActivityViewController.h
//  share
//
//  Created by haoqianbiao on 2021/7/25.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ActivityViewController : UIViewController
< UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@end

NS_ASSUME_NONNULL_END
