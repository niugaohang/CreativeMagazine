//
//  FBDChineseCodeTool.h
//  NewMedSci
//
//  Created by feng on 16/7/8.
//  Copyright © 2016年 MedSci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBDChineseCodeTool : NSObject
+(instancetype)defaultTool;

// 转化汉字的code (类方法)
+(NSString*)hanziChangeIntoPinYinWithSting:(NSString*)hanStr;

// 转化汉字的code
//- (NSString*)hanziChangeIntoPinYinWithSting:(NSString*)hanStr;
@end
