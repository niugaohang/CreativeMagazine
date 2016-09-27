//
//  FBDChineseCodeTool.m
//  NewMedSci
//
//  Created by feng on 16/7/8.
//  Copyright © 2016年 MedSci. All rights reserved.
//

#import "FBDChineseCodeTool.h"
static FBDChineseCodeTool *signTan;
@implementation FBDChineseCodeTool

+(instancetype)defaultTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        signTan=[[self  alloc] init];
    });
    return signTan;
}
// 转化汉字的code (类方法)
+(NSString*)hanziChangeIntoPinYinWithSting:(NSString*)hanStr
{
    NSString* pinyinStr=[[self defaultTool] hanziChangeIntoPinYinWithSting:hanStr];
    return pinyinStr;
}
// 转化汉字的code
- (NSString*)hanziChangeIntoPinYinWithSting:(NSString*)hanStr
{
    NSMutableString *source = [hanStr mutableCopy];
    
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    source= (NSMutableString*)[self clearWhiteSpaceCodeBaseString:source];
    
    return source;
    
}
// 去空格的code
- (NSString*) clearWhiteSpaceCodeBaseString:(NSString*) agoString
{
    NSString* turePinyin=  [agoString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return turePinyin;
}
@end
