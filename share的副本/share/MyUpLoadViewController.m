//
//  MyUpLoadViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/29.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "MyUpLoadViewController.h"
#import "MyUpLoadTableViewCell.h"
#import "MyUpLoadOneTableViewCell.h"
#import "MyUpLoadTwoTableViewCell.h"
@interface MyUpLoadViewController ()

@end

@implementation MyUpLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3, self.view.bounds.size.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.userInteractionEnabled = YES;
    _scrollView.alwaysBounceHorizontal = NO;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    imageView.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/essay_background.png"];
    [self.view addSubview:imageView];
    
    UIImageView* imageViewOne = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/essay_line.png"]];
    imageViewOne.frame = CGRectMake(self.view.bounds.size.width / 3, 0, 1, 40);
    UIImageView* imageViewTwo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/essay_line.png"]];
    imageViewTwo.frame = CGRectMake(2 * self.view.bounds.size.width / 3, 0, 1, 40);
    [imageView addSubview:imageViewOne];
    [imageView addSubview:imageViewTwo];
    
    NSArray* nameArray = [[NSArray alloc] initWithObjects:@"上传时间", @"推荐最多", @"分享最多", nil];
    
    _segmentControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    [_segmentControl insertSegmentWithTitle:[nameArray objectAtIndex:0] atIndex:0 animated:YES];
    [_segmentControl insertSegmentWithTitle:[nameArray objectAtIndex:1] atIndex:1 animated:YES];
    [_segmentControl insertSegmentWithTitle:[nameArray objectAtIndex:2] atIndex:2 animated:YES];
    _segmentControl.selectedSegmentIndex = 0;
    [_segmentControl addTarget:self action:@selector(segChange:) forControlEvents:UIControlEventValueChanged];
    _segmentControl.tintColor = [UIColor grayColor];
    [_segmentControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [self.view addSubview:_segmentControl];
    
    _tableViewFirst = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, self.view.bounds.size.height - 220) style:UITableViewStylePlain];
    _tableViewFirst.delegate = self;
    _tableViewFirst.dataSource = self;
    _tableViewSecond = [[UITableView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width, 40, self.view.bounds.size.width, self.view.bounds.size.height - 220) style:UITableViewStylePlain];
    _tableViewSecond.delegate = self;
    _tableViewSecond.dataSource = self;
    _tableViewThird = [[UITableView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * 2, 40, self.view.bounds.size.width, self.view.bounds.size.height - 220) style:UITableViewStylePlain];
    _tableViewThird.delegate = self;
    _tableViewThird.dataSource = self;
    
    [_tableViewFirst registerClass:[MyUpLoadTableViewCell class] forCellReuseIdentifier:@"0"];
    [_tableViewFirst registerClass:[MyUpLoadTableViewCell class] forCellReuseIdentifier:@"1"];
    [_tableViewFirst registerClass:[MyUpLoadTableViewCell class] forCellReuseIdentifier:@"2"];
    [_tableViewFirst registerClass:[MyUpLoadTableViewCell class] forCellReuseIdentifier:@"3"];
    [_tableViewFirst registerClass:[MyUpLoadTableViewCell class] forCellReuseIdentifier:@"4"];
    [_tableViewSecond registerClass:[MyUpLoadOneTableViewCell class] forCellReuseIdentifier:@"0"];
    [_tableViewSecond registerClass:[MyUpLoadOneTableViewCell class] forCellReuseIdentifier:@"1"];
    [_tableViewSecond registerClass:[MyUpLoadOneTableViewCell class] forCellReuseIdentifier:@"2"];
    [_tableViewSecond registerClass:[MyUpLoadOneTableViewCell class] forCellReuseIdentifier:@"3"];
    [_tableViewSecond registerClass:[MyUpLoadOneTableViewCell class] forCellReuseIdentifier:@"4"];
    [_tableViewThird registerClass:[MyUpLoadTwoTableViewCell class] forCellReuseIdentifier:@"0"];
    [_tableViewThird registerClass:[MyUpLoadTwoTableViewCell class] forCellReuseIdentifier:@"1"];
    [_tableViewThird registerClass:[MyUpLoadTwoTableViewCell class] forCellReuseIdentifier:@"2"];
    [_tableViewThird registerClass:[MyUpLoadTwoTableViewCell class] forCellReuseIdentifier:@"3"];
    [_tableViewThird registerClass:[MyUpLoadTwoTableViewCell class] forCellReuseIdentifier:@"4"];
    
    [_scrollView addSubview:_tableViewFirst];
    [_scrollView addSubview:_tableViewSecond];
    [_scrollView addSubview:_tableViewThird];
}


-(void) segChange:(UISegmentedControl*) segmentedControl {
    if (segmentedControl.selectedSegmentIndex == 0) {
        [_scrollView scrollRectToVisible:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) animated:YES];
    } else if (segmentedControl.selectedSegmentIndex == 1) {
        [_scrollView scrollRectToVisible:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height) animated:YES];
    } else {
        [_scrollView scrollRectToVisible:CGRectMake(2 * self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height) animated:YES];
    }
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _tableViewFirst) {
        if (indexPath.row == 0) {
            MyUpLoadTableViewCell* cell = [_tableViewFirst dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 1) {
            MyUpLoadTableViewCell* cell = [_tableViewFirst dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 2) {
            MyUpLoadTableViewCell* cell = [_tableViewFirst dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 3) {
            MyUpLoadTableViewCell* cell = [_tableViewFirst dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
            return cell;
        } else {
            MyUpLoadTableViewCell* cell = [_tableViewFirst dequeueReusableCellWithIdentifier:@"4" forIndexPath:indexPath];
            return cell;
        }
        
    } else if (tableView == _tableViewSecond) {
        if (indexPath.row == 0) {
            MyUpLoadOneTableViewCell* cell = [_tableViewSecond dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 1) {
            MyUpLoadOneTableViewCell* cell = [_tableViewSecond dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 2) {
            MyUpLoadOneTableViewCell* cell = [_tableViewSecond dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 3) {
            MyUpLoadOneTableViewCell* cell = [_tableViewSecond dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
            return cell;
        } else {
            MyUpLoadOneTableViewCell* cell = [_tableViewSecond dequeueReusableCellWithIdentifier:@"4" forIndexPath:indexPath];
            return cell;
        }
    } else {
        if (indexPath.row == 0) {
            MyUpLoadTwoTableViewCell* cell = [_tableViewThird dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 1) {
            MyUpLoadTwoTableViewCell* cell = [_tableViewThird dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 2) {
            MyUpLoadTwoTableViewCell* cell = [_tableViewThird dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 3) {
            MyUpLoadTwoTableViewCell* cell = [_tableViewThird dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
            return cell;
        } else {
            MyUpLoadTwoTableViewCell* cell = [_tableViewThird dequeueReusableCellWithIdentifier:@"4" forIndexPath:indexPath];
            return cell;
        }
    }
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0) {
        _segmentControl.selectedSegmentIndex = 0;
    } else if (scrollView.contentOffset.x  == self.view.bounds.size.width) {
        _segmentControl.selectedSegmentIndex = 1;
    } else if(scrollView.contentOffset.x  == self.view.bounds.size.width * 2){
        _segmentControl.selectedSegmentIndex = 2;
    }
}

@end
