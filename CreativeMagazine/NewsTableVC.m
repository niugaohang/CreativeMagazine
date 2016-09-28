//
//  NewsTableVC.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/23.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "NewsTableVC.h"
#import "Header.h"
@interface NewsTableVC ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  *_tableView;
    UIRefreshControl *_refreshControl;
    //表当前是否加载了
    BOOL _isLoaded;
}

@property (nonatomic,retain) NSMutableArray *dataArray;


@end

@implementation NewsTableVC


- (id)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self)
    {
        self.viewFram = frame;
      
    }
    return self;
}
-(void)setViewFram:(CGRect)viewFram
{
    self.view.frame = viewFram;
    _tableView.frame = self.view.frame;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataArray =[[NSMutableArray alloc]initWithCapacity:0];
    
}
-(void)setIsLoading:(BOOL)isLoading
{
    //隐藏菊花
     if (_isLoaded == NO && isLoading == YES)
    {
        _dataArray=self.dataArr;
       [self initView];
        [_tableView reloadData];
        [SVProgressHUD dismiss];
    }
}
-(void)initView {
    
    //表已经加载过了
    _isLoaded = YES;
    if (_tableView) {
        [_tableView reloadData];
        return;
    }
    
    if (!_tableView)
    {
      _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0,VIEW_WIDTH,VIEW_HEIGHT-64-44-49) style:UITableViewStylePlain];
    }
    
    _tableView.showsVerticalScrollIndicator=YES;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
//    _tableView.backgroundColor =NNRandomColor;
    
    [self.view addSubview:_tableView];
    
     [_tableView reloadData];
    

    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >=10.0) {
        //目前只能下拉刷新
        _refreshControl = [[UIRefreshControl alloc] init];
        _refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"努力加载中……"];
        _refreshControl.tintColor = [UIColor grayColor];
        [_refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
        _tableView.refreshControl = _refreshControl;
    }
    
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
        
        cell.titleLab.text = visionMagModel.title;
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
