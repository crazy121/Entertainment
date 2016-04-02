//
//  TYFansBarViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 16/2/25.
//  Copyright © 2016年 太乙奇门. All rights reserved.
//

#import "TYFansBarViewController.h"
#import "FansBarTableViewCell.h"
#import "InvitationViewController.h"
#import "JHCustomMenu.h"
#import "IssueSubjectViewController.h"

#define TopToView 10.0f
#define RightToView 10.0f
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height


static NSString *identifier = @"FansBarCell";


@interface TYFansBarViewController ()<UITableViewDataSource, UITableViewDelegate,JHCustomMenuDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) JHCustomMenu *menu;
@property(nonatomic,assign)BOOL  JUDGE;

@end

@implementation TYFansBarViewController
{
    UISearchBar * search;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"粉吧";
    self.view.backgroundColor = [UIColor whiteColor];
    _JUDGE =true;

    
    
    //设置左按钮
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"分类" style:UIBarButtonItemStylePlain target:self action:@selector(clickClassify:)];
    self.navigationItem.leftBarButtonItem = leftItem;

     //设置右按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStylePlain target:self action:@selector(clickIssue)];
    self.navigationItem.rightBarButtonItem = rightItem;
    

    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FansBarTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
    
    //搜索小控件
    search=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,44)];
    search.barTintColor=[UIColor colorWithWhite:0.2 alpha:1];
    [self.view addSubview:search];
    search.hidden=YES;
  
    
    
}


#pragma mark - TableView DateSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FansBarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[FansBarTableViewCell alloc] init];
    }
    return cell;
}

#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}


//页面跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    InvitationViewController *invitationVC=[[InvitationViewController alloc]init];
    [self.navigationController pushViewController:invitationVC animated:YES];
}

//点击左边按钮


- (void)clickClassify:(UIBarButtonItem *)barButtonItem
{
    
    __weak __typeof(self) weakSelf = self;
    if (!self.menu) {
        self.menu = [[JHCustomMenu alloc] initWithDataArr:@[@"搜索",@"歌星", @"影星", @"艺星", @"体星", @"网红"] origin:CGPointMake(0, 0) width:125 rowHeight:44];
        _menu.delegate = self;
        _menu.dismiss = ^() {
            weakSelf.menu = nil;
        };
        _menu.arrImgName = @[@"item_school.png",@"item_school.png", @"item_battle.png", @"item_list.png", @"item_chat.png", @"item_share.png"];
        [self.view addSubview:_menu];
    } else {
        [_menu dismissWithCompletion:^(JHCustomMenu *object) {
            weakSelf.menu = nil;
        }];
    }
}

/**
 点击选中左按钮的tableview的cell
 */
- (void)jhCustomMenu:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select: %ld", indexPath.row);
}



/**
 点击右按钮进入发布界面
 */
-(void)clickIssue
{

    IssueSubjectViewController *issueVC=[[IssueSubjectViewController alloc]init];
    [self.navigationController pushViewController:issueVC animated:YES];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
