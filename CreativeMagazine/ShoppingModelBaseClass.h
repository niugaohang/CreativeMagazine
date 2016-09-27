//
//  ShoppingModelBaseClass.h
//
//  Created by   on 14-10-20
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingModelBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *height;
@property (nonatomic, retain) NSString *goodsimage;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *goodsname;
@property (nonatomic, retain) NSString *width;
@property (nonatomic, retain) NSString *count;
@property (nonatomic, retain) NSString *goodsid;
@property (nonatomic, retain) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
