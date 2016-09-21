//
//  BootViewController.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/21.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "BootViewController.h"
#import "Header.h"
@interface BootViewController ()
{
    UIImageView *_bootImgVi;
}

@end

@implementation BootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden=YES;
    
    _bootImgVi=[[UIImageView alloc]initWithFrame:self.view.bounds];
    
    _bootImgVi.image=[UIImage imageNamed:@"Default.png"];
    
    [self.view addSubview:_bootImgVi];
    
    [UIView animateWithDuration:0.5 delay:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        _bootImgVi.alpha=0;
    } completion:^(BOOL finished) {
        
        [_bootImgVi removeFromSuperview];
        
        [self gotoChooseVC];
    }];
    
    
    
}


-(void)gotoChooseVC
{
    NTViewController *ntVC = [[NTViewController alloc]init];
    [[[UIApplication sharedApplication]delegate]window].rootViewController = ntVC;
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
