//
//  CategoryListBaseClass.h
//
//  Created by   on 14-10-21
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CategoryListBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *cateid;
@property (nonatomic, retain) NSString *catename;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
