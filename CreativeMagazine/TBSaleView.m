//
//  TBSaleView.m
//  CreativeMagazine
//
//  Created by 牛高航 on 2016/9/28.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "TBSaleView.h"
#import "Header.h"
@interface TBSaleView()<UIWebViewDelegate>
{
    UIWebView       *_webView;
}
@property (nonatomic,copy)CellPressedBlock cellBlock;
@property (strong,nonatomic)NSString *currentURL;
@property (strong,nonatomic)NSString *currentTitle;
@property (strong,nonatomic)NSString *currentImg;
@end
@implementation TBSaleView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    if (self)
    {
        [self loadViewWithFrame:frame];
    }
    
    return self;
}

-(void)loadViewWithFrame:(CGRect)frame
{
    
    _webView = [[UIWebView alloc]initWithFrame:frame];
    
    _webView.scalesPageToFit = YES;
    _webView.delegate        = self;
    [self addSubview:_webView];
    
}

-(UIWebView *)getTaobaoSaleView
{
    return _webView;
}

//给表赋值新的数据 并刷新表
-(void)getTaobaoSaleViewSetUrl:(NSString *)strUrl
{
    NSURLRequest *request   = [NSURLRequest requestWithURL:[NSURL URLWithString:strUrl]];
    
    [_webView loadRequest:request];

}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [SVProgressHUD showWithStatus:@"加载中..."];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [SVProgressHUD dismiss];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible =NO;
    
    //获取当前页面的title
    self.currentTitle=[_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    //获取当前页面的url
    self.currentURL = webView.request.URL.absoluteString;
    //获取当前网页的html
    NSString *lJs = @"document.getElementsByTagName('img')[0].src";
    self.currentImg = [webView stringByEvaluatingJavaScriptFromString:lJs];
 
    NNLog(@"------%@-----%@-----%@",self.currentTitle,self.currentURL,self.currentImg);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
