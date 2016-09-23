//
//  VisionMagModel.m
//
//  Created by   on 16/9/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VisionMagModel.h"


NSString *const kVisionMagModelHeight = @"height";
NSString *const kVisionMagModelContent = @"content";
NSString *const kVisionMagModelImageUrl = @"image_url";
NSString *const kVisionMagModelWidth = @"width";
NSString *const kVisionMagModelDate = @"date";
NSString *const kVisionMagModelTitle = @"title";
NSString *const kVisionMagModelContenturl = @"contenturl";
NSString *const kVisionMagModelUrl = @"url";
NSString *const kVisionMagModelType = @"type";
NSString *const kVisionMagModelImage = @"image";
@interface VisionMagModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VisionMagModel

@synthesize height = _height;
@synthesize content = _content;
@synthesize imageUrl = _imageUrl;
@synthesize width = _width;
@synthesize date = _date;
@synthesize title = _title;
@synthesize contenturl = _contenturl;
@synthesize url = _url;
@synthesize type = _type;
@synthesize image = _image;


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
            self.height = [self objectOrNilForKey:kVisionMagModelHeight fromDictionary:dict];
            self.content = [self objectOrNilForKey:kVisionMagModelContent fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kVisionMagModelImageUrl fromDictionary:dict];
            self.width = [self objectOrNilForKey:kVisionMagModelWidth fromDictionary:dict];
            self.date = [self objectOrNilForKey:kVisionMagModelDate fromDictionary:dict];
            self.title = [self objectOrNilForKey:kVisionMagModelTitle fromDictionary:dict];
            self.contenturl = [self objectOrNilForKey:kVisionMagModelContenturl fromDictionary:dict];
            self.url = [self objectOrNilForKey:kVisionMagModelUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kVisionMagModelType fromDictionary:dict];
        self.image = [self objectOrNilForKey:kVisionMagModelImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.height forKey:kVisionMagModelHeight];
    [mutableDict setValue:self.content forKey:kVisionMagModelContent];
    [mutableDict setValue:self.imageUrl forKey:kVisionMagModelImageUrl];
    [mutableDict setValue:self.width forKey:kVisionMagModelWidth];
    [mutableDict setValue:self.date forKey:kVisionMagModelDate];
    [mutableDict setValue:self.title forKey:kVisionMagModelTitle];
    [mutableDict setValue:self.contenturl forKey:kVisionMagModelContenturl];
    [mutableDict setValue:self.url forKey:kVisionMagModelUrl];
     [mutableDict setValue:self.image forKey:kVisionMagModelImage];
    

     [mutableDict setValue:self.type forKey:kVisionMagModelType];
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

    self.height = [aDecoder decodeObjectForKey:kVisionMagModelHeight];
    self.content = [aDecoder decodeObjectForKey:kVisionMagModelContent];
    self.imageUrl = [aDecoder decodeObjectForKey:kVisionMagModelImageUrl];
    self.image = [aDecoder decodeObjectForKey:kVisionMagModelImage];
    self.width = [aDecoder decodeObjectForKey:kVisionMagModelWidth];
    self.date = [aDecoder decodeObjectForKey:kVisionMagModelDate];
    self.title = [aDecoder decodeObjectForKey:kVisionMagModelTitle];
    self.contenturl = [aDecoder decodeObjectForKey:kVisionMagModelContenturl];
    self.url = [aDecoder decodeObjectForKey:kVisionMagModelUrl];
     self.type = [aDecoder decodeObjectForKey:kVisionMagModelType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_height forKey:kVisionMagModelHeight];
    [aCoder encodeObject:_content forKey:kVisionMagModelContent];
    [aCoder encodeObject:_imageUrl forKey:kVisionMagModelImageUrl];
    [aCoder encodeObject:_image forKey:kVisionMagModelImage];
    [aCoder encodeObject:_width forKey:kVisionMagModelWidth];
    [aCoder encodeObject:_date forKey:kVisionMagModelDate];
    [aCoder encodeObject:_title forKey:kVisionMagModelTitle];
    [aCoder encodeObject:_contenturl forKey:kVisionMagModelContenturl];
    [aCoder encodeObject:_url forKey:kVisionMagModelUrl];
    [aCoder encodeObject:_type forKey:kVisionMagModelType];

}

- (id)copyWithZone:(NSZone *)zone
{
    VisionMagModel *copy = [[VisionMagModel alloc] init];
    
    if (copy) {

        copy.height = [self.height copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.contenturl = [self.contenturl copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
         copy.image = [self.image copyWithZone:zone];
    }
    
    return copy;
}


@end
