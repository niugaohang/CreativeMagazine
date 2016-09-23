//
//  NewsTableCell.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/23.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "NewsTableCell.h"
#import "Header.h"

static const CGFloat S_WASD = 15.f;   // 上下左右间距

@implementation NewsTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
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
    
    _introLab= [[UILabel alloc]init];
    [self  addSubview:_introLab];
    
    _lineLabel=[[UILabel alloc]init];
    [self addSubview:_lineLabel];
    
}

-(void)setResultModel:(VisionMagModel *)resultModel
{
    _reModel = resultModel;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSURL *url;
    if (_reModel.image)
    {
        url=[NSURL URLWithString:_reModel.image];
    }
    else{
        url=[NSURL URLWithString:_reModel.imageUrl];

    }
    
    
    [_imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"notfound.png"]];
    float imgW= [_reModel.width floatValue];
    float imgH=  [_reModel.height floatValue];
    
    
    NSLog(@"----%f",imgW/imgH);
    //添加边框
    _imgView.frame=CGRectMake(S_WASD,S_WASD,VIEW_WIDTH-30,(VIEW_WIDTH-30)/(imgW/imgH));
    CALayer * layer = [_imgView layer];
    layer.borderColor = NNRGBColor(236, 236, 236).CGColor;
    layer.borderWidth = 0.5f;
    

    
    _titleLab.text=_reModel.title;
    
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
    CGRect jnRect = [ attributedString boundingRectWithSize:CGSizeMake(VIEW_WIDTH-30, 3000000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    _titleLab.frame=CGRectMake(S_WASD, S_WASD+_imgView.frame.size.height+10,  VIEW_WIDTH-30, jnRect.size.height+5);
    _titleLab.font = [UIFont systemFontOfSize:16];
    _titleLab.textColor=UIColorFromRGB(0x333333);

    
    
    _introLab.text=_reModel.content;
    _introLab.numberOfLines = 0;
    //    //设置行间距
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:_introLab.text];
    NSRange allRange1 = [_introLab.text rangeOfString:_introLab.text];
    NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle1 setLineSpacing:4];
    
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:allRange1];
    [attributedString1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:allRange1];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0x999999) range:allRange1];
    _introLab.attributedText = attributedString1;
    CGRect jnRect1 = [ attributedString1 boundingRectWithSize:CGSizeMake(VIEW_WIDTH-30, 3000000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    _introLab.frame=CGRectMake(S_WASD, S_WASD+_imgView.frame.size.height+10+_titleLab.frame.size.height,  VIEW_WIDTH-30, jnRect1.size.height+5);
    _introLab.font = [UIFont systemFontOfSize:14];
    _introLab.textColor=UIColorFromRGB(0x666666);

    _lineLabel.frame=CGRectMake(0, S_WASD+_imgView.frame.size.height+10+_titleLab.frame.size.height+_introLab.frame.size.height+5-0.5, VIEW_WIDTH, 0.5);
    _lineLabel.backgroundColor = UIColorFromRGB(0xe5e5e5);
    
    
    
}
-(CGFloat)cellFrameHeigth:(VisionMagModel*)aModel
{
    NSURL *url;
    if (_reModel.image)
    {
        url=[NSURL URLWithString:_reModel.image];
    }
    else{
        url=[NSURL URLWithString:_reModel.imageUrl];
        
    }
    //        NSLog(@"----%@",arr);
    [_imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"notfound.png"]];
    float imgW= [aModel.width floatValue];
    float imgH=  [aModel.height floatValue];
    
    
    //添加边框
    _imgView.frame=CGRectMake(S_WASD,S_WASD,VIEW_WIDTH-30,(VIEW_WIDTH-30)/(imgW/imgH));
    CALayer * layer = [_imgView layer];
    layer.borderColor = NNRGBColor(236, 236, 236).CGColor;
    layer.borderWidth = 0.5f;
    
    
    
    _titleLab.text=aModel.title;
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
    CGRect jnRect = [ attributedString boundingRectWithSize:CGSizeMake(VIEW_WIDTH-30, 3000000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    _titleLab.frame=CGRectMake(S_WASD, S_WASD+_imgView.frame.size.height+10,  VIEW_WIDTH-30, jnRect.size.height+5);
    _titleLab.font = [UIFont systemFontOfSize:16];
    _titleLab.textColor=UIColorFromRGB(0x333333);
    
    
    _introLab.text=aModel.content;
    _introLab.numberOfLines = 0;
    //    //设置行间距
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:_introLab.text];
    NSRange allRange1 = [_introLab.text rangeOfString:_introLab.text];
    NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle1 setLineSpacing:4];
    
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:allRange1];
    [attributedString1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:allRange1];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0x999999) range:allRange1];
    _introLab.attributedText = attributedString1;
    CGRect jnRect1 = [ attributedString1 boundingRectWithSize:CGSizeMake(VIEW_WIDTH-30, 3000000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
    _introLab.frame=CGRectMake(S_WASD, S_WASD+_imgView.frame.size.height+10+_titleLab.frame.size.height,  VIEW_WIDTH-30, jnRect1.size.height+5);
    _introLab.font = [UIFont systemFontOfSize:14];
    _introLab.textColor=UIColorFromRGB(0x666666);
    
    _lineLabel.frame=CGRectMake(0, S_WASD+_imgView.frame.size.height+10+_titleLab.frame.size.height+_introLab.frame.size.height+5-0.5, VIEW_WIDTH, 0.5);
    _lineLabel.backgroundColor = UIColorFromRGB(0xe5e5e5);
    
  
    return S_WASD+_imgView.frame.size.height+10+_titleLab.frame.size.height+_introLab.frame.size.height+5;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
