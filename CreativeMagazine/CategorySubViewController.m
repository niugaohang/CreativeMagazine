//
//  CategorySubViewController.m
//  CreativeMagazine
//
//  Created by 牛高航 on 2016/9/28.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "CategorySubViewController.h"
#import "Header.h"
@interface CategorySubViewController ()



@property (nonatomic,strong)CommodityView *commodityView;
@property (nonatomic,strong)CommodityViewBL   *commodityViewBL;
@property (nonatomic,strong)NSMutableArray*commodityListArr;

@property(nonatomic,assign)NSString *goods_id;
@property(nonatomic,assign)NSString *status;
@end

@implementation CategorySubViewController
-(CommodityViewBL*)commodityViewBL
{
    if (!_commodityViewBL)
    {
        _commodityViewBL=[[CommodityViewBL alloc] init];
        
    }
    return _commodityViewBL;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Tool initWithNavViewWith:self.catename leftIteamHidden:YES selfView:self];
    
    self.commodityListArr=[NSMutableArray array];
    
    [self.view addSubview:self.commodityView];
    
    UITableView* _commodityListView=[self.commodityView getMyListTableView];
    
    [_commodityListView setMj_header:[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [SVProgressHUD showWithStatus:@"正在加载数据"];
        [self.commodityViewBL getCategoryCommodityViewWithStatus:@"up" Cateid:self.cateid  GoodsID:@"" withSuccessedBlock:^(id obj) {
            
            [_commodityListArr removeAllObjects];
            for (NSDictionary *dic in obj)
            {
                ShoppingModelBaseClass *ShoppingModel=[[ShoppingModelBaseClass alloc]initWithDictionary:dic];
                if (ShoppingModel.goodsid)
                {
                    _goods_id=ShoppingModel.goodsid;
                    [self.commodityListArr addObject:ShoppingModel];
                }
                
            }
            
            [SVProgressHUD dismiss];
            [_commodityListView.mj_header endRefreshing];
            
            [self.commodityView myArticleViewReloadTableViewSetData:self.commodityListArr];
        }];
        
    }]];
    
    [_commodityListView setMj_footer:[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [self.commodityViewBL getCategoryCommodityViewWithStatus:@"down" Cateid:self.cateid GoodsID:_goods_id withSuccessedBlock:^(id obj) {
            for (NSDictionary *dic in obj)
            {
                ShoppingModelBaseClass *ShoppingModel=[[ShoppingModelBaseClass alloc]initWithDictionary:dic];
                if (ShoppingModel.goodsname)
                {
                    _goods_id=ShoppingModel.goodsid;
                    [self.commodityListArr addObject:ShoppingModel];
                }
                
            }
            
            [_commodityListView.mj_footer endRefreshing];
            
            [self.commodityView myArticleViewReloadTableViewSetData:self.commodityListArr];
        }];
        
        
    }]];
    
    [_commodityListView.mj_header beginRefreshing];
    
}
-(CommodityView*)commodityView
{
    
    if (!_commodityView)
    {
        _commodityView=[[CommodityView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64)];
        _commodityView.backgroundColor=[UIColor lightGrayColor];
        _commodityView.tag=100;
        [_commodityView myArticleViewDidSelectRowIndexPath:^(NSIndexPath *indexPath) {
            
            
            if (_commodityListArr.count != 0)
            {
                ShoppingModelBaseClass *resultModel= [_commodityListArr objectAtIndex:indexPath.row];
                NNLog(@"0------%@",resultModel);
                CommodityDetailViewController *detailVC=[[CommodityDetailViewController alloc]init];
                detailVC.goodsname=resultModel.goodsname;
                detailVC.CommodityUrl=resultModel.url;
                [self.navigationController pushViewController:detailVC animated:YES];
                
            }
            
        }];
        
        
    }
    return _commodityView;
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
