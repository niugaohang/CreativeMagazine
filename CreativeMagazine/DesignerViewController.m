//
//  DesignerViewController.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/21.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "DesignerViewController.h"
#import "Header.h"
@interface DesignerViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  *_tableView;
    UIRefreshControl *_refreshControl;
    
}

@property (nonatomic,retain) NSMutableArray *dataArray;



@end

@implementation DesignerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [Tool initWithNavViewWith:@"设计师" leftIteamHidden:YES selfView:self];

    _dataArray =[[NSMutableArray alloc]initWithCapacity:0];
    
    [self reloading];
}
-(void)reloading
{
    [SVProgressHUD showWithStatus:@"正在加载数据"];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        [[MyRequest defaultRequest]getRequestWithTheType:DESIGNERS_URL theContent:nil successBlock:^(id obj) {
            
            [_dataArray removeAllObjects];
            for (NSDictionary *dic in obj)
            {
                VisionMagModel *allData=[[VisionMagModel alloc]initWithDictionary:dic];
                [_dataArray addObject:allData];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self initView];
                [SVProgressHUD dismiss];
            });
            
            
        } failureBlock:^(NSString *error) {
            
            [SVProgressHUD dismiss];
            NNToast(error);
        }];
    });
}


-(void)initView {
    
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64,VIEW_WIDTH , VIEW_HEIGHT-64-49) style:UITableViewStylePlain];
    }
    
    _tableView.showsVerticalScrollIndicator=NO;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    //    _tableView.backgroundColor =NNRandomColor;
    
    [self.view addSubview:_tableView];
    
    [_tableView reloadData];
    
    
    _refreshControl = [[UIRefreshControl alloc] init];
    _refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"努力加载中……"];
    _refreshControl.tintColor = [UIColor grayColor];
    [_refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    _tableView.refreshControl = _refreshControl;
    
    
}

- (void)loadData{

    // 请求数据
  
    // 结束刷新
    [_refreshControl endRefreshing];
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.dataArray.count != 0)
    {
        NewsTableCell *cell = [[NewsTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        
        VisionMagModel *visionMagModel=[self.dataArray objectAtIndex:indexPath.row];
        CGFloat heigth = [cell cellFrameHeigth:visionMagModel];
        return heigth;
    }
    return 110;
    
    
}


- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell)
    {
        cell = [[NewsTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    if (self.dataArray.count != 0) {
        VisionMagModel *visionMagModel=[self.dataArray objectAtIndex:indexPath.row];
        cell.reModel=visionMagModel;
        
        //        cell.backgroundColor=NNRandomColor;
        
    }
    return cell;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VisionMagModel *visionMagModel    = [self.dataArray objectAtIndex:indexPath.row];
    
    VisionMagDetailViewController *visionMagDetailVC = [[VisionMagDetailViewController alloc]init];
    visionMagDetailVC.reModel=visionMagModel;
    visionMagDetailVC.dataArr=self.dataArray;
    visionMagDetailVC.selectIndex=(int)indexPath.row;
    
    [self.navigationController pushViewController:visionMagDetailVC animated:YES];
    
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
