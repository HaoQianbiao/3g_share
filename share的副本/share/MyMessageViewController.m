//
//  MyMessageViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/28.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "MyMessageViewController.h"
#import "MyMessageTableViewCell.h"
#import "NewAttentionViewController.h"
#import "PrivateLetterViewController.h"
@interface MyMessageViewController ()

@end

@implementation MyMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage* image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/back_img.png"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.backIndicatorImage = image;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = image;
    self.navigationItem.backBarButtonItem.title = @"我的信息";
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[MyMessageTableViewCell class] forCellReuseIdentifier:@"0"];
    _nameArray = [[NSArray alloc] initWithObjects: @"评论", @"7", @"推荐我的", @"9", @"新关注的", @"5", @"私信", @"4", @"活动通知", @"1", nil];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(370, 5, 20, 20)];
    _label.tintColor = [UIColor blueColor];
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

    MyMessageTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(370, 15, 20, 20)];
    _label.textColor = [UIColor blueColor];
    cell.textLabel.text = [_nameArray objectAtIndex:indexPath.row * 2];
    _label.text = [_nameArray objectAtIndex:indexPath.row * 2 + 1];
    [cell.contentView addSubview:_label];
    return cell;

}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 | indexPath.row == 1 | indexPath.row == 4) {
        _alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"目前没有新内容" preferredStyle:UIAlertControllerStyleAlert];
        [_alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIActionSheetStyleDefault handler:nil]];
        [self presentViewController:_alertView animated:true completion:nil];
    } else if (indexPath.row == 2) {
        NewAttentionViewController* newAttentionViewController = [[NewAttentionViewController alloc] init];
        [self.navigationController pushViewController:newAttentionViewController animated:YES];
    } else {
        PrivateLetterViewController* privateLetterViewController = [[PrivateLetterViewController alloc] init];
        [self.navigationController pushViewController:privateLetterViewController animated:YES];
    }
}
@end
