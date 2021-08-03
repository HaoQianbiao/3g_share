//
//  BasicInformationViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "BasicInformationViewController.h"
#import "BasicInformationTableViewCell.h"
@interface BasicInformationViewController ()

@end

@implementation BasicInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[BasicInformationTableViewCell class] forCellReuseIdentifier:@"0"];
    [_tableView registerClass:[BasicInformationTableViewCell class] forCellReuseIdentifier:@"1"];
    [_tableView registerClass:[BasicInformationTableViewCell class] forCellReuseIdentifier:@"2"];
    [_tableView registerClass:[BasicInformationTableViewCell class] forCellReuseIdentifier:@"3"];
    [_tableView registerClass:[BasicInformationTableViewCell class] forCellReuseIdentifier:@"4"];
    [self.view addSubview:_tableView];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 80;
    } else {
        return 50;
    }
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        BasicInformationTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 1) {
        BasicInformationTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 2) {
        BasicInformationTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.row == 3) {
        BasicInformationTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        BasicInformationTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"4" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

@end
