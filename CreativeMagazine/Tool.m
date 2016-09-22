//
//  Tool.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/22.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "Tool.h"

@implementation Tool



+(void)initWithNavViewWith:(NSString *)titleName selfView:(UIViewController *)selfView {
    selfView.view.backgroundColor=NNRGBAColor(235.0, 235.0, 235.0, 1);

    //    导航条
    selfView.automaticallyAdjustsScrollViewInsets=NO;
    

    
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"return.png"] style:UIBarButtonItemStylePlain target:selfView action:@selector(backTopVC)];
     leftBtnItem.tintColor=[UIColor whiteColor];

    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;
    selfView.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, leftBtnItem, nil];
    
    
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = titleName;
    selfView.navigationItem.titleView = titleLabel;
    

    [selfView.navigationController.navigationBar setBarTintColor:NNRGBAColor(35.0, 131.0, 221.0, 1.0)];
    
}
-(void)backTopVC
{
    
}

@end
