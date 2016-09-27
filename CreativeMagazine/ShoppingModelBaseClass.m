//
//  ShoppingModelBaseClass.m
//
//  Created by   on 14-10-20
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "ShoppingModelBaseClass.h"


NSString *const kShoppingModelBaseClassHeight = @"height";
NSString *const kShoppingModelBaseClassGoodsimage = @"goodsimage";
NSString *const kShoppingModelBaseClassPrice = @"price";
NSString *const kShoppingModelBaseClassGoodsname = @"goodsname";
NSString *const kShoppingModelBaseClassWidth = @"width";
NSString *const kShoppingModelBaseClassCount = @"count";
NSString *const kShoppingModelBaseClassGoodsid = @"goodsid";
NSString *const kShoppingModelBaseClassUrl = @"url";


@interface ShoppingModelBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ShoppingModelBaseClass

@synthesize height = _height;
@synthesize goodsimage = _goodsimage;
@synthesize price = _price;
@synthesize goodsname = _goodsname;
@synthesize width = _width;
@synthesize count = _count;
@synthesize goodsid = _goodsid;
@synthesize url = _url;


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
        self.height = [self objectOrNilForKey:kShoppingModelBaseClassHeight fromDictionary:dict];
        self.goodsimage = [self objectOrNilForKey:kShoppingModelBaseClassGoodsimage fromDictionary:dict];
        self.price = [self objectOrNilForKey:kShoppingModelBaseClassPrice fromDictionary:dict];
        self.goodsname = [self objectOrNilForKey:kShoppingModelBaseClassGoodsname fromDictionary:dict];
        self.width = [self objectOrNilForKey:kShoppingModelBaseClassWidth fromDictionary:dict];
        self.count = [self objectOrNilForKey:kShoppingModelBaseClassCount fromDictionary:dict];
        self.goodsid = [self objectOrNilForKey:kShoppingModelBaseClassGoodsid fromDictionary:dict];
        self.url = [self objectOrNilForKey:kShoppingModelBaseClassUrl fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.height forKey:kShoppingModelBaseClassHeight];
    [mutableDict setValue:self.goodsimage forKey:kShoppingModelBaseClassGoodsimage];
    [mutableDict setValue:self.price forKey:kShoppingModelBaseClassPrice];
    [mutableDict setValue:self.goodsname forKey:kShoppingModelBaseClassGoodsname];
    [mutableDict setValue:self.width forKey:kShoppingModelBaseClassWidth];
    [mutableDict setValue:self.count forKey:kShoppingModelBaseClassCount];
    [mutableDict setValue:self.goodsid forKey:kShoppingModelBaseClassGoodsid];
    [mutableDict setValue:self.url forKey:kShoppingModelBaseClassUrl];
    
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
    
    self.height = [aDecoder decodeObjectForKey:kShoppingModelBaseClassHeight];
    self.goodsimage = [aDecoder decodeObjectForKey:kShoppingModelBaseClassGoodsimage];
    self.price = [aDecoder decodeObjectForKey:kShoppingModelBaseClassPrice];
    self.goodsname = [aDecoder decodeObjectForKey:kShoppingModelBaseClassGoodsname];
    self.width = [aDecoder decodeObjectForKey:kShoppingModelBaseClassWidth];
    self.count = [aDecoder decodeObjectForKey:kShoppingModelBaseClassCount];
    self.goodsid = [aDecoder decodeObjectForKey:kShoppingModelBaseClassGoodsid];
    self.url = [aDecoder decodeObjectForKey:kShoppingModelBaseClassUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_height forKey:kShoppingModelBaseClassHeight];
    [aCoder encodeObject:_goodsimage forKey:kShoppingModelBaseClassGoodsimage];
    [aCoder encodeObject:_price forKey:kShoppingModelBaseClassPrice];
    [aCoder encodeObject:_goodsname forKey:kShoppingModelBaseClassGoodsname];
    [aCoder encodeObject:_width forKey:kShoppingModelBaseClassWidth];
    [aCoder encodeObject:_count forKey:kShoppingModelBaseClassCount];
    [aCoder encodeObject:_goodsid forKey:kShoppingModelBaseClassGoodsid];
    [aCoder encodeObject:_url forKey:kShoppingModelBaseClassUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    ShoppingModelBaseClass *copy = [[ShoppingModelBaseClass alloc] init];
    
    if (copy) {
        
        copy.height = [self.height copyWithZone:zone];
        copy.goodsimage = [self.goodsimage copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.goodsname = [self.goodsname copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.count = [self.count copyWithZone:zone];
        copy.goodsid = [self.goodsid copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}




@end
