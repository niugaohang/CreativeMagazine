//
//  ShowAlertTool.m
//  baodongPro
//
//  Created by feng on 16/3/8.
//  Copyright © 2016年 proper. All rights reserved.
//

#import "ShowAlertTool.h"
static ShowAlertTool *singal;

@implementation ShowAlertTool
{
    NSString*_show_Title;
    NSString*_show_Message;
    NSArray* _show_ButtontitleArray;
    

}
/**
 *      @author 冯宝东
 *
 *      单例ShowAlertTool
 *
 *      @return 单例ShowAlertTool
 */
+(instancetype)defaultTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singal=[[self alloc] init];
    });


    return singal;
}
/**
 *      @author 冯宝东
 *
 *      show的配置信息
 *
 *      @param title 标题
 *      @param msg   内容
 *      @param array 按钮titleArray
 */
-(void)showConfigeWithTitle:(NSString*)title  Message:(NSString*)msg  ButtonTitleArray:(NSArray*)array
{
    _show_Title=title;
    _show_Message=msg;
    _show_ButtontitleArray=array;
    
    
}
/**
 *      @author 冯宝东
 *
 *      show的配置信息
 *
 *      @param title 标题
 *      @param msg   内容
 *      @param array 按钮titleArray
 */
+(void)showConfigeWithTitle:(NSString*)title  Message:(NSString*)msg  ButtonTitleArray:(NSArray*)array
{
    [[ShowAlertTool defaultTool] showConfigeWithTitle:title Message:msg ButtonTitleArray:array];
}

/**
 *      @author 冯宝东
 *
 *      show 像UIAlertView 一样的展示回调Block
 *
 *      @param oneBlock 确定Block
 *      @param twoblock 取消block
 */
-(void)showInVC:(UIViewController*)VC  sureBlcok:(myToolBlcok)oneBlock failedBlock:(myToolBlcok)twoblock
{
    NSString *m_localTitle= _show_Title?_show_Title:@"默认标题";
    NSString *m_loaclMessage=_show_Message?_show_Message:@"你好，我是 默认的 ShowAlertTool Message";
    NSString*m_oneButtonTitle=[_show_ButtontitleArray objectAtIndex:0]?[_show_ButtontitleArray objectAtIndex:0]:@"默认Button1";
    NSString*m_twoButtonTitle=[_show_ButtontitleArray objectAtIndex:1]?[_show_ButtontitleArray objectAtIndex:1]:@"默认Button2";
    
    UIAlertController* sheet=[UIAlertController  alertControllerWithTitle:m_localTitle  message:m_loaclMessage preferredStyle:UIAlertControllerStyleAlert];
    [sheet addAction:[UIAlertAction actionWithTitle:m_oneButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (oneBlock)
        {
            oneBlock(action);
        }
    }]];
    
    [sheet addAction:[UIAlertAction actionWithTitle:m_twoButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (twoblock)
        {
            twoblock(action);
        }
        
    }]];
   
    
    [VC presentViewController:sheet animated:YES completion:nil];

}

/**
 *      @author 冯宝东
 *
 *      show 像UIAlertView 一样的展示回调Block
 *
 *      @param oneBlock 确定Block
 *      @param twoblock 取消block
 */
+(void)showInVC:(UIViewController*)VC  sureBlcok:(myToolBlcok)oneBlock failedBlock:(myToolBlcok)twoblock
{
    [[ShowAlertTool defaultTool] showInVC:VC sureBlcok:oneBlock failedBlock:twoblock];
}








@end
