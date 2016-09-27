//
//  CommodityView.m
//  CreativeMagazine
//
//  Created by 牛高航 on 2016/9/27.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "CommodityView.h"

#import "Header.h"

@interface CommodityView()<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (nonatomic,copy)CellPressedBlock cellBlock;

@end
@implementation CommodityView
{
    UITableView*_myTableView;
    NSMutableArray*_listData;
    
}
-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self)
    {
        [self loadViewWithFrame:frame];
    }
    
    return self;
}

-(void)loadViewWithFrame:(CGRect)frame
{
    
    _myTableView=[self fbd_quickCreateUITabdWithleViewFrame:self.bounds andDelegateAndDataSource:self];
//    _myTableView.rowHeight=100;
    _myTableView.separatorColor=[UIColor clearColor];
    [self addSubview:_myTableView];
    
}
-(UITableView*)getMyListTableView
{
    return _myTableView;
}
#pragma mark ---UITableViewDataSource&&UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listData.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_listData.count != 0)
    {
        CommodityCell *cell = [[CommodityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCells"];
        
        ShoppingModelBaseClass *visionMagModel=[_listData objectAtIndex:indexPath.row];
        CGFloat heigth = [cell cellFrameHeigth:visionMagModel];
        return heigth;
    }
    return 110;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* indetifier=@"MyCells";
    CommodityCell*cell=[tableView dequeueReusableCellWithIdentifier:indetifier];
    if (!cell)
    {
        cell=[[CommodityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetifier ];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    ShoppingModelBaseClass*baseModel=[_listData objectAtIndex:indexPath.row];
    cell.reModel=baseModel;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellBlock)
    {
        self.cellBlock(indexPath);
    }
    
}

-(void)myArticleViewDidSelectRowIndexPath:(CellPressedBlock)indexPathBlock
{
    self.cellBlock=indexPathBlock;
    
}
//给表赋值新的数据 并刷新表
-(void)myArticleViewReloadTableViewSetData:(NSMutableArray*)data
{
    _listData=data;
    [_myTableView reloadData];
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
