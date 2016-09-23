//
//  NewsTableCell.h
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/23.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VisionMagModel;
@interface NewsTableCell : UITableViewCell

@property (retain, nonatomic)  UIImageView *imgView;

@property (retain, nonatomic)  UILabel *titleLab;

@property (retain, nonatomic)  UILabel *introLab;
@property (retain, nonatomic)  UILabel *lineLabel;

@property (nonatomic,strong) VisionMagModel *reModel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(CGFloat)cellFrameHeigth:(VisionMagModel*)aModel;

@end
