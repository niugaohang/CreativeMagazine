//
//  VisionMagDetailModel.m
//
//  Created by   on 16/9/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VisionMagDetailModel.h"


NSString *const kVisionMagDetailModelHeight = @"height";
NSString *const kVisionMagDetailModelContent = @"content";
NSString *const kVisionMagDetailModelImageUrl = @"image_url";
NSString *const kVisionMagDetailModelWidth = @"width";
NSString *const kVisionMagDetailModelDate = @"date";
NSString *const kVisionMagDetailModelTitle = @"title";
NSString *const kVisionMagDetailModelContenturl = @"contenturl";
NSString *const kVisionMagDetailModelUrl = @"url";


@interface VisionMagDetailModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VisionMagDetailModel

@synthesize height = _height;
@synthesize content = _content;
@synthesize imageUrl = _imageUrl;
@synthesize width = _width;
@synthesize date = _date;
@synthesize title = _title;
@synthesize contenturl = _contenturl;
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
            self.height = [self objectOrNilForKey:kVisionMagDetailModelHeight fromDictionary:dict];
            self.content = [self objectOrNilForKey:kVisionMagDetailModelContent fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kVisionMagDetailModelImageUrl fromDictionary:dict];
            self.width = [self objectOrNilForKey:kVisionMagDetailModelWidth fromDictionary:dict];
            self.date = [self objectOrNilForKey:kVisionMagDetailModelDate fromDictionary:dict];
            self.title = [self objectOrNilForKey:kVisionMagDetailModelTitle fromDictionary:dict];
            self.contenturl = [self objectOrNilForKey:kVisionMagDetailModelContenturl fromDictionary:dict];
            self.url = [self objectOrNilForKey:kVisionMagDetailModelUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.height forKey:kVisionMagDetailModelHeight];
    [mutableDict setValue:self.content forKey:kVisionMagDetailModelContent];
    [mutableDict setValue:self.imageUrl forKey:kVisionMagDetailModelImageUrl];
    [mutableDict setValue:self.width forKey:kVisionMagDetailModelWidth];
    [mutableDict setValue:self.date forKey:kVisionMagDetailModelDate];
    [mutableDict setValue:self.title forKey:kVisionMagDetailModelTitle];
    [mutableDict setValue:self.contenturl forKey:kVisionMagDetailModelContenturl];
    [mutableDict setValue:self.url forKey:kVisionMagDetailModelUrl];

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

    self.height = [aDecoder decodeObjectForKey:kVisionMagDetailModelHeight];
    self.content = [aDecoder decodeObjectForKey:kVisionMagDetailModelContent];
    self.imageUrl = [aDecoder decodeObjectForKey:kVisionMagDetailModelImageUrl];
    self.width = [aDecoder decodeObjectForKey:kVisionMagDetailModelWidth];
    self.date = [aDecoder decodeObjectForKey:kVisionMagDetailModelDate];
    self.title = [aDecoder decodeObjectForKey:kVisionMagDetailModelTitle];
    self.contenturl = [aDecoder decodeObjectForKey:kVisionMagDetailModelContenturl];
    self.url = [aDecoder decodeObjectForKey:kVisionMagDetailModelUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_height forKey:kVisionMagDetailModelHeight];
    [aCoder encodeObject:_content forKey:kVisionMagDetailModelContent];
    [aCoder encodeObject:_imageUrl forKey:kVisionMagDetailModelImageUrl];
    [aCoder encodeObject:_width forKey:kVisionMagDetailModelWidth];
    [aCoder encodeObject:_date forKey:kVisionMagDetailModelDate];
    [aCoder encodeObject:_title forKey:kVisionMagDetailModelTitle];
    [aCoder encodeObject:_contenturl forKey:kVisionMagDetailModelContenturl];
    [aCoder encodeObject:_url forKey:kVisionMagDetailModelUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    VisionMagDetailModel *copy = [[VisionMagDetailModel alloc] init];
    
    if (copy) {

        copy.height = [self.height copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.contenturl = [self.contenturl copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
