//
//  HomePageViewController.m
//  test
//
//  Created by MacBook on 16/9/2.
//  Copyright © 2016年 MacBook. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageTableViewCell.h"
#define MYBOUNDS ([[UIScreen mainScreen] bounds])//设备尺寸
#define MYWIDTH (MYBOUNDS.size.width)       //设备宽度
#define MYHEIGHT (MYBOUNDS.size.height)     //设备高度
#define MYCOLOR(R,G,B,a) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:a] //快颜色
#define Identifier @"CellIdentifier"
@interface HomePageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)UIView * headerView;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:Identifier];
    [self.view addSubview:self.tableView];
    
    
}
#pragma mark - tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HomePageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    if (!cell) {
    cell = [[HomePageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.view1Price.text = @"9.9444444";
    cell.view1Certificate.text = @"微商授权证书";
    cell.view2Name.text = @"太太乐口服液";
    cell.view2Formate.text = @"50ml/瓶*10瓶";
    cell.view2Price.text = @"199";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 2*MYWIDTH;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return MYWIDTH/1.3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
       return self.headerView;
}
#pragma mark - 懒加载

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MYWIDTH, MYHEIGHT) style:UITableViewStyleGrouped];
    }
    return _tableView;
}

- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MYWIDTH, MYWIDTH/1.3)];
        _headerView.backgroundColor = MYCOLOR(46, 166, 206, 1);
        UILabel * titleName = [[UILabel alloc]initWithFrame:CGRectMake(0, 75, MYWIDTH, 60)];
        titleName.textColor = [UIColor whiteColor];
        titleName.font = [UIFont systemFontOfSize:40];
        titleName.textAlignment = NSTextAlignmentCenter;
        titleName.text = @"太太云商";
        [_headerView addSubview:titleName];
        NSArray * Name = @[@"品牌介绍",@"授权查验",@"联系我们"];
        for (int i = 0; i<3; i++) {
            UIButton * headerbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
            headerbtn.layer.masksToBounds = YES;
            headerbtn.layer.cornerRadius = 5;
            headerbtn.center = CGPointMake((2*i+1)*MYWIDTH/6, 222);
            headerbtn.backgroundColor = MYCOLOR(arc4random()%255, arc4random()%255, arc4random()%255, 1);
            [_headerView addSubview:headerbtn];
            
            UILabel * btnName = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
            btnName.textAlignment = NSTextAlignmentCenter;
            btnName.textColor = [UIColor darkGrayColor];
            btnName.font = [UIFont systemFontOfSize:14];
            btnName.center = CGPointMake((2*i+1)*MYWIDTH/6, 275);
            btnName.text = Name[i];
            [_headerView addSubview:btnName];
        }
    }
    return _headerView;
}
@end
