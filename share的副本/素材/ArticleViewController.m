//
//  ArticleViewController.m
//  share
//
//  Created by haoqianbiao on 2021/7/25.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "ArticleViewController.h"
#import "ArticleTableViewCell.h"
#import "ArticleOneTableViewCell.h"
#import "ArticleTwoTableViewCell.h"
@interface ArticleViewController ()

@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/actionbar.png"] forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"文章";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor whiteColor]}];
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
    
    NSArray* nameArray = [[NSArray alloc] initWithObjects:@"精选文章", @"热门推荐", @"全部文章", nil];
    
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
    
    [_tableViewFirst registerClass:[ArticleTableViewCell class] forCellReuseIdentifier:@"0"];
    [_tableViewFirst registerClass:[ArticleTableViewCell class] forCellReuseIdentifier:@"1"];
    [_tableViewFirst registerClass:[ArticleTableViewCell class] forCellReuseIdentifier:@"2"];
    [_tableViewFirst registerClass:[ArticleTableViewCell class] forCellReuseIdentifier:@"3"];
    [_tableViewFirst registerClass:[ArticleTableViewCell class] forCellReuseIdentifier:@"4"];
    [_tableViewSecond registerClass:[ArticleOneTableViewCell class] forCellReuseIdentifier:@"0"];
    [_tableViewSecond registerClass:[ArticleOneTableViewCell class] forCellReuseIdentifier:@"1"];
    [_tableViewSecond registerClass:[ArticleOneTableViewCell class] forCellReuseIdentifier:@"2"];
    [_tableViewSecond registerClass:[ArticleOneTableViewCell class] forCellReuseIdentifier:@"3"];
    [_tableViewSecond registerClass:[ArticleOneTableViewCell class] forCellReuseIdentifier:@"4"];
    [_tableViewThird registerClass:[ArticleTwoTableViewCell class] forCellReuseIdentifier:@"0"];
    [_tableViewThird registerClass:[ArticleTwoTableViewCell class] forCellReuseIdentifier:@"1"];
    [_tableViewThird registerClass:[ArticleTwoTableViewCell class] forCellReuseIdentifier:@"2"];
    [_tableViewThird registerClass:[ArticleTwoTableViewCell class] forCellReuseIdentifier:@"3"];
    [_tableViewThird registerClass:[ArticleTwoTableViewCell class] forCellReuseIdentifier:@"4"];
    
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
            ArticleTableViewCell* cell = [_tableViewFirst dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 1) {
            ArticleTableViewCell* cell = [_tableViewFirst dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 2) {
            ArticleTableViewCell* cell = [_tableViewFirst dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 3) {
            ArticleTableViewCell* cell = [_tableViewFirst dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
            return cell;
        } else {
            ArticleTableViewCell* cell = [_tableViewFirst dequeueReusableCellWithIdentifier:@"4" forIndexPath:indexPath];
            return cell;
        }
        
    } else if (tableView == _tableViewSecond) {
        if (indexPath.row == 0) {
            ArticleOneTableViewCell* cell = [_tableViewSecond dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 1) {
            ArticleOneTableViewCell* cell = [_tableViewSecond dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 2) {
            ArticleOneTableViewCell* cell = [_tableViewSecond dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 3) {
            ArticleOneTableViewCell* cell = [_tableViewSecond dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
            return cell;
        } else {
            ArticleOneTableViewCell* cell = [_tableViewSecond dequeueReusableCellWithIdentifier:@"4" forIndexPath:indexPath];
            return cell;
        }
    } else {
        if (indexPath.row == 0) {
            ArticleTwoTableViewCell* cell = [_tableViewThird dequeueReusableCellWithIdentifier:@"0" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 1) {
            ArticleTwoTableViewCell* cell = [_tableViewThird dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 2) {
            ArticleTwoTableViewCell* cell = [_tableViewThird dequeueReusableCellWithIdentifier:@"2" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 3) {
            ArticleTwoTableViewCell* cell = [_tableViewThird dequeueReusableCellWithIdentifier:@"3" forIndexPath:indexPath];
            return cell;
        } else {
            ArticleTwoTableViewCell* cell = [_tableViewThird dequeueReusableCellWithIdentifier:@"4" forIndexPath:indexPath];
            return cell;
        }
    }
}
-(void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0) {
        _segmentControl.selectedSegmentIndex = 0;
    } else if (scrollView.contentOffset.x  >= self.view.bounds.size.width) {
        _segmentControl.selectedSegmentIndex = 1;
    } else if(scrollView.contentOffset.x  == self.view.bounds.size.width * 2){
        _segmentControl.selectedSegmentIndex = 2;
    }
}

@end
