//
//  AboutUsViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 15/12/11.
//  Copyright © 2015年 太乙奇门. All rights reserved.
//

#import "AboutUsViewController.h"


@interface AboutUsViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *AboutUsView;

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"关于我们";
    self.AboutUsView.dataSource=self;
    //背景图片
    self.view.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
    self.view.frame = self.view.bounds;
            self.AboutUsView.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
}



//tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell=[[UITableViewCell alloc]init];
    if (indexPath.section==0)
    {
        if (indexPath.row==0) {
            cell.textLabel.text=@"版本更新";
        }else if (indexPath.row==1)
        {
            cell.textLabel.text= @"功能介绍";
        }else if(indexPath.row==2)
        {
            cell.textLabel.text=@"问题与帮助";
        }else
        {
            cell.textLabel.text=@"意见反馈";
        }
    }
    //  设置附属物类型
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}



- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
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
