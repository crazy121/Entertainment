//
//  VideoViewController.m
//  entertainment
//
//  Created by Metallic  on 16/3/4.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "VideoViewController.h"
#import "ProjectVideoView.h"

@interface VideoViewController ()
@property (nonatomic, strong) ProjectVideoView *videoView;

@end

@implementation VideoViewController

- (ProjectVideoView *)videoView
{
    if (!_videoView) {
        _videoView = [[ProjectVideoView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height)];
    }
    return _videoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"视频";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.videoView];
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


@end
