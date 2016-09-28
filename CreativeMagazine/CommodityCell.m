//
//  CommodityCell.m
//  CreativeMagazine
//
//  Created by 牛高航 on 2016/9/27.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "CommodityCell.h"
#import "Header.h"

static const CGFloat S_WASD = 30.f;   // 上下左右间距

@implementation CommodityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        
        [self create_onViews];
    }
    return self;
}

-(void)create_onViews
{
    
    
    _imgView = [[UIImageView alloc]init];
    [self addSubview:_imgView];
    
    _titleLab = [[UILabel alloc]init];
    [self  addSubview:_titleLab];
    
    _picImgView= [[UIImageView alloc]init];
    [_imgView addSubview:_picImgView];
    
    _picLab= [[UILabel alloc]init];
    [_picImgView  addSubview:_picLab];
    
    _lineLabel=[[UILabel alloc]init];
    [self addSubview:_lineLabel];
    
}

-(void)setResultModel:(ShoppingModelBaseClass *)resultModel
{
    _reModel = resultModel;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSURL *url=[NSURL URLWithString:_reModel.goodsimage];
   
    
    
    [_imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"notfound.png"]];
    if (_reModel.width)
    {
        float imgW= [_reModel.width floatValue];
        float imgH=  [_reModel.height floatValue];
        //添加边框
        _imgView.frame=CGRectMake(S_WASD,15,VIEW_WIDTH-60,(VIEW_WIDTH-60)/(imgW/imgH));
    }
    else{
        float imgW=560;
        float imgH=  560;
        //添加边框
        _imgView.frame=CGRectMake(S_WASD,15,VIEW_WIDTH-60,(VIEW_WIDTH-60)/(imgW/imgH));
    }
//    CALayer * layer = [_imgView layer];
//    layer.borderColor = NNRGBColor(236).CGColor;
//    layer.borderWidth = 0.5f;
    
    _picImgView.image=[UIImage imageNamed:@"price.png"];
    _picImgView.frame=CGRectMake(-8, 20, 61, 40);
    
    _picLab.text=_reModel.price;
    _picLab.frame=CGRectMake(5, 5,61, 30);
    _picLab.font = [UIFont systemFontOfSize:14];
    _picLab.textColor=UIColorFromRGB(0xffffff);
    
    
    
    _titleLab.text=_reModel.goodsname;
    
    _titleLab.numberOfLines = 0;
    //    //设置行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_titleLab.text];
    NSRange allRange = [_titleLab.text rangeOfString:_titleLab.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:4];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:allRange];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:allRange];
    [attributedString addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0x999999) range:allRange];
    _titleLab.attributedText = attributedString;
    CGRect jnRect = [ attributedString boundingRectWithSize:CGSizeMake(VIEW_WIDTH-60, 3000000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    _titleLab.frame=CGRectMake(S_WASD, 15+_imgView.frame.size.height+10,  VIEW_WIDTH-60, jnRect.size.height+5);
    _titleLab.font = [UIFont systemFontOfSize:16];
    _titleLab.textColor=UIColorFromRGB(0x333333);
    
    
    _lineLabel.frame=CGRectMake(0, 15+_imgView.frame.size.height+10+_titleLab.frame.size.height+5-0.5, VIEW_WIDTH, 0.5);
    _lineLabel.backgroundColor = UIColorFromRGB(0xe5e5e5);
    
    
    
}
-(CGFloat)cellFrameHeigth:(ShoppingModelBaseClass*)aModel
{
    NSURL *url=[NSURL URLWithString:aModel.goodsimage];    //        NSLog(@"----%@",arr);
    [_imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"notfound.png"]];
    if (aModel.width)
    {
        float imgW= [aModel.width floatValue];
        float imgH=  [aModel.height floatValue];
        //添加边框
        _imgView.frame=CGRectMake(S_WASD,15,VIEW_WIDTH-60,(VIEW_WIDTH-60)/(imgW/imgH));
    }
    else{
        float imgW=560;
        float imgH=  560;
        //添加边框
        _imgView.frame=CGRectMake(S_WASD,15,VIEW_WIDTH-60,(VIEW_WIDTH-60)/(imgW/imgH));
    }
    
//    CALayer * layer = [_imgView layer];
//    layer.borderColor = NNRGBColor(236).CGColor;
//    layer.borderWidth = 0.5f;
    
    _picImgView.image=[UIImage imageNamed:@"price.png"];
    _picImgView.frame=CGRectMake(-8, 20, 61, 40);
    
    _picLab.text=_reModel.price;
    _picLab.frame=CGRectMake(5, 5,61, 30);
    _picLab.font = [UIFont systemFontOfSize:14];
    _picLab.textColor=UIColorFromRGB(0xffffff);
    
    _titleLab.text=aModel.goodsname;
    _titleLab.numberOfLines = 0;
    //    //设置行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_titleLab.text];
    NSRange allRange = [_titleLab.text rangeOfString:_titleLab.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:4];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:allRange];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:allRange];
    [attributedString addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0x999999) range:allRange];
    _titleLab.attributedText = attributedString;
    CGRect jnRect = [ attributedString boundingRectWithSize:CGSizeMake(VIEW_WIDTH-60, 3000000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    _titleLab.frame=CGRectMake(S_WASD, 15+_imgView.frame.size.height+10,  VIEW_WIDTH-60, jnRect.size.height+5);
    _titleLab.font = [UIFont systemFontOfSize:16];
    _titleLab.textColor=UIColorFromRGB(0x333333);
    
    
    return 15+_imgView.frame.size.height+10+_titleLab.frame.size.height+5;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
