//
//  SelectionCustomView.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/22.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "SelectionCustomView.h"




@implementation SelectionCustomView




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self configerCustomUI];
    }
    return self;
}

-(void)configerCustomUI
{
    _titleImgView=[[UIImageView alloc]init];
    [self addSubview:_titleImgView];
    
    _shareBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [_titleImgView addSubview:_shareBtn];
    
    _imgBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_imgBtn];
    
    _dateLab=[[UILabel alloc]init];
    
    [self addSubview:_dateLab];
    
    _passImgView=[[UIImageView alloc]init];
    [self addSubview:_passImgView];
    
    _contentLab=[[ToTopLabel alloc]init];
    
    [self addSubview:_contentLab];

}


-(void)setResultModel:(SelectionModelList *)resultModel
{
    _reModel = resultModel;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    _titleImgView.frame=CGRectMake(0, 0,VIEW_WIDTH,VIEW_WIDTH/4.7);
    _titleImgView.image=[UIImage imageNamed:@"vision_header.png"];
    _titleImgView.userInteractionEnabled=YES;
    
    
    _shareBtn.frame=CGRectMake(VIEW_WIDTH-45,20,30, 30);
    
    [_shareBtn setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    
    
    _imgBtn.frame=CGRectMake(0, VIEW_WIDTH/4.7, VIEW_WIDTH, VIEW_WIDTH/1.23);
    
    [_imgBtn setImage:[UIImage imageNamed:@"notfound.png"] forState:UIControlStateNormal];
    
    NSURL *url=[NSURL URLWithString:_reModel.image];
    [_imgBtn sd_setImageWithURL:url forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"notfound.png"]];
    

    _dateLab.frame=CGRectMake(15, VIEW_WIDTH/4.7+VIEW_WIDTH/1.23+5, 100, 30);
    
    _dateLab.text=_reModel.date;
    
    
    _passImgView.frame=CGRectMake(10, VIEW_WIDTH/4.7+VIEW_WIDTH/1.23+5+30+5, VIEW_WIDTH-20, 1);
    _passImgView.image=[UIImage imageNamed:@"passImage.png"];
    
    
    _contentLab.text=_reModel.content;
    _contentLab.numberOfLines=0;
    [_contentLab setVerticalAlignment:VerticalAlignmentTop];

    _contentLab.frame=CGRectMake(15, VIEW_WIDTH/4.7+VIEW_WIDTH/1.23+5+31+5+5, VIEW_WIDTH-30, VIEW_HEIGHT-20-VIEW_WIDTH/4.7-VIEW_WIDTH/1.23-51-49);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
