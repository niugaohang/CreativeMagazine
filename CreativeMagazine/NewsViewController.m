//
//  NewsViewController.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/21.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "NewsViewController.h"
#import "Header.h"
@interface NewsViewController ()<UIScrollViewDelegate>
{
    //标题
    UIScrollView *_titleScroller;
    //线
    UILabel    *_flagLab;
    
    UIScrollView *_newsScrollView;
    
    NSMutableSet    *recycledPages;
    NSMutableSet    *visiblePages;
    
    NSMutableArray         *_typeArr1;
    NSMutableArray         *_typeArr2;
    NSMutableArray         *_typeArr3;
    
}

//数据
@property (nonatomic,retain)NSArray *titleArray;

@property(nonatomic,retain)NSMutableArray *dataArr;

@property(nonatomic,retain)NSMutableArray *listDataArr;

@property (nonatomic,strong)NSMutableArray *tableViewManager;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [Tool initWithNavViewWith:@"鲜资讯" leftIteamHidden:YES selfView:self];
    
    _titleArray = @[@"全部", @"手工",@"创意",@"艺术"];
    _listDataArr=[[NSMutableArray alloc]initWithCapacity:0];
    _dataArr=[[NSMutableArray alloc]initWithCapacity:0];
    self.tableViewManager = [[NSMutableArray alloc] init];
    
    _typeArr1=[[NSMutableArray alloc]initWithCapacity:0];
    _typeArr2=[[NSMutableArray alloc]initWithCapacity:0];
    _typeArr3=[[NSMutableArray alloc]initWithCapacity:0];
    
    [self reloading];
    
}
-(void)reloading
{
    [SVProgressHUD showWithStatus:@"正在加载数据"];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        [[MyRequest defaultRequest]getRequestWithTheType:ALLNEWSDATA_URL theContent:nil successBlock:^(id obj) {
            
            [_dataArr removeAllObjects];
            for (NSDictionary *dic in obj)
            {
                VisionMagModel *allData=[[VisionMagModel alloc]initWithDictionary:dic];
                [_dataArr addObject:allData];
            }
            for (VisionMagModel *obj in _dataArr)
            {
                if ([obj.type isEqualToString:@"1"])
                {
                    [_typeArr1 addObject:obj];
                    
                }
                if ([obj.type isEqualToString:@"2"])
                {
                    [_typeArr2 addObject:obj];
                }
                if ([obj.type isEqualToString:@"3"])
                {
                    [_typeArr3 addObject:obj];
                }
            }

            dispatch_async(dispatch_get_main_queue(), ^{
                [self initView];
                
            });
            
            
        } failureBlock:^(NSString *error) {
            
            [SVProgressHUD dismiss];
            NNToast(error);
            [self huoQuNewsData];
            
        }];
    });
}

-(void)huoQuNewsData
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"NewsData" ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *dataDicArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    [_dataArr removeAllObjects];
    for (NSDictionary *dic in dataDicArr)
    {
        VisionMagModel *allData=[[VisionMagModel alloc]initWithDictionary:dic];
        [_dataArr addObject:allData];
    }
    for (VisionMagModel *obj in _dataArr)
    {
        if ([obj.type isEqualToString:@"1"])
        {
            [_typeArr1 addObject:obj];
            
        }
        if ([obj.type isEqualToString:@"2"])
        {
            [_typeArr2 addObject:obj];
        }
        if ([obj.type isEqualToString:@"3"])
        {
            [_typeArr3 addObject:obj];
        }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self initView];
        
    });

}

-(void)initView
{
    
    _titleScroller = [[UIScrollView alloc] init];
    
    _titleScroller.frame = CGRectMake(0, 64, VIEW_WIDTH, 45);
    _titleScroller.backgroundColor = [UIColor whiteColor];
    _titleScroller.showsHorizontalScrollIndicator = NO;
    _titleScroller.showsVerticalScrollIndicator = NO;
    //顶部tabbar的总长度
    CGFloat _titleScrollerWidth = 16.0;
     CGSize size1=[_titleArray[1] sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17],NSFontAttributeName, nil]];
    //每个tab偏移量
//    CGFloat xOffset = VIEW_WIDTH/_titleArray.count;
    CGFloat xOffset = (VIEW_WIDTH-(_titleArray.count*size1.width))/(_titleArray.count+1);
    //    标题显示更多，点击进入跟你更多分类界面。
    for (int i = 0; i < _titleArray.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.backgroundColor = [UIColor whiteColor];
        
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:17];
        CGSize size=[button.titleLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:button.titleLabel.font,NSFontAttributeName, nil]];
        
        
        
        //累计每个tab文字的长度
        _titleScrollerWidth += 17.0+ceilf(size.width);
        //设置按钮尺寸
        [button setFrame:CGRectMake(xOffset+(xOffset+size.width)*i,0,size.width, 44)];
        //计算下一个tab的x偏移量
