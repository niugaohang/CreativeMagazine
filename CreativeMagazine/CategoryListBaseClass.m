//
//  CategoryListBaseClass.m
//
//  Created by   on 14-10-21
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "CategoryListBaseClass.h"


NSString *const kCategoryListBaseClassCateid = @"cateid";
NSString *const kCategoryListBaseClassCatename = @"catename";


@interface CategoryListBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CategoryListBaseClass

@synthesize cateid = _cateid;
@synthesize catename = _catename;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
        self.cateid = [self objectOrNilForKey:kCategoryListBaseClassCateid fromDictionary:dict];
        self.catename = [self objectOrNilForKey:kCategoryListBaseClassCatename fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cateid forKey:kCategoryListBaseClassCateid];
    [mutableDict setValue:self.catename forKey:kCategoryListBaseClassCatename];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    self.cateid = [aDecoder decodeObjectForKey:kCategoryListBaseClassCateid];
    self.catename = [aDecoder decodeObjectForKey:kCategoryListBaseClassCatename];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_cateid forKey:kCategoryListBaseClassCateid];
    [aCoder encodeObject:_catename forKey:kCategoryListBaseClassCatename];
}

- (id)copyWithZone:(NSZone *)zone
{
    CategoryListBaseClass *copy = [[CategoryListBaseClass alloc] init];
    
    if (copy) {
        
        copy.cateid = [self.cateid copyWithZone:zone];
        copy.catename = [self.catename copyWithZone:zone];
    }
    
    return copy;
}




@end
