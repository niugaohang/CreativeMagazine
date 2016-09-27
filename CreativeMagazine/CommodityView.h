//
//  CommodityView.h
//  CreativeMagazine
//
//  Created by 牛高航 on 2016/9/27.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CellPressedBlock)(NSIndexPath*indexPath);


@interface CommodityView : UIView


-(void)myArticleViewDidSelectRowIndexPath:(CellPressedBlock)indexPathBlock;

-(UITableView*)getMyListTableView;

//给表赋值新的数据 并刷新表
-(void)myArticleViewReloadTableViewSetData:(NSMutableArray*)data;


@end
