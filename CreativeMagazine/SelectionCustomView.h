//
//  SelectionCustomView.h
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/22.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@class ToTopLabel;

@interface SelectionCustomView : UIView






@property (nonatomic,retain)UIImageView *titleImgView;

@property(nonatomic,retain)UIButton *shareBtn;

@property(nonatomic,retain)UIButton *imgBtn;

@property(nonatomic,retain)UILabel *dateLab;

@property(nonatomic,retain)UIImageView *passImgView;

@property (nonatomic,retain)ToTopLabel *contentLab;



@property (nonatomic,unsafe_unretained) NSUInteger index;

@property (nonatomic,strong) SelectionModelList *reModel;

- (id)initWithFrame:(CGRect)frame;


@end
