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

@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [Tool initWithNavViewWith:@"够创意" leftIteamHidden:YES selfView:self];
    
    [self initSegView];
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

    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys: [UIFont systemFontOfSize:16],UITextAttributeFont ,[UIColor whiteColor],UITextAttributeTextShadowColor ,nil];
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
    if ([typeStr isEqualToString:@"0"])
    {
//        for (UIView *obj in [self.view subviews])
//        {
//            [obj removeFromSuperview];
//        }
//        [self segMentClick];
//        ZXKCViewController *zxkcVC = [[ZXKCViewController alloc] initWithFrame:CGRectMake(0, 64+44, Width_MY, Height_MY-113-44)];
//        [self addChildViewController:zxkcVC];
//        [self.view addSubview:zxkcVC.view];
    }
    else if([typeStr isEqualToString:@"1"])
    {
//        for (UIView *obj in [self.view subviews])
//        {
//            [obj removeFromSuperview];
//        }
//        [self initSegView];
//        ZBKCViewController *zbkcVC = [[ZBKCViewController alloc] initWithFrame:CGRectMake(0, 64+44, Width_MY, Height_MY-113-44)];
//        
//        [self addChildViewController:zbkcVC];
//        [self.view addSubview:zbkcVC.view];
        
    }
    else if([typeStr isEqualToString:@"2"])
    {
//        for (UIView *obj in [self.view subviews])
//        {
//            [obj removeFromSuperview];
//        }
//        [self initSegView];
//        LinCYXViewController *xlkcVC = [[LinCYXViewController alloc] initWithFrame:CGRectMake(0, 64+44, Width_MY, Height_MY-113-44)];
//        
//        [self addChildViewController:xlkcVC];
//        [self.view addSubview:xlkcVC.view];
        
    }
    else if([typeStr isEqualToString:@"3"])
    {
//        for (UIView *obj in [self.view subviews])
//        {
//            [obj removeFromSuperview];
//        }
//        [self initSegView];
        
        
        
    }
    
    
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
