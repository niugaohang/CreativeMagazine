//
//  CommodityCell.h
//  CreativeMagazine
//
//  Created by 牛高航 on 2016/9/27.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShoppingModelBaseClass;
@interface CommodityCell : UITableViewCell
@property (retain, nonatomic)UIImageView *imgView;


@property (retain, nonatomic)UILabel *titleLab;
@property (retain, nonatomic)UIImageView *picImgView;
@property (retain, nonatomic)UILabel *picLab;
@property (retain, nonatomic)  UILabel *lineLabel;
@property (nonatomic,strong) ShoppingModelBaseClass *reModel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(CGFloat)cellFrameHeigth:(ShoppingModelBaseClass*)aModel;


@end
