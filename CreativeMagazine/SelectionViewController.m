//
//  SelectionViewController.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/21.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "SelectionViewController.h"
#import "Header.h"
@interface SelectionViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_selectionScrollView;
    
    NSMutableSet    *recycledPages;
    NSMutableSet    *visiblePages;
    
}

@property(nonatomic,retain)NSMutableArray *dataArr;


@end

@implementation SelectionViewController
-(void)viewWillAppear:(BOOL)animated
{
    //    隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   
    [self.navigationController setNavigationBarHidden:NO animated:YES];
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArr=[[NSMutableArray alloc]initWithCapacity:0];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self reloading];
    
    
    
}
-(void)reloading
{
    [SVProgressHUD showWithStatus:@"正在加载数据"];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        [[MyRequest defaultRequest]getRequestWithTheType:NEWVISION_URL theContent:nil successBlock:^(id obj) {
           
            [_dataArr removeAllObjects];
            for (NSDictionary *dic in obj)
            {
                SelectionModelList *allData=[[SelectionModelList alloc]initWithDictionary:dic];
                [_dataArr addObject:allData];
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
-(void)initView
{
    if (!_selectionScrollView)
    {
        _selectionScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 20,VIEW_WIDTH , VIEW_HEIGHT-20-49)];
    }
    _selectionScrollView.pagingEnabled=YES;
    _selectionScrollView.delegate=self;
    _selectionScrollView.showsVerticalScrollIndicator=NO;
    _selectionScrollView.showsHorizontalScrollIndicator=NO;
    _selectionScrollView.backgroundColor=[UIColor whiteColor];
    _selectionScrollView.contentSize=CGSizeMake(VIEW_WIDTH * _dataArr.count, VIEW_HEIGHT-20-49);
    
    [self.view addSubview:_selectionScrollView];
    
    recycledPages   =[[NSMutableSet alloc] init];
    visiblePages    =[[NSMutableSet alloc] init];
    
     [self totlePages];
}




/**
 scrollView重用机制

 @return scrollView重用机制
*/
#pragma mark-
#pragma mark-scrollView重用机制-
- (void)totlePages
{
    // Calculate which pages are visible
    CGRect visibleBounds        = _selectionScrollView.bounds;
    int firstNeededPageIndex    = floorf(CGRectGetMinX(visibleBounds) / CGRectGetWidth(visibleBounds));
    
    
    
    int lastNeededPageIndex = floorf((CGRectGetMaxX(visibleBounds)-1) / CGRectGetWidth(visibleBounds));
    firstNeededPageIndex    = MAX(firstNeededPageIndex, 0);
    lastNeededPageIndex     = (unsigned)MIN(lastNeededPageIndex, [self.dataArr count] - 1);
    
    for (SelectionCustomView *scModel in visiblePages)
    {
        if (scModel.index < firstNeededPageIndex || scModel.index > lastNeededPageIndex)
        {
            [recycledPages addObject:scModel];
            [scModel removeFromSuperview];
        }
    }
    
    [visiblePages minusSet:recycledPages];
    // add missing pages
    for (int index = firstNeededPageIndex; index <= lastNeededPageIndex; index++)
    {
        if (![self isDisplayingPageForIndex:index])
        {
            SelectionCustomView *scModel = [self dequeueRecycledPage];
            if (scModel == nil)
            {
                scModel = [[SelectionCustomView alloc] initWithFrame:CGRectMake(0, 0, _selectionScrollView.bounds.size.width, _selectionScrollView.bounds.size.height)];
            }
            [self configurePage:scModel forIndex:index];
            [_selectionScrollView addSubview:scModel];
            [visiblePages addObject:scModel];
        }
    }
}
- (SelectionCustomView *)dequeueRecycledPage
{
    SelectionCustomView *scModel = [recycledPages anyObject];
    if (scModel) {
        [recycledPages removeObject:scModel];
        scModel = nil;
    }
    return scModel;
}

- (BOOL)isDisplayingPageForIndex:(NSUInteger)index
{
    BOOL foundPage      = NO;
    for (SelectionCustomView *scModel in visiblePages) {
        if (scModel.index  == index) {
            foundPage       = YES;
//            设置Title时,必须在找到当前页的时候才设置
//            textLab.text    = page.model.title;
            
            break;
        }
    }
    return foundPage;
}

- (void)configurePage:(SelectionCustomView *)scModel forIndex:(NSUInteger)index
{
    scModel.index = index;
    
    scModel.reModel = [self.dataArr objectAtIndex:index];
    scModel.frame =CGRectMake( _selectionScrollView.frame.size.width*index, 0, _selectionScrollView.frame.size.width,_selectionScrollView.frame.size.height);
    
    scModel.imgBtn.tag=index;
    [scModel.imgBtn addTarget:self action:@selector(detailsViewButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [scModel.shareBtn addTarget:self action:@selector(shareBtn) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)shareBtn
{
    NNLog(@"分享");
}

-(void)detailsViewButton:(UIButton *)sender
{
    NNLog(@"详情");
    UIButton *btn=(UIButton *)sender;
    
    
    VisionMagDetailModel *visionMagDetailModel = [_dataArr objectAtIndex:btn.tag];
    
    VisionMagDetailViewController *visionMagDetailVC = [[VisionMagDetailViewController alloc]init];
    visionMagDetailVC.reModel=visionMagDetailModel;
    visionMagDetailVC.dataArr=_dataArr;
    visionMagDetailVC.selectIndex=(int)btn.tag;
    
    [self.navigationController pushViewController:visionMagDetailVC animated:YES];
    
}

#pragma mark -scrollViewDelegate
//视图滑动时
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self totlePages];
    //回到第一页重新加载
    if (_selectionScrollView.contentOffset.x>_selectionScrollView.frame.size.width*([self.dataArr count]-1)+100) {
        [_selectionScrollView scrollRectToVisible:CGRectMake(_selectionScrollView.frame.size.width*0,0,_selectionScrollView.frame.size.width,_selectionScrollView.frame.size.height) animated:NO];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //判断是 第一页
    if (_selectionScrollView.contentOffset.x<_selectionScrollView.frame.size.width) {
        NNLog(@"123123123");
        NNToast(@"已经是第一页了");
    }
}
//我们移动手指开始
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    //判断是 最后一页
    if (_selectionScrollView.contentOffset.x>=_selectionScrollView.frame.size.width*([self.dataArr count]-1)+50) {
        NNToast(@"已经是最后一页了");
    }
}
//当滚动视图停止
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;{
////    currentPage = floor((scrollView.contentOffset.x - scrollView.frame.size.width / 2) /  scrollView.frame.size.width) + 1;
////    imgCountLab.text = [NSString stringWithFormat:@"%ld/%lu",(long)currentPage+1,(unsigned long)self.imgArr.count];
//}



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
