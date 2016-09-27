//
//  Header.h
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/21.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#ifndef Header_h
#define Header_h

//启动页  tabbar
#import "BootViewController.h"
#import "NTViewController.h"
#import "NTButton.h"
#import "BaseNavigationViewController.h"

//第三方
#import "MyRequest.h"
#import <AFNetworking/AFNetworking.h>
#import "UIView+Toast.h"//提示功能
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIButton+WebCache.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "Tool.h"
//Model类
#import "DataModels.h"
#import "MJRefresh.h"
#import "UIView+FBDQuickCreateUI.h"

//lab距顶
#import "ToTopLabel.h"

//首页精选
#import "SelectionViewController.h"
//scrollview重用
#import "SelectionCustomView.h"

//画报详情页
#import "VisionMagDetailViewController.h"

//鲜资讯
#import "NewsViewController.h"
#import "NewsTableVC.h"
#import "NewsTableCell.h"

#import "DesignerViewController.h"
#import "ShoppingViewController.h"
#import "CommodityView.h"
#import "CommodityViewBL.h"
#import "CommodityCell.h"
#import "CategoryView.h"

#import "MoreViewController.h"













































//宏定义

//1.获取屏幕宽度与高度
#define VIEW_WIDTH      [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT     [UIScreen mainScreen].bounds.size.height

//2.获取通知中心
#define NNNotificationCenter [NSNotificationCenter defaultCenter]

//3.设置随机颜色
#define NNRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

//4.设置RGB颜色/设置RGBA颜色

#define NNRGBAColor(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define NNRGBColor(r) [UIColor colorWithRed:r/255.0 green:r/255.0 blue:r/255.0 alpha:1.0]

// clear背景颜色
#define NNClearColor [UIColor clearColor]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//5.自定义高效率的 NSLog
#ifdef DEBUG
#define NNLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NNLog(...)

#endif

//6.弱引用/强引用
#define NNWeakSelf(type)  __weak typeof(type) weak##type = type;
#define NNStrongSelf(type)  __strong typeof(type) type = weak##type;




//9.设置加载提示框（第三方框架：Toast）
#define NNToast(str)              CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle]; \
[kWindow  makeToast:str duration:0.6 position:CSToastPositionCenter style:style];\
kWindow.userInteractionEnabled = NO; \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
kWindow.userInteractionEnabled = YES;\
});\

#define kWindow [UIApplication sharedApplication].keyWindow

//获取图片资源
#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//14.判断当前的iPhone设备/系统版本
//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)




//判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))



//15.判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif


//16.沙盒目录文件
//获取temp
#define kPathTemp NSTemporaryDirectory()

//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]



//17.GCD 的宏定义
//GCD - 一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

//GCD - 在Main线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//GCD - 开启异步线程
//#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);


//GCD - 开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);\dispatch_async(queue, ^{\globalQueueBlock\});

//对话框
#define SHOW_ALERT(msg) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提醒" message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];



#define  NEWVISION_URL @"http://www.wowsai.com/newphone/newvision"
#define  ALLNEWSDATA_URL @"http://www.wowsai.com/newphone/newnews"

#define  DESIGNERS_URL @"http://www.wowsai.com/newphone/newdesigner"

#define  SHOPPINGNEWGOODS_URL @"http://www.wowsai.com/index.php?app=shopping&act=newgoods&phone=1"

#define  HOTSHOPPING_URL @"http://www.wowsai.com/index.php?app=shopping&act=ranking&phone=1"
#define  CATEGORYLIST_URL @"http://www.wowsai.com/index.php?app=shopping&act=phone_getgcategory"
#endif /* Header_h */
