//
//  MessageSetViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "MessageSetViewController.h"
#import "MessageSetTableViewCell.h"
@interface MessageSetViewController ()

@end

@implementation MessageSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[MessageSetTableViewCell class] forCellReuseIdentifier:@"0"];
    [_tableView registerClass:[MessageSetTableViewCell class] forCellReuseIdentifier:@"1"];
    [_tableView registerClass:[MessageSetTableViewCell class] forCellReuseIdentifier:@"2"];
    [_tableView registerClass:[MessageSetTableViewCell class] forCellReuseIdentifier:@"3"];
    [_tableView registerClass:[MessageSetTableViewCell class] forCellReuseIdentifier:@"4"];
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MessageSetTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 1) {
        MessageSetTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 2) {
        MessageSetTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 3) {
        MessageSetTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        MessageSetTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"4" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

@end
