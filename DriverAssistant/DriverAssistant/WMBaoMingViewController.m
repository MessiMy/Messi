//
//  WMBaoMingViewController.m
//  DriverAssistant
//
//  Created by 梅毅 on 16/10/29.
//  Copyright © 2016年 my. All rights reserved.
//

#import "WMBaoMingViewController.h"
#import "JiaXiaoCell.h"
#import "ClassCell.h"

@interface WMBaoMingViewController ()

@end

@implementation WMBaoMingViewController

-(void)viewWillAppear:(BOOL)animated
{
    _button = [[FxButtonHelper alloc] init];
    _showLeftView = true;
    UITapGestureRecognizer *gs = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideLeftView)];
    gs.numberOfTapsRequired = 1;
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(ShowLeftView)];
    swip.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swip];
    [self.view addGestureRecognizer:gs];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _arr = @[@"服务保障",@"常见问题",@"报考新规",@"学车流程",@"讨论一下"];
    _userColum = @[@"我的题库",@"我的驾校",@"同步数据",@"下载科二、科三视频",@"题库更新",@"我的订单",@"赚取金币",@"设置"];
    self.navigationItem.title = @"报名";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"用户" style:UIBarButtonItemStylePlain target:self action:@selector(ShowLeftView)];
    self.navigationItem.leftBarButtonItem = item;
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [rightBtn addTarget:self action:@selector(Cliced:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self initHeaderView];
    [self initFooterView];
    [self initBackView];
}
#pragma mark 初始化用户视图
-(void)initBackView
{
    _UserView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 618, 1024)];
    _UserView.backgroundColor = [UIColor orangeColor];
    _UserView.alpha = 0;
    UISwipeGestureRecognizer *gs = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(ShowLeftView)];
    gs.direction = UISwipeGestureRecognizerDirectionLeft;
    [_UserView addGestureRecognizer:gs];
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 618, 200)];
    loginBtn.backgroundColor = [UIColor whiteColor];
    [loginBtn addTarget:self action:@selector(LoginClicked) forControlEvents:UIControlEventTouchUpInside];
    [_UserView addSubview:loginBtn];
    
    UIImageView *iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, (loginBtn.frame.size.height-80)/2, 80, 80)];
    iconImage.backgroundColor = [UIColor greenColor];
    [loginBtn addSubview:iconImage];
    UILabel *logLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImage.frame.origin.x+85, iconImage.frame.origin.y, 100, 30)];
    logLab.text = @"立即登陆";
    logLab.textColor = [UIColor blueColor];
    logLab.font = [UIFont systemFontOfSize:15];
    [loginBtn addSubview:logLab];
    for (int i = 0; i <= 7; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i != 7) {
            btn.frame = CGRectMake(0, 200+(824-400)/7*i, 618, (824-400)/7);
        }
        else
        {
            btn.frame = CGRectMake(0, _UserView.frame.size.height-70-(824-400)/7, 618, (824-400)/7);
        }
        btn.tag = i+100;
        [btn addTarget:self action:@selector(Setting) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor redColor];
        [_UserView addSubview:btn];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(50, (btn.frame.size.height-30)/2, 160, 30)];
        lab.textColor = [UIColor whiteColor];
        lab.text = [_userColum objectAtIndex:i];
        [btn addSubview:lab];
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, lab.frame.origin.y, 30, 30)];
        image.backgroundColor = [UIColor whiteColor];
        [btn addSubview:image];
    }
    [self.view addSubview:_UserView];
    [self.view sendSubviewToBack:_UserView];
}
-(void)LoginClicked
{
    
}
-(void)Setting
{
    NSLog(@"hello, world!");
}
-(void)hideLeftView
{
    _showLeftView = true;
    [UIView animateWithDuration:1 animations:^{
        CGRect frame = self.tableView.frame;
        frame.origin.x = 0;
        self.tableView.frame = frame;
        self.UserView.alpha = self.tableView.frame.origin.x/618;
    }];
}
#pragma mark 显示左边用户视图
-(void)ShowLeftView
{
    if (_showLeftView)
    {
        _showLeftView = false;
        [UIView animateWithDuration:1 animations:^{
            CGRect frame = self.tableView.frame;
            frame.origin.x = 618;
            self.tableView.frame = frame;
            self.UserView.alpha = self.tableView.frame.origin.x/618;
        }];
    }
    else
    {
        _showLeftView = true;
        [UIView animateWithDuration:1 animations:^{
            CGRect frame = self.tableView.frame;
            frame.origin.x = 0;
            self.tableView.frame = frame;
            self.UserView.alpha = self.tableView.frame.origin.x/618;
        }];
    }
    
}
#pragma mark 初始化TableView的头视图
-(void)initHeaderView
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    headView.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, headView.frame.size.width, 120)];
    imageView.backgroundColor = [UIColor redColor];
    [headView addSubview:imageView];
    for (int i = 0; i < 5; i++) {
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(imageView.frame.size.width/5*i, 120, imageView.frame.size.width/5, 90)];
        btn.tag = i+10;
        btn.titleLabel.textColor = [UIColor darkGrayColor];
        [btn addTarget:self action:@selector(Cliced:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake((btn.frame.size.width - 80)/2, btn.frame.size.height - 35, 80, 20)];
        lab.text = [_arr objectAtIndex:i];
        UIImageView *btnImg = [[UIImageView alloc] initWithFrame:CGRectMake((btn.frame.size.width - 35)/2, 5, 35, 35)];
        btnImg.backgroundColor = [UIColor greenColor];
        [btn addSubview:btnImg];
        [btn addSubview:lab];
        [headView addSubview:btn];
    }
    _tableView.tableHeaderView = headView;
}
#pragma mark 初始化TableView的底部视图
-(void)initFooterView
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-160, 768, 180)];
    footerView.backgroundColor = [UIColor lightGrayColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, footerView.frame.size.width, 80);
    [btn setTitle:@"查看更多驾校消息" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(Cliced:) forControlEvents:UIControlEventTouchUpInside];
    btn.highlighted = YES;
    [footerView addSubview:btn];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake((footerView.frame.size.width-150)/2, 130, 150, 25)];
    lab.text = @"是个考驾照 九个用宝典";
    lab.font = [UIFont systemFontOfSize:13];
    lab.textColor = [UIColor grayColor];
    [footerView addSubview:lab];
    _tableView.tableFooterView = footerView;
}
-(void)Cliced:(UIButton *)sender
{
    NSLog(@"button cliced!");
}

