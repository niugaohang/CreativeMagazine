//
//  ShoppingViewController.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/21.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "ShoppingViewController.h"
#import "Header.h"
@interface ShoppingViewController ()


@property (nonatomic , retain)UISegmentedControl  *segCtrl;

@property (nonatomic,strong)CommodityView *commodityView;
@property (nonatomic,strong)CommodityViewBL   *commodityViewBL;
@property (nonatomic,strong)NSMutableArray*commodityListArr;

@property(nonatomic,assign)NSString *goods_id;
@property(nonatomic,assign)NSString *type;
@property(nonatomic,assign)NSString *status;

//类目
@property (nonatomic,strong)CategoryView *categoryView;
@property (nonatomic,strong)NSMutableArray*categoryListArr;


@end

@implementation ShoppingViewController
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
    // Do any additional setup after loading the view.
    
    [Tool initWithNavViewWith:@"购创意" leftIteamHidden:YES selfView:self];
    
    [self initSegView];
    
    
    [self.view addSubview:self.commodityView];

    
    self.commodityListArr=[NSMutableArray array];
    
    self.categoryListArr=[NSMutableArray array];
    
    UITableView* _commodityListView=[self.commodityView getMyListTableView];
    
    
    [_commodityListView setMj_header:[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [SVProgressHUD showWithStatus:@"正在加载数据"];
        [self.commodityViewBL getCommodityViewWithStatus:@"up" Type:_type GoodsID:@"" withSuccessedBlock:^(id obj) {
            [_commodityListArr removeAllObjects];
            for (NSDictionary *dic in obj)
            {
                ShoppingModelBaseClass *ShoppingModel=[[ShoppingModelBaseClass alloc]initWithDictionary:dic];
                if (ShoppingModel.goodsname)
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
        
        [self.commodityViewBL getCommodityViewWithStatus:@"down" Type:_type GoodsID:_goods_id withSuccessedBlock:^(id obj) {
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
    
    //类目
    UITableView* categoryView=[self.categoryView getMyListTableView];
    
    
    [categoryView setMj_header:[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [SVProgressHUD showWithStatus:@"正在加载数据"];
        [self.commodityViewBL getCommodityViewWithStatus:@"up" Type:_type GoodsID:@"" withSuccessedBlock:^(id obj) {
            [_categoryListArr removeAllObjects];
            for (NSDictionary *dic in obj)
            {
                CategoryListBaseClass *ShoppingModel=[[CategoryListBaseClass alloc]initWithDictionary:dic];
                
                [self.categoryListArr addObject:ShoppingModel];
            }
            [SVProgressHUD dismiss];
            [categoryView.mj_header endRefreshing];
            
            [self.categoryView myArticleViewReloadTableViewSetData:self.categoryListArr];
        }];
        
    }]];
    
    [self requestWithTheData:@"0"];
}
-(void)initSegView
{
    UIView *segView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, 44)];
    segView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:segView];
    
    UILabel *segBg = [[UILabel alloc]initWithFrame:CGRectMake(0, 43.5, VIEW_WIDTH, 0.5)];
    segBg.backgroundColor=UIColorFromRGB(0xe5e5e5);
    [segView addSubview:segBg];
    
    NSArray *arr = [ NSArray arrayWithObjects : @"新品",@"热卖",@"特价",@"类别", nil ];
    
    _segCtrl = [[UISegmentedControl alloc]initWithItems:arr];
    
    _segCtrl.tintColor = NNRGBColor(35);
    [_segCtrl setFrame : CGRectMake(15,4,VIEW_WIDTH-30,36)];

    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:16],NSFontAttributeName ,[UIColor whiteColor],NSStrokeColorAttributeName ,nil];
    [_segCtrl setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    [_segCtrl addTarget:self action:@selector(segMentClick) forControlEvents: UIControlEventValueChanged];
    _segCtrl.selectedSegmentIndex = 0;
    _segCtrl.momentary = NO;
    [segView addSubview :_segCtrl];
}

-(void)segMentClick
{
    switch (_segCtrl.selectedSegmentIndex)
    {
        case 0:
        {
            [self requestWithTheData:@"0"];
            _segCtrl.selectedSegmentIndex = 0;
        }
            break;
        case 1:
        {
            [self requestWithTheData:@"1"];
            _segCtrl.selectedSegmentIndex = 1;
        }
            break;
        case 2:
        {
            [self requestWithTheData:@"2"];
            _segCtrl.selectedSegmentIndex = 2;
        }
            break;
        case 3:
        {
            [self requestWithTheData:@"3"];
            _segCtrl.selectedSegmentIndex = 3;
        }
            break;
        default:
            break;
            
    }
}
#pragma mark - 请求数据
-(void)requestWithTheData:(NSString *)typeStr
{
    UITableView*commodityListView=[self.commodityView getMyListTableView];
    if ([typeStr isEqualToString:@"0"])
    {
        _type=@"new";
        [commodityListView.mj_header beginRefreshing];
    }
    else if([typeStr isEqualToString:@"1"])
    {
        _type=@"hot";
        [commodityListView.mj_header beginRefreshing];
    }
    else if([typeStr isEqualToString:@"2"])
    {
        
    }
    else if([typeStr isEqualToString:@"3"])
    {
        UITableView* categoryView=[self.categoryView getMyListTableView];
        _type=@"cate";
        [categoryView.mj_header beginRefreshing];
        
        //类目
        [self.view addSubview:self.categoryView];
    }
    
    
}

-(CommodityView*)commodityView
{
    
    if (!_commodityView)
    {
        _commodityView=[[CommodityView alloc] initWithFrame:CGRectMake(0, 64+44, VIEW_WIDTH, VIEW_HEIGHT-64-44-49)];
        _commodityView.backgroundColor=[UIColor lightGrayColor];
        
        [_commodityView myArticleViewDidSelectRowIndexPath:^(NSIndexPath *indexPath) {
            
            
            if (_commodityListArr.count != 0)
            {
                ShoppingModelBaseClass *resultModel= [_commodityListArr objectAtIndex:indexPath.row];
                NNLog(@"0------%@",resultModel);
//                CKWX_DetailViewController *detailVC=[[CKWX_DetailViewController alloc]init];
//                detailVC.wxId=resultModel.internalBaseClassIdentifier;
//                detailVC.wxType=@"1";
//                [self.navigationController pushViewController:detailVC animated:YES];
                
            }
            
        }];
        

    }
    return _commodityView;
}
//类目
-(CategoryView*)categoryView
{
    
    if (!_categoryView)
    {
        _categoryView=[[CategoryView alloc] initWithFrame:CGRectMake(0, 64+44, VIEW_WIDTH, VIEW_HEIGHT-64-44-49)];
        _categoryView.backgroundColor=[UIColor lightGrayColor];
        
        [_categoryView myArticleViewDidSelectRowIndexPath:^(NSIndexPath *indexPath) {
            
            
            if (_commodityListArr.count != 0)
            {
                ShoppingModelBaseClass *resultModel= [_commodityListArr objectAtIndex:indexPath.row];
                NNLog(@"0------%@",resultModel);
                //                CKWX_DetailViewController *detailVC=[[CKWX_DetailViewController alloc]init];
                //                detailVC.wxId=resultModel.internalBaseClassIdentifier;
                //                detailVC.wxType=@"1";
                //                [self.navigationController pushViewController:detailVC animated:YES];
                
            }
            
        }];
        
        
    }
    return _categoryView;
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
