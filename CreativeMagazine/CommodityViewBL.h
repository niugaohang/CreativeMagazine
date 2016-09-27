//
//  CommodityViewBL.h
//  CreativeMagazine
//
//  Created by 牛高航 on 2016/9/27.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^MyArticleBLSuccessed)(id obj);

@interface CommodityViewBL : NSObject


-(void)getCommodityViewWithStatus:(NSString *)status Type:(NSString *)type GoodsID:(NSString *)goodsid  withSuccessedBlock:(MyArticleBLSuccessed)success;



@end
