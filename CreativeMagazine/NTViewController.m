//
//  NTViewController.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/21.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "NTViewController.h"
#import "Header.h"
@interface NTViewController ()
{
    UIImageView *_tabBarView;
    NTButton * _previousBtn;//记录前一次选中的按钮
}

@end

@implementation NTViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //wsq
    for (UIView* obj in self.tabBar.subviews) {
        if (obj != _tabBarView){
            [obj removeFromSuperview];
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tabBarView = [[UIImageView alloc]initWithFrame:self.tabBar.bounds];
    _tabBarView.userInteractionEnabled = YES;
    _tabBarView.image = [UIImage imageNamed:@"bottom_nav_background.png"];
     [self.tabBar addSubview:_tabBarView];
    
    
    //   精选
    SelectionViewController *selectionVC      = [[SelectionViewController alloc]init];
    UINavigationController * navi1 = [[BaseNavigationViewController alloc]initWithRootViewController:selectionVC];
    
    //    鲜资讯
    NewsViewController *newsVC    = [[NewsViewController alloc]init];
    UINavigationController * navi2 = [[BaseNavigationViewController alloc]initWithRootViewController:newsVC];
    
    //   设计师
    DesignerViewController *designerVC    = [[DesignerViewController alloc]init];
    UINavigationController * navi3 = [[BaseNavigationViewController alloc]initWithRootViewController:designerVC];
    
    //    购创意
    ShoppingViewController *shoppingVC  = [[ShoppingViewController alloc]init];
    UINavigationController * navi4 = [[BaseNavigationViewController alloc]initWithRootViewController:shoppingVC];
    
    //    更多
    MoreViewController *moreVC        = [[MoreViewController alloc]init];
    UINavigationController * navi5 = [[BaseNavigationViewController alloc]initWithRootViewController:moreVC];
    
    //设置tabbar
    [self setViewControllers:[NSArray arrayWithObjects:navi1,navi2,navi3,navi4,navi5, nil] animated:YES];
    
    
    //一定要按照顺序来
    [self createButtonWithNormalName:@"logo1.png" selectedName:@"nav_select_background2.png" title:@"精选" index:0];
    [self createButtonWithNormalName:@"logo2.png" selectedName:@"nav_select_background2.png" title:@"鲜资讯" index:1];
    [self createButtonWithNormalName:@"logo3.png" selectedName:@"nav_select_background2.png" title:@"设计师" index:2];
    [self createButtonWithNormalName:@"logo4.png" selectedName:@"nav_select_background2.png" title:@"购创意" index:3];
    [self createButtonWithNormalName:@"logo5.png" selectedName:@"nav_select_background2.png" title:@"更多" index:4];
    
    
    NTButton * button = _tabBarView.subviews[0];
    [self changeViewController:button];

    
    
}

#pragma mark --------创建按钮
-(void)createButtonWithNormalName:(NSString *)normal selectedName:(NSString *)selected title:(NSString *)title index:(int)aIndex
{
    NTButton * customButton = [NTButton buttonWithType:UIButtonTypeCustom];
    customButton.tag = aIndex;
    
    CGFloat buttonW = _tabBarView.frame.size.width / 5;
    CGFloat buttonH = _tabBarView.frame.size.height;
    
    customButton.frame = CGRectMake(buttonW * aIndex, 0, buttonW, buttonH);
    [customButton setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    //这里应该设置选中状态的图片。wsq
    [customButton setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    [customButton setTitle:title forState:UIControlStateNormal];
    [customButton addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchDown];
    
    customButton.imageView.contentMode = UIViewContentModeCenter;
    customButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    customButton.titleLabel.font = [UIFont systemFontOfSize:10];
    [_tabBarView addSubview:customButton];

}

#pragma mark 按钮被点击时调用
- (void)changeViewController:(NTButton *)sender{
    
    
    self.selectedIndex = sender.tag; //切换不同控制器的界面
    
    sender.enabled = NO;
    
    if (_previousBtn != sender) {
        
        _previousBtn.enabled = YES;
        
    }
    _previousBtn = sender;
    
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
