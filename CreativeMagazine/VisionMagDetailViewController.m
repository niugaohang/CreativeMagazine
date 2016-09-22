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
}

@end

@implementation VisionMagDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [Tool initWithNavViewWith:self.reModel.title selfView:self];
    
    self.title=self.reModel.title;
    
    [self initWebView];
    
    [self  bottomView];
    
    
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
    [_previousBtn setImage:[UIImage imageNamed:@"previous.png"] forState:UIControlStateNormal];
    [_previousBtn addTarget:self action:@selector(previousButton:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBackgroundImg addSubview:_previousBtn];
    
    
    
    _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _nextBtn.frame = CGRectMake(VIEW_WIDTH-10-60, 7.5, 60, 35);
    [_nextBtn setImage:[UIImage imageNamed:@"next.png"] forState:UIControlStateNormal];
    [_nextBtn addTarget:self action:@selector(nextButton:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBackgroundImg addSubview:_nextBtn];

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
