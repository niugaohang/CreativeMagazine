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
    UIScrollView *_selectionScroll;
    
    NSMutableSet    *recycledPages;
    NSMutableSet    *visiblePages;
    
}

@property(nonatomic,copy)NSMutableArray *dataArr;


@end

@implementation SelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden=YES;
    _dataArr=[[NSMutableArray alloc]initWithCapacity:0];
    
    [self reloading];
    
    
    
}
-(void)reloading
{
    [self initView];
}
-(void)initView
{
    _selectionScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 20,VIEW_WIDTH , VIEW_HEIGHT-20-49)];
    _selectionScroll.pagingEnabled=YES;
    _selectionScroll.delegate=self;
    _selectionScroll.userInteractionEnabled=YES;
    _selectionScroll.showsVerticalScrollIndicator=NO;
    _selectionScroll.showsHorizontalScrollIndicator=NO;
    _selectionScroll.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_selectionScroll];
    
    _selectionScroll.contentSize=CGSizeMake(VIEW_WIDTH * _dataArr.count, VIEW_HEIGHT-20-49);
    
    
    recycledPages   =[[NSMutableSet alloc] init];
    visiblePages    =[[NSMutableSet alloc] init];
    
}




/**
 <#Description#>

 @return <#return value description#>

#pragma mark-
#pragma mark-scrollView重用机制-
- (void)totlePages
{
    // Calculate which pages are visible
    CGRect visibleBounds        = _selectionScroll.bounds;
    int firstNeededPageIndex    = floorf(CGRectGetMinX(visibleBounds) / CGRectGetWidth(visibleBounds));
    
    
    
    int lastNeededPageIndex = floorf((CGRectGetMaxX(visibleBounds)-1) / CGRectGetWidth(visibleBounds));
    firstNeededPageIndex    = MAX(firstNeededPageIndex, 0);
    lastNeededPageIndex     = (unsigned)MIN(lastNeededPageIndex, [self.dataArr count] - 1);
    
    for (CustomView *page in visiblePages)
    {
        if (page.index < firstNeededPageIndex || page.index > lastNeededPageIndex)
        {
            [recycledPages addObject:page];
            [page removeFromSuperview];
        }
    }
    
    [visiblePages minusSet:recycledPages];
    // add missing pages
    for (int index = firstNeededPageIndex; index <= lastNeededPageIndex; index++)
    {
        if (![self isDisplayingPageForIndex:index])
        {
            CustomView *page = [self dequeueRecycledPage];
            if (page == nil)
            {
                page = [[CustomView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64-49)];
            }
            [self configurePage:page forIndex:index];
            [_myScrollView addSubview:page];
            [visiblePages addObject:page];
        }
    }
}

 */
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
