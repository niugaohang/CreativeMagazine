//
//  UIView+QuickCreateUI.m
//  testPro
//
//  Created by 冯宝东 on 16/1/26.
//  Copyright © 2016年 冯宝东. All rights reserved.
//


// pod update for 0.0.4

#import "UIView+FBDQuickCreateUI.h"


@implementation UIView (FBDQuickCreateUI)
/**
 *  快速创建UIButton
 *
 *  @param frame 位置
 *
 *  @return UIButton 实例
 */
-(UIButton*)fbd_quickCreateUIButtonWithFrame:(CGRect)frame
{
    UIButton*fbdButton=[[UIButton alloc] initWithFrame:frame];
    [fbdButton setTitle:@"默认" forState:UIControlStateNormal];
    [fbdButton setBackgroundColor:[UIColor purpleColor]];
    return fbdButton;
    
}
/**
 *  快速创建UILabel
 *
 *  @param frame 位置
 *
 *  @return UILabel 实例
 */
-(UILabel*)fbd_quickCreateUILabelWithFrame:(CGRect)frame
{
    UILabel*fbdLabel=[[UILabel alloc] initWithFrame:frame];
    fbdLabel.text=@"默认";
    [fbdLabel setBackgroundColor:[UIColor whiteColor]];
    return fbdLabel;

}

/**
 *  快速创建UIView
 *
 *  @param frame 位置
 *
 *  @return UIView 实例
 */
-(UIView*)fbd_quickCreateUIViewWithFrame:(CGRect)frame
{
    UIView*fbdView=[[UIView alloc] initWithFrame:frame];
    fbdView.backgroundColor=[self randomColor];
    return fbdView;
}

/**
 *  快速创建UIImageView
 *
 *  @param frame 位置
 *
 *  @return UIImageView 实例
 */
-(UIImageView*)fbd_quickCreateUIImageViewWithFrame:(CGRect)frame withImageName:(NSString*)imageName
{
    UIImageView*fbdImageView=[[UIImageView alloc] initWithFrame:frame];
    [fbdImageView setBackgroundColor:[UIColor purpleColor]];
    if (imageName)
    {
        fbdImageView.image=[self fbd_quickCreateUIImageWithImageName:imageName];        
    }

    return fbdImageView;

}

/**
 *  快速创建UIImage
 *
 *  @param frame 位置
 *
 *  @return UIImageView 实例
 */
-(UIImage*)fbd_quickCreateUIImageWithImageName:(NSString*)imageName
{
//    NSString *file = [[NSBundle bundleWithIdentifier:@"MJRefresh.bundle"] pathForResource:imageName ofType:nil];
//    UIImage *fbdImage = [UIImage imageWithContentsOfFile:file];
    if (!imageName||[imageName isEqual:[NSNull null]]||![imageName isKindOfClass:[NSString class]])
    {
        imageName=@"zuixin_a@3x";
    }
    UIImage*fbdImage=[UIImage imageNamed:imageName];
    return fbdImage;

}
/**
 *  快速创建UITextFiled
 *
 *  @param frame 位置
 *
 *  @param placeHold 占位符
 *
 *  @return UIImageView 实例
 */
-(UITextField*)fbd_quickCreateUITextFeildWithFrame:(CGRect)frame withPlaceHold:(NSString*)placeHold
{
    
    UITextField*fbd_textField=[[UITextField alloc] initWithFrame:frame];
    fbd_textField.placeholder=placeHold;
    fbd_textField.backgroundColor= [UIColor whiteColor];
    return fbd_textField;
    

}

/**
 *     @author 冯宝东, 16-02-22 14:02:32
 *
 *     快速创建 UITableView
 *
 *     @param frame    位置
 *     @param delegateDataSource 代理和数据源
 *
 *     @return <#return value description#>
 */
