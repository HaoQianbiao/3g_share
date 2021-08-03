//
//  ActivityTableViewCell.m
//  share
//
//  Created by haoqianbiao on 2021/7/27.
//  Copyright © 2021 haoqianbiao. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 395, 250)];
    _imageViewOne.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/7 活动_1.jpg"];
    
    _imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 395, 250)];
    _imageViewTwo.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/7 活动_2.jpg"];
    _imageViewThree = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 395, 250)];
    _imageViewThree.image = [UIImage imageNamed:@"/Users/haoqianbiao/Desktop/test1/UI/share/素材/7 活动_3.jpg"];
    
    if ([reuseIdentifier isEqualToString:@"0"]) {
        [self.contentView addSubview:_imageViewOne];
    } else if ([reuseIdentifier isEqualToString:@"1"]) {
        [self.contentView addSubview:_imageViewTwo];
    } else {
        [self.contentView addSubview:_imageViewThree];
    }
    
    return self;
}
@end
