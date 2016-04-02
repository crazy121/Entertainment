//
//  ProfileViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 15/12/11.
//  Copyright © 2015年 太乙奇门. All rights reserved.
//






#import "ProfileViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "TYVipCenterViewController.h"

@interface ProfileViewController ()<UITableViewDataSource, UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIAlertViewDelegate,UITabBarControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *ProfileView;
@property (nonatomic, strong) NSArray *funcArray;
@property (weak, nonatomic)  UIImage *image;






-(void)alertNickName;








@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"个人信息";
    //self.ProfileView.dataSource=self;
    //背景图片
    self.view.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
    self.view.frame = self.view.bounds;
            self.ProfileView.backgroundColor =[UIColor colorWithRed:253.0/255.0 green:240.0/255.0 blue:230.0/255.0 alpha:1];
    
}





#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return  2;
    }
      else  if (section==1) {
            return 5;
    }
      else  if (section==2) {
          return 5;
      }
     else if(section==3)

     {  return 1;  }
    return 0;
}




 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:nil];
    if (indexPath.section==0)
    {
        if (indexPath.row==0) {
            cell.textLabel.text=@"头像";
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            
            UIButton *  btn = [[UIButton alloc] initWithFrame:CGRectMake(250,39,36,36)];
            [btn setBackgroundImage:[UIImage imageNamed:@"mylogo"] forState:UIControlStateNormal];
            [self.ProfileView addSubview:btn];
            UIButton *  btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0,38,320,36)];
               [self.ProfileView addSubview:btn2];
            [btn2 addTarget:self action:@selector(alter) forControlEvents:UIControlEventTouchUpInside];
            
        }
       else   {
            cell.textLabel.text=@"奇门号";
            cell.detailTextLabel.text=@"88888888";
             cell.accessoryType=UITableViewCellAccessoryNone;
        }
    }
    else  if (indexPath.section==1) {
        
        if (indexPath.row==0) {
            cell.textLabel.text=@"昵称";
            cell.detailTextLabel.text=@"奔跑的蜗牛";
                 cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
           else if (indexPath.row==1) {
            cell.textLabel.text=@"公司";
            cell.detailTextLabel.text=@"太乙奇门";
                    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
            else    if (indexPath.row==2) {
            cell.textLabel.text=@"性别";
            cell.detailTextLabel.text=@"女";
                     cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
             else    if (indexPath.row==3) {
            cell.textLabel.text=@"所在地";
            cell.detailTextLabel.text=@"北京 朝阳区";
                      cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
         else  {
            cell.textLabel.text=@"注册时间";
            cell.detailTextLabel.text=@"2015-12-13";
             cell.accessoryType=UITableViewCellAccessoryNone;
        }
    }
        else  if(indexPath.section==2){
                 cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

        if (indexPath.row==0) {
            cell.textLabel.text=@"姓名";
            cell.detailTextLabel.text=@"张三";
        }
         else   if (indexPath.row==1) {
            cell.textLabel.text=@"联系电话";
            cell.detailTextLabel.text=@"15671557195";
        }
          else     if (indexPath.row==2) {
            cell.textLabel.text=@"年龄";
            cell.detailTextLabel.text=@"22";
        }
           else  if (indexPath.row==3) {
            cell.textLabel.text=@"QQ";
            cell.detailTextLabel.text=@"394877379";
        }else
        {
            cell.textLabel.text=@"邮箱";
            cell.detailTextLabel.text=@"394877379@qq.com";
        }
    }else
    {
             cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        if(indexPath.row==0)
        {
        cell.textLabel.text=@"身份证号";
        cell.detailTextLabel.text=@"420528199010240876";
        }
    }
    
   
        return cell;

}

 
 
 
-(void)alter
{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"设置头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
       
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
       UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        controller.allowsEditing=YES;
        
        [self presentViewController:controller animated:YES completion:NULL];
        
        
     

        
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
    
}





//设置cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

      if (indexPath.section==1) {
        
        if (indexPath.row==0) {
            
            //修改昵称
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改昵称" message:nil preferredStyle:    UIAlertControllerStyleAlert];
            
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertNickName) name:UITextFieldTextDidChangeNotification object:textField];
                textField.placeholder = @"昵称";
            }];

             UITableViewCell *cell = [_ProfileView cellForRowAtIndexPath:indexPath];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                UITextField *login = alertController.textFields.firstObject;
                cell.detailTextLabel.text=login.text;
            }];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:cancelAction];
            [alertController addAction:okAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            

        }
        else if (indexPath.row==1) {
 
            //修改公司
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改公司" message:nil preferredStyle:    UIAlertControllerStyleAlert];
            
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertNickName) name:UITextFieldTextDidChangeNotification object:textField];
                textField.keyboardType=UIKeyboardTypeDefault;
                textField.placeholder = @"公司";
            }];
            
             UITableViewCell *cell = [_ProfileView cellForRowAtIndexPath:indexPath];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                UITextField *login = alertController.textFields.firstObject;
                NSLog(@"%@",login.text);
                  cell.detailTextLabel.text=login.text;
            }];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:cancelAction];
            [alertController addAction:okAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
        
        }
        else    if (indexPath.row==2) {
   
        }
        else    if (indexPath.row==3) {

        }
        else  {
 
        }
    }
    else  if(indexPath.section==2){
      
        
        if (indexPath.row==0) {
 
        }
        else   if (indexPath.row==1) {
            
            //修改联系电话
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改联系电话" message:nil preferredStyle:    UIAlertControllerStyleAlert];
            
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertNickName) name:UITextFieldTextDidChangeNotification object:textField];
                textField.keyboardType=UIKeyboardTypeDefault;
                textField.placeholder = @"联系电话";
                textField.keyboardType=UIKeyboardTypeNumberPad;
            }];
            
             UITableViewCell *cell = [_ProfileView cellForRowAtIndexPath:indexPath];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                UITextField *login = alertController.textFields.firstObject;
                  cell.detailTextLabel.text=login.text;
                
            }];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:cancelAction];
            [alertController addAction:okAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            
      
        }
        else     if (indexPath.row==2) {

            //修改年龄
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改年龄" message:nil preferredStyle:    UIAlertControllerStyleAlert];
            
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertNickName) name:UITextFieldTextDidChangeNotification object:textField];
                textField.keyboardType=UIKeyboardTypeDefault;
                textField.placeholder = @"年龄";
                textField.keyboardType=UIKeyboardTypeNumberPad;
            }];
            
             UITableViewCell *cell = [_ProfileView cellForRowAtIndexPath:indexPath];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                UITextField *login = alertController.textFields.firstObject;
                  cell.detailTextLabel.text=login.text;
            }];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:cancelAction];
            [alertController addAction:okAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            
            
        }
        else  if (indexPath.row==3) {

            //修改QQ
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改QQ" message:nil preferredStyle:    UIAlertControllerStyleAlert];
            
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertNickName) name:UITextFieldTextDidChangeNotification object:textField];
                textField.keyboardType=UIKeyboardTypeDefault;
                textField.placeholder = @"QQ";
                textField.keyboardType=UIKeyboardTypeNumberPad;
            }];
            
             UITableViewCell *cell = [_ProfileView cellForRowAtIndexPath:indexPath];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                UITextField *login = alertController.textFields.firstObject;
                  cell.detailTextLabel.text=login.text;
            }];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:cancelAction];
            [alertController addAction:okAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            
            
        }else
        {
 
            //修改邮箱
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改邮箱" message:nil preferredStyle:    UIAlertControllerStyleAlert];
            
            [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertNickName) name:UITextFieldTextDidChangeNotification object:textField];
                textField.keyboardType=UIKeyboardTypeDefault;
                textField.placeholder = @"邮箱";
                textField.keyboardType=UIKeyboardTypeEmailAddress;
            }];
            

            
             UITableViewCell *cell = [_ProfileView cellForRowAtIndexPath:indexPath];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                UITextField *login = alertController.textFields.firstObject;
                  cell.detailTextLabel.text=login.text;
            }];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:cancelAction];
            [alertController addAction:okAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            
            
            
        }
    }else
    {
       
        if(indexPath.row==0)
        {
   
        }
    }


}







-(void)alertNickName
{

    
}










//
-(void )viewWillAppear:(BOOL)animated
{

  self.tabBarController.hidesBottomBarWhenPushed = NO;
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