-(void)BtnClicked:(UIButton *)sender
{
    [_button setButton:sender normalColor:[UIColor blackColor] selectedColor:[UIColor redColor]];
}
#pragma mark TableViewDelegate/TableViewDatasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 4;
    }

    else if (section == 3 || section == 4)
    {
        return 3;
    }
    
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    else
    {
        while ([cell.contentView.subviews lastObject] != nil) {
            [[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            UILabel *start = [[UILabel alloc] initWithFrame:CGRectMake(5, (cell.frame.size.height - 20)/2, 60, 20)];
            start.text = @"出发地:";
            start.font = [UIFont systemFontOfSize:13];
            [cell.contentView addSubview:start];
            UILabel *intro = [[UILabel alloc] initWithFrame:CGRectMake(65, start.frame.origin.y, 150, 20)];
            intro.text = @"请点击选择您的具体位置";
            intro.font = [UIFont systemFontOfSize:13];
            intro.textColor = [UIColor grayColor];
            [cell.contentView addSubview:intro];
            
            return cell;
        }
    }
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            _testBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            _testBtn.frame = CGRectMake(100, 0, 80, 40);
            [_testBtn setTitle:@"教练" forState:UIControlStateNormal];
            [_testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            _testBtn.titleLabel.font = [UIFont systemFontOfSize:16];
            [_testBtn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(400, 0, 80, 40)];
            [btn setTitle:@"驾校" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:16];
            [btn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:_testBtn];
            [cell.contentView addSubview:btn];
            
            return cell;
        }
        else if(indexPath.row == 1)
        {
            JiaXiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JiaXiaoCell"];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"JiaXiaoCell" owner:self options:nil] lastObject] ;
            }
            else
            {
                while ([cell.contentView.subviews lastObject] != nil) {
                    [[cell.contentView.subviews lastObject] removeFromSuperview];
                }
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
        
    }
    if ((indexPath.row == 0)&&(indexPath.section != 0)&&(indexPath.section != 1))
    {
        JiaXiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JiaXiaoCell"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"JiaXiaoCell" owner:self options:nil] lastObject] ;
        }
        else
        {
            while ([cell.contentView.subviews lastObject] != nil) {
                [[cell.contentView.subviews lastObject] removeFromSuperview];
            }
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    if ((indexPath.section != 0)&&(indexPath.row != 0)) {
        ClassCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClassCell"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ClassCell" owner:self options:nil]lastObject];
        }
        else
        {
            while ([cell.contentView.subviews lastObject] != nil) {
                [[cell.contentView.subviews lastObject] removeFromSuperview];
            }
        }
        return cell;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            return 44;
        }
        else
        {
            return 100;
        }
    }
    else if(indexPath.section == 0)
    {
        return 44;
    }
    else
    {
        return 100;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
