//
//  ToTopLabel.m
//  NewMedSci
//
//  Created by 牛高航 on 15/4/8.
//  Copyright (c) 2015年 Bioon. All rights reserved.
//



/***
 
 **      第三方Label    /ps:用于控制Label字体位置
 
 ***/


#import "ToTopLabel.h"

@implementation ToTopLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@synthesize verticalAlignment = verticalAlignment_;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = VerticalAlignmentMiddle;
    }
    return self;
}

- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {
    verticalAlignment_ = verticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}
@end

/*  使用方法
 
    lbl_mylabel = [[myUILabel alloc] initWithFrame:CGRectMake(20, 50, 150, 600)];
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"halfTransparent.png"]];//使用半透明图片作为label的背景色
    lbl_mylabel.backgroundColor = color;
    lbl_mylabel.textAlignment = UITextAlignmentLeft;
    lbl_mylabel.textColor = UIColor.whiteColor;
    lbl_mylabel.lineBreakMode = UILineBreakModeWordWrap;
    lbl_mylabel.numberOfLines = 0;
    [lbl_mylabel setVerticalAlignment:VerticalAlignmentTop];
    [self addSubview:lbl_mylabel];
*/