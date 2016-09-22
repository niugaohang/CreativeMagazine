//
//  VisionMagDetailViewController.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/22.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "VisionMagDetailViewController.h"
#import "Header.h"
@interface VisionMagDetailViewController ()<UIWebViewDelegate>
{
    UIImageView *_bottomBackgroundImg;
    UIButton    *_shareBtn;
    UIButton    *_previousBtn;
    UIButton    *_nextBtn;
    UIWebView   *_webView;
    UILabel     *_titleLabel;
}

@end

@implementation VisionMagDetailViewController
- (void)setSelectIndex:(int)newSelectIndex {
    
    _selectIndex = newSelectIndex;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
   
    [self initNavView];
    [self initWebView];
    
    [self  bottomView];
    
    _currentIndex = self.selectIndex;
}

-(void)initNavView
{
    self.view.backgroundColor=NNRGBAColor(235.0, 235.0, 235.0, 1);
    //    导航条
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"return.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backTopVC)];
    leftBtnItem.tintColor=[UIColor whiteColor];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, leftBtnItem, nil];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH-120, 44)];
    _titleLabel.font = [UIFont systemFontOfSize:17];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = self.reModel.title;
    self.navigationItem.titleView = _titleLabel;
    
    [self.navigationController.navigationBar setBarTintColor:NNRGBAColor(35.0, 131.0, 221.0, 1.0)];
}

-(void)initWebView
{
    
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64-50)];
    
    _webView.scalesPageToFit = NO;
    _webView.delegate        = self;
    
    
    NSURL *url              = [NSURL URLWithString:self.reModel.contenturl];
    NSLog(@"URL__________  %@",url);
    
    NSURLRequest *request   = [NSURLRequest requestWithURL:url];
    
    [_webView loadRequest:request];
    
    [self.view addSubview:_webView];
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [SVProgressHUD showWithStatus:@"加载中..."];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [SVProgressHUD dismiss];
    
}





-(void)bottomView
{
    _bottomBackgroundImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, VIEW_HEIGHT - 50, VIEW_WIDTH, 50)];
    _bottomBackgroundImg.image = [UIImage imageNamed:@"bottom_nav_background.png"];
    _bottomBackgroundImg.userInteractionEnabled = YES;
    [self.view addSubview:_bottomBackgroundImg];
    
    
    
    _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _shareBtn.frame = CGRectMake(10, 5, 50, 40);
    [_shareBtn setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    [_shareBtn addTarget:self action:@selector(toShare) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBackgroundImg addSubview:_shareBtn];
    
    _previousBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _previousBtn.frame = CGRectMake(VIEW_WIDTH-10-60-10-60, 7.5, 60, 35);
    if (_selectIndex==0) {
        [_previousBtn setImage:[UIImage imageNamed:@"first.png"] forState:UIControlStateNormal];
    }
    else{
        [_previousBtn setImage:[UIImage imageNamed:@"previous.png"] forState:UIControlStateNormal];
    }
    
   
    [_previousBtn addTarget:self action:@selector(previousButton) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBackgroundImg addSubview:_previousBtn];
    
    
    
    _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _nextBtn.frame = CGRectMake(VIEW_WIDTH-10-60, 7.5, 60, 35);
   
    if (_selectIndex==self.dataArr.count-1) {
        [_nextBtn setImage:[UIImage imageNamed:@"last.png"] forState:UIControlStateNormal];
    }
    else{
        [_nextBtn setImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
    }

    [_nextBtn addTarget:self action:@selector(nextButton) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBackgroundImg addSubview:_nextBtn];

}


-(void)previousButton
{
    if (_selectIndex==0)
    {
        NNToast(@"已经是第一页了");
        
    }
    else
    {
         [_nextBtn setImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
       
        _selectIndex = _selectIndex -1;
        VisionMagDetailModel *visionMagDetailModel = [_dataArr objectAtIndex:_selectIndex];
        
        _titleLabel.text = visionMagDetailModel.title;
        
        NSURL *url              = [NSURL URLWithString:visionMagDetailModel.contenturl];
        
        NSURLRequest *request   = [NSURLRequest requestWithURL:url];
        
        [_webView loadRequest:request];

    }
    
    if (_selectIndex==0) {
        [_previousBtn setImage:[UIImage imageNamed:@"first.png"] forState:UIControlStateNormal];
    }
    
}
-(void)nextButton
{
    if (_selectIndex==self.dataArr.count-1)
    {
         NNToast(@"已经是最后一页了");
       
    }
    else{
        
         [_previousBtn setImage:[UIImage imageNamed:@"previous.png"] forState:UIControlStateNormal];
        _selectIndex = _selectIndex +1;
        VisionMagDetailModel *visionMagDetailModel = [_dataArr objectAtIndex:_selectIndex];
        
        _titleLabel.text = visionMagDetailModel.title;
        
        NSURL *url              = [NSURL URLWithString:visionMagDetailModel.contenturl];
        
        NSURLRequest *request   = [NSURLRequest requestWithURL:url];
        
        [_webView loadRequest:request];

        
    }
    
    if (_selectIndex==self.dataArr.count-1) {
         [_nextBtn setImage:[UIImage imageNamed:@"last.png"] forState:UIControlStateNormal];
    }
}

-(void)toShare
{
    NNLog(@"分享");
    
}
-(void)backTopVC
{
    [self.navigationController popViewControllerAnimated:YES];
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
