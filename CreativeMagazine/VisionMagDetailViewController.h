//
//  VisionMagDetailViewController.h
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/22.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VisionMagDetailModel;
@interface VisionMagDetailViewController : UIViewController

@property(nonatomic,copy)NSMutableArray *dataArr;


@property (nonatomic,assign)NSUInteger selectIndex;

@property (nonatomic,assign)int currentIndex;



@property (nonatomic,strong) VisionMagDetailModel *reModel;


@end
