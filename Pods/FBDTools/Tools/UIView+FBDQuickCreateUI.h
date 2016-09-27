//
//  UIView+QuickCreateUI.h
//  testPro
//
//  Created by 冯宝东 on 16/1/26.
//  Copyright © 2016年 冯宝东. All rights reserved.
//
#define NavTop     64.0

#define ScreenW    [UIScreen mainScreen].bounds.size.width
#define ScreenH    [UIScreen mainScreen].bounds.size.height

#define NeedViewHeight (ScreenH)-(NavTop)
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define KBarColor [UIColor colorWithRed:244/255.0 green:94/255.0 blue:95/255.0 alpha:1]  //bar的颜色
#define RGB(rgb) [UIColor colorWithRed:(rgb)/255.0 green:(rgb)/255.0 blue:(rgb)/255.0 alpha:1.0]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#import <UIKit/UIKit.h>

@interface UIView (FBDQuickCreateUI)
#pragma mark  快速实例化响应的UI控件
/**
 *  快速创建UIButton
 *
 *  @param frame 位置
 *
 *  @return UIButton 实例
 */
-(UIButton*)fbd_quickCreateUIButtonWithFrame:(CGRect)frame;
/**
 *  快速创建UILabel
 *
 *  @param frame 位置
 *
 *  @return UILabel 实例
 */
-(UILabel*)fbd_quickCreateUILabelWithFrame:(CGRect)frame;

/**
 *  快速创建UIView
 *
 *  @param frame 位置
 *
 *  @return UIView 实例
 */
-(UIView*)fbd_quickCreateUIViewWithFrame:(CGRect)frame;

/**
 *  快速创建UIImageView
 *
 *  @param frame 位置
 *
 *  @return UIImageView 实例
 */
-(UIImageView*)fbd_quickCreateUIImageViewWithFrame:(CGRect)frame withImageName:(NSString*)imageName;

/**
 *  快速创建UIImage
 *
 *  @param frame 位置
 *
 *  @return UIImageView 实例
 */
-(UIImage*)fbd_quickCreateUIImageWithImageName:(NSString*)imageName;


/**
 *  快速创建UITextFiled
 *
 *  @param frame 位置
 *
 *  @param placeHold 占位符
 *
 *  @return UIImageView 实例
 */
-(UITextField*)fbd_quickCreateUITextFeildWithFrame:(CGRect)frame withPlaceHold:(NSString*)placeHold;
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




#pragma mark  快速获取frame的各个属性
/**
 *  快速获取起点X坐标
 *
 *  @return 起点X坐标
 */
-(CGFloat)view_orignX;
-(void)setView_orignX:(CGFloat)x;
/**
 *  快速获取起点Y坐标
 *
 *  @return 起点Y坐标
 */
-(CGFloat)view_orignY;
-(void)setView_orignY:(CGFloat)y;
/**
 *  快速获取宽度
 *
 *  @return 获取宽度
 */
-(CGFloat)view_sizeWidth;
-(void)setView_sizeWidth:(CGFloat)width;


/**
 *  快速获取高度
 *
 *  @return 获取高度
 */
-(CGFloat)view_sizeHeight;
-(void)setView_sizeHeight:(CGFloat)height;
-(void)setView_addSizeHeightBy:(CGFloat)height;


/**
 *  快速获取     center 的坐标
 *
 *  @return     center 的坐标
 */
-(CGPoint)view_center;
-(void)setView_centerX:(CGFloat)centerX centerY:(CGFloat)centerY;
/**
 *  快速获取center 的 X 坐标
 *
 *  @return center 的 X 坐标
 */
-(CGFloat)view_centerX;
-(void)setView_centerX:(CGFloat)centerX;

/**
 *  快速获取     center 的 Y 坐标
 *
 *  @return     center 的 Y 坐标
 */
-(CGFloat)view_centerY;
-(void)setView_centerY:(CGFloat)centerY;






/**
 *  通过所有子视图的遍历获得自身的高度
 *
 *  @return 自身的高度
 */
-(CGFloat)viewHeightByAllSubView;

/**
 *  自动计算Label的高度
 *
 *  @param desStr    传过去的字符串
 *  @param placeLabel 计算的label
 *
 *  @return 返回的高度
 */
- (float) calculateUserDesprationLabelDesprationHeight:(NSString*)desStr withLabel:(UILabel*)placeLabel;
/**
 *  自动计算Label的高度
 *
 *  @param label  计算的label
 *  @param desStr 需要传过去的字符串
 *
 *  @return 返回的宽度
 */
- (float) calculateLabelWidth:(UILabel*)label comeTextStr:(NSString*)desStr;

/**
 *  计算字符串的宽度并设置特殊文字的字颜色
 *
 *  @param comeText 传过去的字符串
 *  @param label    计算的label
 *  @param redStr   特殊的文字
 *
 *  @return 返回的宽度
 */
- (CGFloat)calculateTopDespritionTextWidthWith:(NSString*) comeText width:(UILabel*)label  withRedText:(NSString*) redStr;


/**
 *  随即色
 *
 *  @return 颜色实例
 */
-(UIColor *) randomColor;


/**
 *  快速创建九宫格
 *
 *  @param frame      九宫格的frame
 *  @param H          代表横排有几个Item
 *  @param imageArray 图片数组
 *  @param titleArray 标题数组
 *  @param tSender    tager 绑定
 *
 *  @return 九宫格实例视图
 */

-(UIView*) fbd_quickCreateUIItemNightView:(CGRect)frame withHorizontal:(NSInteger)H wihImageArray:(NSArray*)imageArray withTitleArray:(NSArray*)titleArray withTarget:(id)tSender;


@end

@interface FBDImageAndTitleView : UIView
@property (nonatomic,strong)UIImageView*    topImageView;
@property (nonatomic,strong)UIButton* deleteButton;
@property(nonatomic,strong) NSString* imageName; // 图片名字
@property(nonatomic,strong) NSString* titleName; // 标题名字
/**
 *  上面图片下面文字的 itemView
 *
 *  @param frame    位置和大小
 *  @param imageStr 图片名字
 *  @param titleStr 标题名字
 *
 *  @return 返回的FBDImageAndTitleView 实例变量
 */
-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString*)imageStr withTitleStr:(NSString*)titleStr;

// 带有删除功能
-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString*)imageStr withTitleStr:(NSString*)titleStr withDeleteAble:(BOOL)able;

@end


















