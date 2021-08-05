//
//  ChatViewController.h
//  share
//
//  Created by haoqianbiao on 2021/8/4.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : UIViewController
<UITextFieldDelegate,
UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UITextField* textField;
@property (nonatomic, strong) NSMutableArray* rowHeightArray;
@property (nonatomic, strong) NSMutableArray* messageArray;
@property (nonatomic) NSNumber *rowHeight;
@property (nonatomic, strong) NSString* imageStr;

@end

NS_ASSUME_NONNULL_END
