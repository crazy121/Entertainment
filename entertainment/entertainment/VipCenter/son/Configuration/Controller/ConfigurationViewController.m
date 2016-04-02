//
//  ConfigurationViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 15/12/9.
//  Copyright © 2015年 太乙奇门. All rights reserved.
//

#import "ConfigurationViewController.h"
#import "ProfileViewController.h"
#import "ProfileViewController.h"
#import "PrivacyViewController.h"
#import "AssistViewController.h"

@interface ConfigurationViewController ()  <UITableViewDataSource, UITableViewDelegate,UIAlertViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *ConfigurationView;
@property (weak, nonatomic) IBOutlet UIButton *exitButton;
-(IBAction)exit;

@end

@implementation ConfigurationViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.title = @"设置";
    self.ConfigurationView.dataSource=self;
    //背景图片
   /* self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"loginview.png"]];
    */
    self.view.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
    self.view.frame = self.view.bounds;
            self.ConfigurationView.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
}


//tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
        return 3;
    else
        return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell=[[UITableViewCell alloc]init];
 
    if (indexPath.section==0)
    {
        if (indexPath.row==0) {
         cell.textLabel.text=@"个人资料";
        }else if (indexPath.row==1)
        {
             cell.textLabel.text= @"消息通知";
        }else
        {
                  cell.textLabel.text=@"权限与隐私";}
    }else
        {
            if(indexPath.row==0)
            {
                  cell.textLabel.text=@"邀请好友";
            }else
            {
                  cell.textLabel.text=@"辅助功能";
            }
        }

  //  设置附属物类型
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

//设置cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0) {
        
        if (indexPath.row==0) {
            
            ProfileViewController  *ProfileView = [[ProfileViewController alloc]init];
            [self.navigationController pushViewController:ProfileView animated:YES];
        
            
        }
        else if (indexPath.row==1) {
            
            //修改公司
        
            
        }
        else    {
            //权限与隐私
            
            PrivacyViewController  *PrivacyView = [[PrivacyViewController alloc]init];
            [self.navigationController pushViewController:PrivacyView animated:YES];            
        }


    }
    else  {
        
        
        if (indexPath.row==0) {
            //邀请好友
            
       
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"邀请好友" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"通过短信邀请" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                //
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"通过微信邀请" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                //
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"通过QQ邀请" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                //
            }]];

            
            [self presentViewController:alert animated:YES completion:NULL];

   
        }
        else   {
            
            //辅助功能
            
            
            AssistViewController  *AssistView = [[AssistViewController alloc]init];
            [self.navigationController pushViewController:AssistView animated:YES];
            
                       
        }
        
    }
}

//点击退出登录按钮
-(IBAction)exit
{
    
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
