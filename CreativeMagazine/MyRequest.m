//
//  MyRequest.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/21.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "MyRequest.h"

static MyRequest *__request;
@interface MyRequest ()
{
    AFHTTPSessionManager *_maneger;
}

@end
@implementation MyRequest

+(MyRequest *)defaultRequest
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __request=[[MyRequest alloc]init];
    });
    return __request;
    
}

-(AFHTTPSessionManager *)baseHtppRequest{
    /*
     AFHTTPRequestOperationManager*manager=[AFHTTPRequestOperationManagermanager];
     manager.securityPolicy=[AFSecurityPolicypolicyWithPinningMode:AFSSLPinningModeNone];
     manager.requestSerializer=[AFJSONRequestSerializerserializer];
     manager.responseSerializer=[AFJSONResponseSerializerserializer];
     [manager.requestSerializersetValue:@"application/json"forHTTPHeaderField:@"Accept"];
     [manager.requestSerializersetValue:@"application/json;charset=utf-8"forHTTPHeaderField:@"Content-Type"];
     */
    if (!_maneger)
    {
        _maneger = [AFHTTPSessionManager manager];
    }
    
    [_maneger.requestSerializer setTimeoutInterval:TIMEOUT];
    _maneger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html", @"application/json", nil];
    
    //header 设置
    //    [manager.requestSerializer setValue:K_PASS_IP forHTTPHeaderField:@"Host"];
    //    [manager.requestSerializer setValue:@"max-age=0" forHTTPHeaderField:@"Cache-Control"];
    //    [manager.requestSerializer setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    //    [manager.requestSerializer setValue:@"zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3" forHTTPHeaderField:@"Accept-Language"];
    //    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding"];
    //        [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    //    [manager.requestSerializer setValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:35.0) Gecko/20100101 Firefox/35.0" forHTTPHeaderField:@"User-Agent"];
    //
    //   _maneger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html", @"application/json", nil];
    return _maneger;
}


-(void)getRequestWithTheType:(NSString *)urlStr theContent:(NSMutableDictionary *)parameterDic successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock
{
    _maneger =[self baseHtppRequest];
    
    //3.请求
    [_maneger GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        NSInteger allHeader=response.statusCode;
        NSLog(@"HttpResponseCode:-22---%ld >>>>URL：%@",(long)allHeader,response.URL);
        if (allHeader==200)
        {
            successBlock(responseObject);
        }
        else{
            SHOW_ALERT(@"您的网络瘫痪了，请再试一次！");
        }

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //        NSLog(@"获取get请求---->%@",task.responseString);
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        NSLog(@"获取get请求---->%@ URL:%@",error.description,response.URL);

        NSLog(@"获取get请求---userinfo->%@",error.userInfo);
        //        //taskDescription
        NSLog(@"获取get请求---error.localizedDescription ->%@",error.localizedDescription);
  
        NSDictionary *allHeaders = response.allHeaderFields;
        NSLog(@"HttpResponseCode:-11---%@",allHeaders);
        
        failureBlock(error.localizedDescription);

    }];
}

-(void)postRequestWithTheType:(NSString *)urlStr theContent:(NSMutableDictionary *)parameterDic successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock
{
    _maneger =[self baseHtppRequest];
    
    [_maneger POST:urlStr parameters:parameterDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        NSInteger allHeader=response.statusCode;
        NSLog(@"HttpResponseCode:-22---%ld >>>>URL：%@",(long)allHeader,response.URL);
        if (allHeader==200)
        {
            successBlock(responseObject);
        }
        else{
            SHOW_ALERT(@"您的网络瘫痪了，请再试一次！");
        }

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //        NSLog(@"获取get请求---->%@",task.responseString);
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        NSLog(@"获取POS请求---->%@ URL:%@",error.description,response.URL);
        
        NSLog(@"获取POS请求---userinfo->%@",error.userInfo);
        //        //taskDescription
        NSLog(@"获取POS请求---error.localizedDescription ->%@",error.localizedDescription);

        NSDictionary *allHeaders = response.allHeaderFields;
        NSLog(@"HttpResponseCode:-11---%@",allHeaders);
        
        failureBlock(error.localizedDescription);
    
    }];
}




@end