//        xOffset += size.width +xOffset;
        [button setTitleColor:NNRGBColor(144) forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(titleZiXunBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_titleScroller addSubview:button];
        //改变第一个按钮默认颜色
        if (i == 0) {
            [button setTitleColor:NNRGBColor(35) forState:UIControlStateNormal];
            //红线
            _flagLab = [[UILabel alloc] init];
            _flagLab.center = CGPointMake(button.center.x, button.bounds.size.height-3);
            _flagLab.bounds=CGRectMake(0, 0, size.width, 2);
            _flagLab.backgroundColor = NNRGBColor(35);
        }
        
        if (i==_titleArray.count-1)
        {
            _titleScrollerWidth=CGRectGetMaxX(button.frame);
        }
    }
    [_titleScroller addSubview:_flagLab];
    _titleScroller.contentSize = CGSizeMake(_titleScrollerWidth+30, 45);
    
    [self.view addSubview:_titleScroller];
    
    UILabel *lineLab=[[UILabel alloc]initWithFrame:CGRectMake(0,64+44.5 ,VIEW_WIDTH, 0.5)];
    lineLab.backgroundColor=UIColorFromRGB(0xe5e5e5);
    [self.view addSubview:lineLab];

    
    if (!_newsScrollView)
    {
        _newsScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+45,VIEW_WIDTH , VIEW_HEIGHT-64-45-49)];
    }
    _newsScrollView.pagingEnabled=YES;
    _newsScrollView.delegate=self;
    _newsScrollView.showsVerticalScrollIndicator=NO;
    _newsScrollView.showsHorizontalScrollIndicator=NO;
    _newsScrollView.backgroundColor=[UIColor whiteColor];
     [self.view addSubview:_newsScrollView];
    
    for (int i = 0; i < _titleArray.count; i ++) {
        
      NewsTableVC *newsTableVC = [[NewsTableVC alloc] initWithFrame:CGRectMake(i * _newsScrollView.bounds.size.width, 0, _newsScrollView.bounds.size.width, _newsScrollView.bounds.size.height)];

        //添加到子视图控制器，让子视图控制器管理视图控制器内存
        [self addChildViewController:newsTableVC];
        [_newsScrollView addSubview:newsTableVC.view];
        //存入表管理器
        [_tableViewManager addObject:newsTableVC];
        NNLog(@"---%d",i);
        if (i==0)
        {
            newsTableVC.dataArr=self.dataArr;
            newsTableVC.isLoading=YES;
        }
        
    }
    _newsScrollView.contentSize=CGSizeMake(VIEW_WIDTH * _titleArray.count, VIEW_HEIGHT-64-49-45);
   

}

#pragma mark -scrollViewDelegate
//视图滑动时
//我们移动手指开始
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    //判断是 最后一页
    if (_newsScrollView.contentOffset.x>=_newsScrollView.frame.size.width*([self.titleArray count]-1)+50) {
        NNToast(@"已经是最后一页了");
    }
    if (_newsScrollView.contentOffset.x<50) {
        NNToast(@"已经是第一页了");
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //判断是 第一页
    

    
    int index = scrollView.contentOffset.x / scrollView.bounds.size.width;

    NewsTableVC *newsTableVC = _tableViewManager[index];
    
    if (!newsTableVC.isLoading)
    {
        if (index==0)
        {
            newsTableVC.dataArr=self.dataArr;
        }
        if (index==1)
        {
            newsTableVC.dataArr=_typeArr1;
        }
        if (index==2)
        {
            newsTableVC.dataArr=_typeArr2;
        }
        if (index==3)
        {
            newsTableVC.dataArr=_typeArr3;
        }

        newsTableVC.isLoading = YES;
    }
    
    NSArray *array = _titleScroller.subviews;
    for (id obj in array) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)obj;
            //复原未被点击按钮颜色
            [obj setTitleColor:NNRGBColor(144.0) forState:UIControlStateNormal];
            if (button.tag == index) {
                //更改被点击按钮颜色
                [button setTitleColor:NNRGBColor(35) forState:UIControlStateNormal];
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:0.5];
                
                
            }
        }
    }
    
    //红线位置
    UIButton* sender=[_titleScroller.subviews objectAtIndex:index];
    _flagLab.center = CGPointMake(sender.center.x, sender.bounds.size.height-3);
    _flagLab.bounds=CGRectMake(0, 0, CGRectGetWidth(sender.frame), 2);
    [UIView commitAnimations];
    
}
#pragma amrk - 标题按钮
-(void)titleZiXunBtn:(UIButton *)sender {
   
    NewsTableVC *newsTableVC = _tableViewManager[sender.tag];
    
    if (!newsTableVC.isLoading)
    {
        if (sender.tag==0)
        {
            newsTableVC.dataArr=self.dataArr;
        }
        if (sender.tag==1)
        {
            newsTableVC.dataArr=_typeArr1;
        }
        if (sender.tag==2)
        {
            newsTableVC.dataArr=_typeArr2;
        }
        if (sender.tag==3)
        {
            newsTableVC.dataArr=_typeArr3;
        }
        
        newsTableVC.isLoading = YES;
    }

    
    //复原未被点击按钮颜色
    NSArray *array = sender.superview.subviews;
    for (id obj in array) {
        if ([obj isKindOfClass:[UIButton class]]) {
            [obj setTitleColor:NNRGBColor(144.0) forState:UIControlStateNormal];
        }
    }
    //更改被点击按钮颜色
    [sender setTitleColor:NNRGBColor(35) forState:UIControlStateNormal];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    NSString *str = sender.titleLabel.text;
    UIFont *font = [UIFont systemFontOfSize:17];
    //  默认 获得  在17号字 所占的宽高
    CGSize size = [str sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    //红线位置
    _flagLab.center = CGPointMake(sender.center.x, sender.bounds.size.height-3 );
    _flagLab.bounds=CGRectMake(0, 0, size.width, 2);
    [UIView commitAnimations];
    
       //内容UIScrollView滑动
    _newsScrollView.contentOffset = CGPointMake(VIEW_WIDTH * sender.tag, 0);
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
