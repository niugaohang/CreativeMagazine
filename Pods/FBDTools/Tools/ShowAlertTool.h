//
//  ShowAlertTool.h
//  baodongPro
//
//  Created by feng on 16/3/8.
//  Copyright © 2016年 proper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^myToolBlcok)(UIAlertAction*oneAction);
@interface ShowAlertTool : NSObject
/**
 *      @author 冯宝东
 *
 *      单例ShowAlertTool
 *
 *      @return 单例ShowAlertTool
 */
+(instancetype)defaultTool;

/**
 *      @author 冯宝东
 *
 *      show 像UIAlertView 一样的展示回调Block 实例方法
 *      @param VC       视图控制器
 *      @param oneBlock 确定Block
 *      @param twoblock 取消block
 */
-(void)showInVC:(UIViewController*)VC  sureBlcok:(myToolBlcok)oneBlock failedBlock:(myToolBlcok)twoblock;
/**
 *      @author 冯宝东
 *
 *      show 像UIAlertView 一样的展示回调Block 类方法
 *
 *      @param VC       视图控制器
 *      @param oneBlock 确定Block
 *      @param twoblock 取消block
 */
+(void)showInVC:(UIViewController*)VC  sureBlcok:(myToolBlcok)oneBlock failedBlock:(myToolBlcok)twoblock;


/**
 *      @author 冯宝东
 *
 *      show的配置信息
 *
 *      @param title 标题
 *      @param msg   内容
 *      @param array 按钮titleArray
 */
-(void)showConfigeWithTitle:(NSString*)title  Message:(NSString*)msg  ButtonTitleArray:(NSArray*)array;
/**
 *      @author 冯宝东
 *
 *      show的配置信息
 *
 *      @param title 标题
 *      @param msg   内容
 *      @param array 按钮titleArray
 */
+(void)showConfigeWithTitle:(NSString*)title  Message:(NSString*)msg  ButtonTitleArray:(NSArray*)array;





@end
