//
//  BigWhiteViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "BigWhiteViewController.h"
#import "BigWhiteTableViewCell.h"
@interface BigWhiteViewController ()

@end

@implementation BigWhiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 380, 30)];
    UIImageView* userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 3, 25, 25)];
    userImageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/sousuo-copy.png"];
    [_textField setValue:[NSNumber numberWithInt:35] forKey:@"paddingLeft"];
    _textField.font = [UIFont systemFontOfSize:15];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.text = @"大白";
    [_textField addSubview:userImageView];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[BigWhiteTableViewCell class] forCellReuseIdentifier:@"0"];
    [_tableView registerClass:[BigWhiteTableViewCell class] forCellReuseIdentifier:@"1"];
    [self.view addSubview:_tableView];
    [self.view addSubview:_textField];
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 80;
    } else {
        return 20;
    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return self.view.bounds.size.height - 400;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        BigWhiteTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        BigWhiteTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
@end
