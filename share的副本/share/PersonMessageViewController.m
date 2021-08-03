//
//  PersonMessageViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/25.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "PersonMessageViewController.h"
#import "PersonMessageTableViewCell.h"
#import "MyMessageViewController.h"
#import "RecommondViewController.h"
#import "SettingViewController.h"
#import "MyUpLoadViewController.h"
@interface PersonMessageViewController ()

@end

@implementation PersonMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/actionbar.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title = @"个人信息";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 150) style:UITableViewStyleGrouped];
    [self.tableView registerClass:[PersonMessageTableViewCell class] forCellReuseIdentifier:@"0"];
    [self.tableView registerClass:[PersonMessageTableViewCell class] forCellReuseIdentifier:@"1"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _nameArray = [[NSArray alloc] initWithObjects:@"我上传的", @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出", nil];
    _imageNameArray = [[NSArray alloc] initWithObjects:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/img2.png", @"/Users/haoqianbiao/Desktop/test1/UI/share/素材/img4.png", @"/Users/haoqianbiao/Desktop/test1/UI/share/素材/img8.png", @"/Users/haoqianbiao/Desktop/test1/UI/share/素材/img5.png", @"/Users/haoqianbiao/Desktop/test1/UI/share/素材/img6.png", @"/Users/haoqianbiao/Desktop/test1/UI/share/素材/img7.png", nil];
    [self.view addSubview:_tableView];
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 6;
    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 130;
    } else {
        return 60;
    }
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PersonMessageTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"0"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        PersonMessageTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"1"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.textLabel.text = [_nameArray objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:[_imageNameArray objectAtIndex:indexPath.row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 && indexPath.section == 1) {
        MyUpLoadViewController* myUpLoadViewController = [[MyUpLoadViewController alloc] init];
        [self.navigationController pushViewController:myUpLoadViewController animated:YES];
    } else if (indexPath.row == 1 && indexPath.section == 1) {
        MyMessageViewController* myMessageViewController = [[MyMessageViewController alloc] init];
        [self.navigationController pushViewController:myMessageViewController animated:YES];
    } else if (indexPath.row == 2 && indexPath.section == 1) {
        RecommondViewController* recommondViewController = [[RecommondViewController alloc] init];
        [self.navigationController pushViewController:recommondViewController animated:YES];
    } else if (indexPath.row == 3 && indexPath.section == 1) {
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"目前没有新内容" preferredStyle:UIAlertControllerStyleAlert ];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    } else if (indexPath.row == 4 && indexPath.section == 1) {
        SettingViewController* settingViewController = [[SettingViewController alloc] init];
        [self.navigationController pushViewController:settingViewController animated:YES ];
    } else {
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"需求被驳回" preferredStyle:UIAlertControllerStyleAlert ];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end