-(UITableView*)fbd_quickCreateUITabdWithleViewFrame:(CGRect)frame andDelegateAndDataSource:(id)delegateDataSource;
{
    if ([delegateDataSource isMemberOfClass:[UIViewController class]])
    {
        UIViewController* VC=(UIViewController*)delegateDataSource;
        VC.automaticallyAdjustsScrollViewInsets=NO;
    }
   
    UITableView* myTableView=[[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [myTableView setBackgroundColor:[UIColor whiteColor]];

    myTableView.delegate=delegateDataSource;
    myTableView.dataSource=delegateDataSource;
    
    return myTableView;

}


#pragma mark  快速获取frame的各个属性
/**
 *  快速获取起点X坐标
 *
 *  @return 起点X坐标
 */
-(CGFloat)view_orignX
{
    return self.frame.origin.x;
}

-(void)setView_orignX:(CGFloat)x
{

    CGRect old_NewCGRect=self.frame;
    old_NewCGRect.origin.x=x;
    self.frame=old_NewCGRect;
    
}


/**
 *  快速获取起点Y坐标
 *
 *  @return 起点Y坐标
 */
-(CGFloat)view_orignY
{
    return self.frame.origin.y;
}
-(void)setView_orignY:(CGFloat)y
{
    CGRect old_NewCGRect=self.frame;
    old_NewCGRect.origin.y=y;
    self.frame=old_NewCGRect;

}
/**
 *  快速获取宽度
 *
 *  @return 获取宽度
 */
-(CGFloat)view_sizeWidth
{
    return self.frame.size.width;
}
-(void)setView_sizeWidth:(CGFloat)width
{
    CGRect old_NewCGRect=self.frame;
    old_NewCGRect.size.width=width;
    self.frame=old_NewCGRect;
}




/**
 *  快速获取高度
 *
 *  @return 获取高度
 */
-(CGFloat)view_sizeHeight
{
    return self.frame.size.height;
}

-(void)setView_sizeHeight:(CGFloat)height
{
    CGRect old_NewCGRect=self.frame;
    old_NewCGRect.size.height=height;
    self.frame=old_NewCGRect;

}
-(void)setView_addSizeHeightBy:(CGFloat)height
{
    CGRect old_NewCGRect=self.frame;
    old_NewCGRect.size.height+=height;
    self.frame=old_NewCGRect;

}

/**
 *  快速获取     center 的坐标
 *
 *  @return     center 的坐标
 */
-(CGPoint)view_center
{
    return   self.center;

}
-(void)setView_centerX:(CGFloat)centerX centerY:(CGFloat)centerY
{

    CGPoint old_Center=self.center;
    old_Center.x=centerX;
    old_Center.y=centerY;
    self.center=old_Center;
}

/**
 *  快速获取center 的 X 坐标
 *
 *  @return center 的 X 坐标
 */
-(CGFloat)view_centerX
{
    CGPoint old_Center=self.center;
    return old_Center.x;

}
-(void)setView_centerX:(CGFloat)centerX
{

    CGPoint old_Center=self.center;
    old_Center.x=centerX;
    self.center=old_Center;

}

/**
 *  快速获取     center 的 Y 坐标
 *
 *  @return     center 的 Y 坐标
 */
-(CGFloat)view_centerY
{
        CGPoint old_Center=self.center;
        return old_Center.y;
}
-(void)setView_centerY:(CGFloat)centerY
{
    
    CGPoint old_Center=self.center;
    old_Center.y=centerY;
    self.center=old_Center;


}

/**
 *  通过所有子视图的遍历获得自身的高度
 *
 *  @return 自身的高度
 */
-(CGFloat)viewHeightByAllSubView
{
    CGFloat maxHeight=0.0;
    if (self.subviews)
    {
//   这种方法只能按照顺序 从上向下一次排列才能就算
//        UIView*lastView=[self.subviews lastObject];
//        NSLog(@"lastView:%@",lastView);
//        return CGRectGetMaxY(lastView.frame);
        
        for (UIView* eveyView in self.subviews)
        {
            CGFloat everyOriginY=[eveyView view_orignY]+CGRectGetHeight(eveyView.frame);
//            NSLog(@"eveyView:%@  . everyOriginY:%f",eveyView,everyOriginY);
            maxHeight=maxHeight>everyOriginY?maxHeight:everyOriginY;
            
            
        }
        return maxHeight;
        
    }else
    {
        return 0;
    }
    return 0;
}

/**
 *  自动计算Label的高度
 *
 *  @param desStr    传过去的字符串
 *  @param placeLabel 计算的label
 *
 *  @return 返回的高度
 */
- (float) calculateUserDesprationLabelDesprationHeight:(NSString*)desStr withLabel:(UILabel*)placeLabel
{
    
    float totalHeight=0;
    if (desStr) {
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle1.lineSpacing=4;
        NSDictionary *attributeDic = @{NSFontAttributeName:placeLabel.font,NSParagraphStyleAttributeName:paragraphStyle1};
        
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]
                                                    initWithString:desStr
                                                    attributes:attributeDic];
        NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin;
        
        CGRect  ctRect=[attributedStr boundingRectWithSize:CGSizeMake(placeLabel.frame.size.width,MAXFLOAT)
                                                   options:options
                                                   context:nil];
        placeLabel.attributedText=attributedStr;
        CGRect placeLabelCGRect= placeLabel.frame;;
        placeLabelCGRect.size.height= ceilf(ctRect.size.height);
        placeLabelCGRect.size.width=ceilf(ctRect.size.width);
        placeLabel.frame=placeLabelCGRect;
        totalHeight= ceilf(ctRect.size.height);
        }
    
    
    return totalHeight;
}
/**
 *  自动计算Label的高度
 *
 *  @param label  计算的label
 *  @param desStr 需要传过去的字符串
 *
 *  @return 返回的宽度
 */

