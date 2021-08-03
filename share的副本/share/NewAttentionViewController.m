//
//  NewAttentionViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/28.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "NewAttentionViewController.h"
#import "NewAttentionTableViewCell.h"
@interface NewAttentionViewController ()

@end

@implementation NewAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
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
    [_tableView registerClass:[NewAttentionTableViewCell class] forCellReuseIdentifier:@"0"];
    [_tableView registerClass:[NewAttentionTableViewCell class] forCellReuseIdentifier:@"1"];
    [_tableView registerClass:[NewAttentionTableViewCell class] forCellReuseIdentifier:@"2"];
    [_tableView registerClass:[NewAttentionTableViewCell class] forCellReuseIdentifier:@"3"];
    [_tableView registerClass:[NewAttentionTableViewCell class] forCellReuseIdentifier:@"4"];
    [_tableView registerClass:[NewAttentionTableViewCell class] forCellReuseIdentifier:@"5"];
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NewAttentionTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 1) {
        NewAttentionTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 2) {
        NewAttentionTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 3) {
        NewAttentionTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 4) {
        NewAttentionTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"4" forIndexPath:indexPath];
        return cell;
    } else {
        NewAttentionTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"5" forIndexPath:indexPath];
        return cell;
    }
}

@end
