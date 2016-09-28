//
//  CommodityDetailViewController.m
//  CreativeMagazine
//
//  Created by 牛高航 on 2016/9/28.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "CommodityDetailViewController.h"
#import "Header.h"
@interface CommodityDetailViewController ()

//特价
@property (nonatomic,strong)TBSaleView *tbSaleView;
@property (nonatomic,strong)UIWebView *tbWebView;

@end

@implementation CommodityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Tool initWithNavViewWith:self.goodsname leftIteamHidden:YES selfView:self];
    
    _tbWebView=[self.tbSaleView getTaobaoSaleView];
    [self.tbSaleView getTaobaoSaleViewSetUrl:self.CommodityUrl];
    [self.view addSubview:_tbWebView];
}
-(TBSaleView*)tbSaleView
{
    
    if (!_tbSaleView)
    {
        _tbSaleView=[[TBSaleView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64)];
        _tbSaleView.backgroundColor=[UIColor whiteColor];
    }
    return _tbSaleView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
