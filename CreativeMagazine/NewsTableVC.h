//
//  NewsTableVC.h
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/23.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface NewsTableVC : UIViewController


- (id)initWithFrame:(CGRect)frame;

@property (nonatomic,unsafe_unretained) NSUInteger index;

@property(nonatomic,retain)NSMutableArray *dataArr;
@property(nonatomic,assign)CGRect frame;
//加载
@property (nonatomic,assign) BOOL isLoading;

@end