- (float) calculateLabelWidth:(UILabel*)label comeTextStr:(NSString*)desStr
{
    
    float totalWidth=0;
    if (desStr) {
        
        
        NSDictionary *attributeDic = @{NSFontAttributeName:label.font};
        
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]
                                                    initWithString:desStr
                                                    attributes:attributeDic];
        NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin;
        
        CGRect  ctRect=[attributedStr boundingRectWithSize:CGSizeMake(MAXFLOAT,label.frame.size.height)
                                                   options:options
                                                   context:nil];
        label.attributedText=attributedStr;
        
        
        CGRect placeLabelCGRect= label.frame;;
        placeLabelCGRect.size.width=ceilf(ctRect.size.width);
        //        placeLabelCGRect.size.height=ceilf(ctRect.size.height);
        label.frame=placeLabelCGRect;
        
        totalWidth=ceilf(ctRect.size.width);
    }
    
    return totalWidth;
    
}
/**
 *  计算字符串的宽度并设置特殊文字的字颜色
 *
 *  @param comeText 传过去的字符串
 *  @param label    计算的label
 *  @param redStr   特殊的文字
 *
 *  @return 返回的宽度
 */
- (CGFloat) calculateTopDespritionTextWidthWith:(NSString*) comeText width:(UILabel*)label  withRedText:(NSString*) redStr
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:comeText];
    NSRange myRange=[comeText rangeOfString:redStr];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:myRange];
    label.attributedText=str;
    CGRect topLabelCGRect= label.frame;

    NSDictionary *attribute = @{NSFontAttributeName:label.font};
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]
                                                initWithString:comeText
                                                attributes:attribute];
    
    CGSize successSize=[attributedStr boundingRectWithSize:CGSizeMake(MAXFLOAT,label.frame.size.height)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil].size;
    
    label.frame= topLabelCGRect;
    return successSize.height;
}

/**
 *  随即色
 *
 *  @return 颜色实例
 */
