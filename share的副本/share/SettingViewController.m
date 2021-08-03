
//
//  SettingViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"
#import "BasicInformationViewController.h"
#import "PasswordChangeViewController.h"
#import "MessageSetViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/back_img.png"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.backIndicatorImage = image;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = image;
    self.navigationItem.backBarButtonItem.title = @"我的信息";
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[SettingTableViewCell class] forCellReuseIdentifier:@"0"];
    _nameArray = [[NSArray alloc] initWithObjects: @"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓冲",nil];
    [self.view addSubview:_tableView];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SettingTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.textLabel.text = [_nameArray objectAtIndex:indexPath.row];
    return cell;
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        BasicInformationViewController* basicInformationViewController = [[BasicInformationViewController alloc] init];
        [self.navigationController pushViewController:basicInformationViewController animated:YES];
    } else if (indexPath.row == 1) {
        PasswordChangeViewController* passwordChangeViewController = [[PasswordChangeViewController alloc] init];
        [self.navigationController pushViewController:passwordChangeViewController animated:YES];
    } else if (indexPath.row == 2) {
        MessageSetViewController* messageSetViewController = [[MessageSetViewController alloc] init];
        [self.navigationController pushViewController:messageSetViewController animated:YES];
    } else if (indexPath.row == 3) {
        _alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"目前没有新内容" preferredStyle:UIAlertControllerStyleAlert];
        [_alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIActionSheetStyleDefault handler:nil]];
        [self presentViewController:_alertView animated:true completion:nil];
    } else {
        _alertView = [UIAlertController alertControllerWithTitle:nil message:@"缓冲已清除" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:_alertView animated:YES completion:nil];
        [self performSelector:@selector(dismiss:) withObject:_alertView afterDelay:2];
    }
}

-(void) dismiss:(UIAlertController*) alert {
    [alert dismissViewControllerAnimated:YES completion:nil];
}
@end
