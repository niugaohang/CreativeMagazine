//
//  MyRequest.h
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/21.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"
#import "AFNetworking.h"
//请求超时
#define TIMEOUT 15
typedef void(^SuccessBlock)(id obj);
typedef void(^FailureBlock)(NSString *error);

@interface MyRequest : NSObject


@property(nonatomic ,weak)AFHTTPSessionManager *sessionManager;


+(MyRequest *)defaultRequest;

-(AFHTTPSessionManager*)baseHtppRequest;


- (void)getRequestWithTheType:(NSString *)urlStr theContent:(NSMutableDictionary *)parameterDic successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

- (void)postRequestWithTheType:(NSString *)urlStr theContent:(NSMutableDictionary *)parameterDic successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

@end
