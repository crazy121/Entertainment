//
//  IssueSubjectViewController.m
//  Flying
//
//  Created by 杨梦瑶 on 16/3/2.
//  Copyright © 2016年 太乙奇门. All rights reserved.
//

#import "IssueSubjectViewController.h"
#import "TYFansBarViewController.h"

@interface IssueSubjectViewController ()<UITextFieldDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *subjectTitle;
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (weak, nonatomic) IBOutlet UIView *btnView;
@end

@implementation IssueSubjectViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发表主题";
    self.subjectTitle.delegate =self;
    //设置右按钮
 
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"发布"  style:UIBarButtonItemStylePlain target:self action:@selector(clickIssue)];
    
    self.navigationItem.rightBarButtonItem= rightBtn;
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


/**
 实现view的上移
 */

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect  frame = self.btnView.frame;
        frame.origin.y=self.btnView.frame.origin.y-256;
        self.btnView.frame = frame;
        
    }];
    return YES;
     
}
 



/**
 点击发布按钮
 */
-(void)clickIssue
{
    [self.view endEditing:YES];
    
//    TYFansBarViewController *fansVC=[[TYFansBarViewController alloc]init];
//    [self.navigationController pushViewController:fansVC animated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];

}

@end
