//
//  SelectionModelList.m
//
//  Created by   on 16/9/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SelectionModelList.h"


NSString *const kSelectionModelListDate = @"date";
NSString *const kSelectionModelListTitle = @"title";
NSString *const kSelectionModelListContent = @"content";
NSString *const kSelectionModelListUrl = @"url";
NSString *const kSelectionModelListContenturl = @"contenturl";
NSString *const kSelectionModelListImage = @"image";


@interface SelectionModelList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SelectionModelList

@synthesize date = _date;
@synthesize title = _title;
@synthesize content = _content;
@synthesize url = _url;
@synthesize contenturl = _contenturl;
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
            self.date = [self objectOrNilForKey:kSelectionModelListDate fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSelectionModelListTitle fromDictionary:dict];
            self.content = [self objectOrNilForKey:kSelectionModelListContent fromDictionary:dict];
            self.url = [self objectOrNilForKey:kSelectionModelListUrl fromDictionary:dict];
            self.contenturl = [self objectOrNilForKey:kSelectionModelListContenturl fromDictionary:dict];
            self.image = [self objectOrNilForKey:kSelectionModelListImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.date forKey:kSelectionModelListDate];
    [mutableDict setValue:self.title forKey:kSelectionModelListTitle];
    [mutableDict setValue:self.content forKey:kSelectionModelListContent];
    [mutableDict setValue:self.url forKey:kSelectionModelListUrl];
    [mutableDict setValue:self.contenturl forKey:kSelectionModelListContenturl];
    [mutableDict setValue:self.image forKey:kSelectionModelListImage];

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

    self.date = [aDecoder decodeObjectForKey:kSelectionModelListDate];
    self.title = [aDecoder decodeObjectForKey:kSelectionModelListTitle];
    self.content = [aDecoder decodeObjectForKey:kSelectionModelListContent];
    self.url = [aDecoder decodeObjectForKey:kSelectionModelListUrl];
    self.contenturl = [aDecoder decodeObjectForKey:kSelectionModelListContenturl];
    self.image = [aDecoder decodeObjectForKey:kSelectionModelListImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_date forKey:kSelectionModelListDate];
    [aCoder encodeObject:_title forKey:kSelectionModelListTitle];
    [aCoder encodeObject:_content forKey:kSelectionModelListContent];
    [aCoder encodeObject:_url forKey:kSelectionModelListUrl];
    [aCoder encodeObject:_contenturl forKey:kSelectionModelListContenturl];
    [aCoder encodeObject:_image forKey:kSelectionModelListImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    SelectionModelList *copy = [[SelectionModelList alloc] init];
    
    if (copy) {

        copy.date = [self.date copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.contenturl = [self.contenturl copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
    }
    
    return copy;
}


@end
