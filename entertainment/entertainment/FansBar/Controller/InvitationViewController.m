//
//  InvitationViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 16/2/27.
//  Copyright © 2016年 太乙奇门. All rights reserved.
//

#import "InvitationViewController.h"
#import "InvitationView.h"
#import "HeaderView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

static NSString *identifier = @"CircleCell";

@interface InvitationViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *respondTest;
- (IBAction) textFieldDoneEditing:(id)sender;
@property(nonatomic,assign)BOOL  JUDGE;

@end

@implementation InvitationViewController
{
    UITableView * messageView;
    NSMutableArray *_userList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title=@"主题帖";
    self.view.backgroundColor=[UIColor whiteColor];
    
    _JUDGE=true;
    
    [self.invitationTableView registerNib:[UINib nibWithNibName:@"InvitationView" bundle:nil] forCellReuseIdentifier:identifier];
    [self createHeaderView];
    
    
    
    
    self.navigationController.navigationBarHidden = NO;
    
    /**消息按钮对应的tableview
     */
    messageView = [[UITableView alloc]initWithFrame:CGRectMake(100, 64, kScreenWidth-100, kScreenHeight-44) style:UITableViewStyleGrouped];
    messageView.backgroundColor= [UIColor colorWithWhite:0.2 alpha:1];
    messageView.delegate=self;
    messageView.dataSource=self;
    [self.view addSubview:messageView];
    messageView.hidden=YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

//退出小键盘
- (IBAction) textFieldDoneEditing:(id)sender
   {
    [sender resignFirstResponder];
  
    }



/**
 *  设置tableview的头视图
 */
- (void)createHeaderView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 350)];
    view.backgroundColor=[UIColor colorWithWhite:0.85 alpha:1];
    
    /**
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(13, 10, 34, 34)];
    image.image = [UIImage imageNamed:@"mylogo.png"];
    [view addSubview:image];
    */
    NSBundle * bundle=[NSBundle mainBundle];
    UIView *headView = [[bundle loadNibNamed:@"HeaderView" owner:nil options:nil]lastObject];
    [view addSubview:headView];
    [self.invitationTableView setTableHeaderView:view];
    
    
}

#pragma mark - TableView DateSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if([tableView isEqual:self.invitationTableView])
    {
    return 1;
    }
    else if([tableView isEqual:messageView]){
        return 2;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([tableView isEqual:self.invitationTableView])
    {
    return 10;
    }else if([tableView isEqual:messageView]){
        if(section==0)
        {   return 1;}
        else{return 4;}
    }
    return  0 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
   if([tableView isEqual: self.invitationTableView])
   {
    InvitationView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[InvitationView alloc] init];
    }
    return cell;
   }
    else if([tableView isEqual:messageView])
    {
        long section = indexPath.section;
        long row = indexPath.row;
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell .contentView .backgroundColor  = [UIColor colorWithWhite:0.2 alpha:1];
                messageView.separatorColor = [UIColor colorWithWhite:0.3 alpha:1];
            cell.backgroundColor = [UIColor clearColor];
            cell.textLabel.textColor = [UIColor whiteColor];
            switch (section) {
                case 0:
                        cell.textLabel.text =  @"浏览历史";
                    
                    
                    break;
                case 1:
                    if(row == 0)
                    {
                        cell.textLabel.text =  @"系统消息";
                    }else if(row==1){
                        cell.textLabel.text =  @"聊天";
                    }else if(row ==2){
                        cell.textLabel.text=@"回复";
                    }else{
                         cell.textLabel.text=@"@我";
                    }
                    break;
                default:
                    break;
            }
        }
        return cell;
    }
    
    return  nil;
 
    
}

//设置分组名字
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if([tableView isEqual:messageView])
    {
        if(section==0)
        {return @"内容";}
        else if(section==1)
        {return @"提醒";}
        return  nil;
    }else
    {
        return nil;
    }
    
}


#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([tableView isEqual:messageView])
    {
        return  44;
    }else {
        
    return 165;
    }
}

@end
