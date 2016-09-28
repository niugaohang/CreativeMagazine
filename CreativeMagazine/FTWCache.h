//
//  FTWCache.h
//  FTW
//
//  Created by Soroush Khanlou on 6/28/12.
//  Copyright (c) 2012 FTW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTWCache : NSObject

+ (void) resetCache;
+ (NSString*) cacheDirectory;
+ (void) setObject:(NSData*)data forKey:(NSString*)key;
+ (id) objectForKey:(NSString*)key;

@end
