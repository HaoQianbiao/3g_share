//
//  HomeViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/26.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/background_main.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/actionbar.png"]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 50) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"0"];
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"1"];
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"2"];
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"3"];
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"4"];
    
    [self.view addSubview:_tableView];
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 230;
    } else {
        return 180;
    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 4) {
        return 40;
    } else {
        return 15;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}



-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomeTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.section == 1) {
        HomeTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.section == 2) {
        HomeTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.section == 3) {
        HomeTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
        return cell;
    } else {
        HomeTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"4" forIndexPath:indexPath];
        return cell;
    }
    
}
@end
