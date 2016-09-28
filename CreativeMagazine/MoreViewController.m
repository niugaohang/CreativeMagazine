//
//  MoreViewController.m
//  CreativeMagazine
//
//  Created by 牛高航 on 16/9/21.
//  Copyright © 2016年 牛高航. All rights reserved.
//

#import "MoreViewController.h"
#import "Header.h"
#import "FTWCache.h"

@interface MoreViewController ()<UITableViewDataSource,UITableViewDelegate>
{
   UITableView*_moreTableView;
}

@property(nonatomic,retain)NSArray *sectionArr;
@property(nonatomic,retain)NSArray *indexRowArr;

@end

@implementation MoreViewController
-(void)viewWillAppear:(BOOL)animated
{
    //    隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [_moreTableView reloadData];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sectionArr=@[@"账号管理",@"推荐功能",@"系统功能"];
    
    _indexRowArr=@[@"分享账号管理",@"帮我们评分吧!",@"分享创意画报！",@"用邮件分享给好友！",@"意见反馈",@"清除缓存"];
    
    _moreTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, VIEW_WIDTH, VIEW_HEIGHT-20-49) style:UITableViewStyleGrouped];
    [_moreTableView setBackgroundColor:[UIColor whiteColor]];
    _moreTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _moreTableView.delegate=self;
    _moreTableView.dataSource=self;
    _moreTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _moreTableView.showsVerticalScrollIndicator=NO;

    [self.view addSubview:_moreTableView];
    [self initTableHeaderView];
}
-(void)initTableHeaderView
{
    UIView *headBGView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 126)];
    
    UIImageView *headerImg = [[UIImageView alloc]init];
    headerImg.center=CGPointMake(VIEW_WIDTH/2, 40);
    headerImg.bounds=CGRectMake(0, 0, 174, 83);
    headerImg.image = [UIImage imageNamed:@"logo.png"];
    [headBGView addSubview:headerImg];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, VIEW_WIDTH, 21)];
    label1.text = @"创意画报iPone版";
    label1.textAlignment=NSTextAlignmentCenter;
    [headBGView addSubview:label1];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 105, VIEW_WIDTH, 21)];
    label2.text = @"版本:2.0";
    label2.font = [UIFont systemFontOfSize:13];
    label2.textAlignment=NSTextAlignmentCenter;
    [headBGView addSubview:label2];

    _moreTableView.tableHeaderView = headBGView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
#pragma mark ---UITableViewDataSource&&UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }
    if (section==1)
    {
       return 3;
    }
    if (section==2)
    {
       return 2;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* indetifier=@"MyCells";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:indetifier];
    if (!cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetifier ];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 0)
    {
        if (indexPath.row==0)
        {
            cell.textLabel.text = _indexRowArr[indexPath.row];
        }
    }
    if (indexPath.section == 1)
    {
        cell.textLabel.text = _indexRowArr[indexPath.row+1];
    }
    if (indexPath.section == 2)
    {
        cell.textLabel.text = _indexRowArr[indexPath.row+4];
        if (indexPath.row==1)
        {
            NSString *dataPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/niugaohang.CreativeMagazine/"];
            CGFloat myFTWCahe=[self folderSizeAtPath:[FTWCache cacheDirectory]];
            cell.textLabel.text=[NSString stringWithFormat:@"清除缓存(%.fM)",[self folderSizeAtPath:dataPath]+myFTWCahe];
        }
    }
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2)
    {
        if (indexPath.row == 1)
        {
            
            //清除缓存
            NSString *dataPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/niugaohang.CreativeMagazine/"];
            [[NSFileManager defaultManager] removeItemAtPath:dataPath error:nil];
            [[SDImageCache sharedImageCache] clearDisk];
            [[SDImageCache sharedImageCache] clearMemory];
            [_moreTableView reloadData];
            [FTWCache resetCache];
            NNToast(@"清除成功");
            
        }
    }

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [[UIView alloc]init];
    sectionView.backgroundColor = [UIColor whiteColor];
    sectionView.frame = CGRectMake(0, 0, VIEW_WIDTH, 40);
    UILabel *sectionLab = [[UILabel alloc]init];
    sectionLab.font=[UIFont systemFontOfSize:17];
    sectionLab.textColor=NNRGBAColor(18, 156, 159, 1);
    [sectionView addSubview:sectionLab];
    sectionLab.frame    = CGRectMake(15, 5,140, 30);
    sectionLab.text = _sectionArr[section];
    return sectionView;
}
//区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    //隔条
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = RGB(239);
    bgView.frame = CGRectMake(0, 0, VIEW_WIDTH, 0.1);
    return bgView;
}
//遍历文件夹获得文件夹大小，返回多少M
- (float ) folderSizeAtPath:(NSString*) folderPath
{    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath])
        return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil)
    {
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1000.0*1000.0);
}
//单个文件的大小
- (long long) fileSizeAtPath:(NSString*) filePath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath])
    {
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
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