-(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


/**
 *  快速创建九宫格
 *
 *  @param frame      九宫格的frame
 *  @param H          代表横排有几个Item
 *  @param imageArray 图片数组
 *  @param titleArray 标题数组
 *
 *  @return 九宫格实例视图
 */

-(UIView*) fbd_quickCreateUIItemNightView:(CGRect)frame withHorizontal:(NSInteger)H wihImageArray:(NSArray*)imageArray withTitleArray:(NSArray*)titleArray withTarget:(id)tSender
{

    
    
    CGFloat SW=    [UIScreen mainScreen].bounds.size.width;

    UIView* nightItemView=[self fbd_quickCreateUIViewWithFrame:frame];
    
    CGFloat paddingLeftRight=34;
    CGFloat paddingTop=20;
    CGFloat spaceForVer=44;
//    CGFloat spaceForHor=30;
//    CGFloat everyItemWidth=(SW-2*paddingLeftRight-(H-1)*spaceForHor)/H;
    CGFloat everyItemWidth=60;
    CGFloat spaceForHor=(SW-2*paddingLeftRight-(H)*everyItemWidth)/(H-1);

    
     

    
    
    
    NSInteger totalNumber= titleArray.count;
    if(titleArray&&imageArray)
    {
        for (int i=0; i<totalNumber; i++)
        {
            
            CGFloat originX=paddingLeftRight+(i%H)*(everyItemWidth+spaceForHor);
            CGFloat originY=paddingTop+(i/H)*(everyItemWidth+spaceForVer);
            CGRect everyCGRect=CGRectMake(originX, originY, everyItemWidth, everyItemWidth*(11.0/8.0));
            UIView* everyItemView= [[FBDImageAndTitleView alloc] initWithFrame:everyCGRect withImageName:[imageArray objectAtIndex:i] withTitleStr:[titleArray objectAtIndex:i]];
            everyItemView.tag=i;
            [nightItemView addSubview:everyItemView];
            
            UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc] initWithTarget:tSender action:@selector(tapSelectForNightItemViewTapGesture:)];
            
            [everyItemView addGestureRecognizer:tap];
            
            
        }
    
    }else if (imageArray&&!titleArray)
    {
        totalNumber=imageArray.count;
        
        for (int i=0; i<totalNumber; i++)
        {
            
            CGFloat originX=paddingLeftRight+(i%H)*(everyItemWidth+spaceForHor);
            CGFloat originY=paddingTop+(i/H)*(everyItemWidth+spaceForVer);
            CGRect everyCGRect=CGRectMake(originX, originY, everyItemWidth, everyItemWidth*(11.0/8.0));
            UIView* everyItemView= [[FBDImageAndTitleView alloc] initWithFrame:everyCGRect withImageName:[imageArray objectAtIndex:i] withTitleStr:nil];
            everyItemView.tag=i;
            [nightItemView addSubview:everyItemView];
            
            UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc] initWithTarget:tSender action:@selector(tapSelectForNightItemViewTapGesture:)];
            
            [everyItemView addGestureRecognizer:tap];
            
            
        }
    
    
    }else if (titleArray&&!imageArray)
    {
    
    
    
    
    
    
    }


    
    
    CGFloat viewHeight=[nightItemView viewHeightByAllSubView];
    [nightItemView setView_sizeHeight:viewHeight];
    return nightItemView;

}




-(void)tapSelectForNightItemViewTapGesture:(UITapGestureRecognizer*)tap
{

    
    

}








@end

#define bottomTitleHeight   20
@implementation FBDImageAndTitleView
{
    UIImageView*    _topImageView;
    UILabel*        _bottomLabel;

}


-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString*)imageStr withTitleStr:(NSString*)titleStr
{
    self=[super initWithFrame:frame];
    if (self)
    {
        
        // 有文字 有图片
        if (imageStr&&titleStr)
        {
            
            _topImageView=[self fbd_quickCreateUIImageViewWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-bottomTitleHeight) withImageName:imageStr];
            if ([imageStr isKindOfClass:[UIImage class]])
            {
                _topImageView.image=(UIImage*)imageStr;
            }
            _bottomLabel=[self fbd_quickCreateUILabelWithFrame:CGRectMake(0, CGRectGetHeight(_topImageView.frame), frame.size.width, bottomTitleHeight)];
            _topImageView.backgroundColor=[UIColor whiteColor];
            _bottomLabel.text=titleStr;
            _bottomLabel.textAlignment=NSTextAlignmentCenter;
            _bottomLabel.backgroundColor=[UIColor yellowColor];
            _bottomLabel.font=[UIFont systemFontOfSize:12];
            [self addSubview:_topImageView];
            [self addSubview:_bottomLabel];
        //  有图片 无文字
        }else if(imageStr&&!titleStr)
        {
        
           _topImageView=[self fbd_quickCreateUIImageViewWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) withImageName:imageStr];
            if ([imageStr isKindOfClass:[UIImage class]])
            {
                _topImageView.image=(UIImage*)imageStr;
            }
            _topImageView.backgroundColor=[UIColor whiteColor];
            [self addSubview:_topImageView];
            
            
            
        //  有文字 没图片
        }else if(!imageStr&&titleStr)
        {
        
        
        }
        
        
        
    }


    return self;
}
-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString*)imageStr withTitleStr:(NSString*)titleStr withDeleteAble:(BOOL)able
{

    self=[self initWithFrame:frame withImageName:imageStr withTitleStr:titleStr];
    if (able)
    {
        
        self.deleteButton=[self fbd_quickCreateUIButtonWithFrame:CGRectMake(CGRectGetWidth(frame)-20, 0, 20, 20)];
        [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
        self.deleteButton.backgroundColor=[UIColor redColor];
        self.deleteButton.layer.cornerRadius=10;
        
        [self addSubview:self.deleteButton];

        
        
        
    }else
    {
    
    
    }

    return self;


}





@end
