//
//  PrivateLetterViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/28.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "PrivateLetterViewController.h"
#import "PrivateLetterTableViewCell.h"
@interface PrivateLetterViewController ()

@end

@implementation PrivateLetterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/back_img.png"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.navigationBar.backIndicatorImage = image;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = image;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[PrivateLetterTableViewCell class] forCellReuseIdentifier:@"0"];
    [_tableView registerClass:[PrivateLetterTableViewCell class] forCellReuseIdentifier:@"1"];
    [_tableView registerClass:[PrivateLetterTableViewCell class] forCellReuseIdentifier:@"2"];
    [_tableView registerClass:[PrivateLetterTableViewCell class] forCellReuseIdentifier:@"3"];
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        PrivateLetterTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 1) {
        PrivateLetterTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 2) {
        PrivateLetterTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        return cell;
    } else {
        PrivateLetterTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
        return cell;
    }
}

@end
