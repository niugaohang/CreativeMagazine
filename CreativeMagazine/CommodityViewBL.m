//
//  CommodityViewBL.m
//  CreativeMagazine
//
//  Created by 牛高航 on 2016/9/27.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "CommodityViewBL.h"
#import "Header.h"
@implementation CommodityViewBL

-(void)getCommodityViewWithStatus:(NSString *)status Type:(NSString *)type GoodsID:(NSString *)goodsid  withSuccessedBlock:(MyArticleBLSuccessed)success
{
    NSMutableDictionary *parameterDic = [[NSMutableDictionary alloc]init];
    
    [parameterDic setObject:status forKey:@"status"];
    [parameterDic setObject:type forKey:@"type" ];
    [parameterDic setObject:goodsid forKey:@"goods_id"];
    [parameterDic setObject:@"10" forKey:@"pagenum"];
    NSString *urlStr;
    if ([type isEqualToString:@"new"])
    {
        urlStr=SHOPPINGNEWGOODS_URL;
    }
    if ([type isEqualToString:@"hot"])
    {
        urlStr=HOTSHOPPING_URL;
    }
    if ([type isEqualToString:@"cate"]) {
        urlStr=CATEGORYLIST_URL;
    }
    
    [[MyRequest defaultRequest]postRequestWithTheType:urlStr theContent:parameterDic successBlock:^(id obj) {
        
        success(obj);
        
    } failureBlock:^(NSString *error) {
        
        [SVProgressHUD dismiss];
        NNToast(error);
    }];

}

-(void)getCategoryCommodityViewWithStatus:(NSString *)status Cateid:(NSString *)cateid GoodsID:(NSString *)goodsid  withSuccessedBlock:(MyArticleBLSuccessed)success
{
    NSMutableDictionary *parameterDic = [[NSMutableDictionary alloc]init];
    
    [parameterDic setObject:status forKey:@"status"];
    [parameterDic setObject:cateid forKey:@"cateid" ];
    [parameterDic setObject:goodsid forKey:@"goods_id"];
    [parameterDic setObject:@"10" forKey:@"pagenum"];
    
    
    [[MyRequest defaultRequest]postRequestWithTheType:DETAILCATEGORYID_URL theContent:parameterDic successBlock:^(id obj) {
        
        success(obj);
        
    } failureBlock:^(NSString *error) {
        
        [SVProgressHUD dismiss];
        NNToast(error);
    }];
    
}

@end
