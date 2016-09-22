//
//  ToTopLabel.h
//  NewMedSci
//
//  Created by 牛高航 on 15/4/8.
//  Copyright (c) 2015年 Bioon. All rights reserved.
//
#import <UIKit/UIKit.h>
typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;
@interface ToTopLabel : UILabel
{
@private
    VerticalAlignment _verticalAlignment;
}

@property (nonatomic) VerticalAlignment verticalAlignment;

@end