//
//  WMBaoMingViewController.h
//  DriverAssistant
//
//  Created by 梅毅 on 16/10/29.
//  Copyright © 2016年 my. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FxButtonHelper.h"

@interface WMBaoMingViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)IBOutlet UITableView *tableView;
@property(nonatomic,strong)FxButtonHelper *button;
@property(nonatomic,strong)UIButton *testBtn;
@property(nonatomic,strong)NSArray *arr;
@property(nonatomic,strong)UIView *UserView;
@property(nonatomic,assign)BOOL  showLeftView;
@property(nonatomic,strong)NSArray *userColum;



@end
