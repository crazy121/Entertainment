//
//  ProjectVideoView.m
//  Flying
//
//  Created by Metallic  on 15/12/16.
//  Copyright © 2015年 太乙奇门. All rights reserved.
/**
 *  自定义cell的高度
 */
//NSString *infoString = [[diseaseDetailArray objectAtIndex:indexPath.row] objectForKey:@"info"];
//CGSize constraint = CGSizeMake(280, 20000);
//CGSize size = [infoString sizeWithFont:[UIFont systemFontOfSize:16]
//                     constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
//CGFloat height = MAX(size.height, CellHeight);
//return height + (5 * 2) + CellHeight;

#import "ProjectVideoView.h"
#import <MediaPlayer/MediaPlayer.h>
#import "ProjectCommentCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

static NSString *identifier = @"CommentCell";

@interface ProjectVideoView () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;//视频播放器
@property (nonatomic, strong) UIButton *playBtn;//播放按钮
@property (nonatomic, strong) UITableView *commentTV;

@end

@implementation ProjectVideoView
{
    CGFloat _cellHeight;//评论表cell的高度
    UIView *_choiceView;//评论操作视图
    UIControl *_coverView;//遮盖视图
    UIView *_inputView;
    UITextField *_answerField;//输入框
    UILabel *_commentLabel;
    UIButton *_answerBtn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self playBtn];
        [self moviePlayer];
        
        //项目名
        UILabel *projectLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.moviePlayer.view.frame.origin.x + 21 + self.moviePlayer.view.frame.size.height, kScreenWidth - 42, 21)];
        projectLabel.text = @"变形金刚3预告片";
        [self addSubview:projectLabel];
        
        //公司
        UILabel *companyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, projectLabel.frame.origin.y + projectLabel.frame.size.height + 8, 200, 21)];
        companyLabel.text = @"太乙奇门  于2015年12月20日发布";
        companyLabel.textColor = [UIColor grayColor];
        [companyLabel setFont:[UIFont systemFontOfSize:13]];
        [self addSubview:companyLabel];
        
        //收藏按钮
        UIButton *collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [collectButton setBackgroundColor:[UIColor grayColor]];
        collectButton.frame = CGRectMake(kScreenWidth - 70, projectLabel.frame.origin.y, 60, 40);
        [collectButton setTitle:@"收藏" forState:UIControlStateNormal];
        [self addSubview:collectButton];
        [collectButton addTarget:self action:@selector(collectBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        //线条
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, companyLabel.frame.origin.y + companyLabel.frame.size.height + 15, kScreenWidth - 20, 0.5)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        lineView.alpha = 0.3;
        [self addSubview:lineView];
        
        //热门评论
        _commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, lineView.frame.origin.y + lineView.frame.size.height + 4, 100, 21)];
        _commentLabel.text = @"热门评论";
        _commentLabel.textColor = [UIColor grayColor];
        [_commentLabel setFont:[UIFont systemFontOfSize:13]];
        [self addSubview:_commentLabel];
        
        //写评论
        UIButton *writeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        writeButton.frame = CGRectMake(kScreenWidth - 60, lineView.frame.origin.y + lineView.frame.size.height + 4, 40, 21);
        [writeButton setTitle:@"写评论" forState:UIControlStateNormal];
        [writeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        writeButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:writeButton];
        [writeButton addTarget:self action:@selector(writeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        //评论列表
        self.commentTV = [[UITableView alloc] initWithFrame:CGRectMake(0, _commentLabel.frame.origin.y + _commentLabel.frame.size.height + 4, kScreenWidth, kScreenHeight - (_commentLabel.frame.origin.y + _commentLabel.frame.size.height + 4)) style:UITableViewStylePlain];
        [self addSubview:self.commentTV];
        self.commentTV.dataSource = self;
        self.commentTV.delegate = self;
        self.commentTV.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
        
        //注册CommentCell
        [self.commentTV registerNib:[UINib nibWithNibName:@"ProjectCommentCell" bundle:nil] forCellReuseIdentifier:identifier];
 
        //创建遮盖视图
        _coverView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64)];
        _coverView.backgroundColor = [UIColor grayColor];
        _coverView.alpha = 0.5;
        [self addSubview:_coverView];
        [_coverView addTarget:self action:@selector(coverViewClick) forControlEvents:UIControlEventTouchUpInside];
        _coverView.hidden = YES;
        
        //初始化cell点击弹出视图
        _choiceView = [[UIView alloc] initWithFrame:CGRectMake((kScreenWidth - 300) / 2, (kScreenHeight - 200) / 2, 300, 200)];
        _choiceView.backgroundColor = [UIColor whiteColor];
        _choiceView.layer.cornerRadius = 5;
        [self addSubview:_choiceView];
        _choiceView.hidden = YES;
        
        //弹出视图的四个按钮
        NSArray *commentArray = @[@"回复评论", @"分享评论", @"复制评论", @"举报评论"];
        for (int i = 0; i < 4; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 4 + 48 * i, _choiceView.frame.size.width, 48);
            [button setTitle:commentArray[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            button.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
            button.tag = 101 + i;
            [_choiceView addSubview:button];
            [button addTarget:self action:@selector(buttonsClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        //添加键盘状态改变的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

/**
 *  键盘状态变化事件处理
 *
 *  @param notification 键盘显示通知，键盘隐藏通知
 */
- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    //键盘bounds
    CGRect keyboardBounds = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //键盘弹出时间
    CGFloat duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    //键盘显示
    if ([notification.name isEqualToString:UIKeyboardWillShowNotification]) {
        [UIView animateWithDuration:duration animations:^{
            _inputView.frame = CGRectMake(0, kScreenHeight - 104 - keyboardBounds.size.height, kScreenWidth, 40);
        }];
    }
    //键盘隐藏
    if ([notification.name isEqualToString:UIKeyboardWillHideNotification]) {
        [UIView animateWithDuration:duration animations:^{
            _inputView.frame = CGRectMake(0, kScreenHeight - 104, kScreenWidth, 40);
        }];
    }
}

/**
 *  释放内存函数
 */
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}


/**
 *  四个评论按钮点击事件
 *
 *  @param button 评论相关的按钮
 */
- (void)buttonsClick:(UIButton *)button
{
    _coverView.hidden = YES;
    _choiceView.hidden = YES;
    
    if (button.tag == 101) {
        //改变commentTV的fram
        CGRect commentRect = self.commentTV.frame;
        commentRect.origin.y = -44;
        commentRect.size.height = kScreenHeight;
        [self bringSubviewToFront:_commentTV];
        //动画
        [UIView animateWithDuration:0.5 animations:^{
            self.commentTV.frame = commentRect;
        }];
        [self createInputView];
    }
}

/**
 *  创建评论输入框视图
 */
- (void)createInputView
{
    //创建输入框
    if (_inputView == nil) {
        _inputView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 104, kScreenWidth, 40)];
        _inputView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_inputView];
        //文本输入框
        _answerField = [[UITextField alloc] init];
        _answerField.placeholder = @"跟奇门说:";
        _answerField.font = [UIFont fontWithName:@"Arial" size:13];
        _answerField.textColor = [UIColor blackColor];
        _answerField.backgroundColor = [UIColor whiteColor];
        _answerField.borderStyle = UITextBorderStyleNone;
        [_answerField setClearButtonMode:UITextFieldViewModeWhileEditing];
        _answerField.delegate = self;
        _answerField.frame = CGRectMake(8, 0, _inputView.frame.size.width - 68, 40);
        [_inputView addSubview:_answerField];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showAnswerBtn) name:UITextFieldTextDidChangeNotification object:nil];
        //回复按钮
        _answerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _answerBtn.frame = CGRectMake(_inputView.frame.size.width - 52, 5, 44, 30);
        [_answerBtn setTitle:@"回复" forState:UIControlStateNormal];
        [_answerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _answerBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:13];
        _answerBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _answerBtn.layer.borderWidth = 1;
        _answerBtn.layer.cornerRadius = 5;
        _answerBtn.layer.masksToBounds = YES;
        _answerBtn.enabled = NO;
        [_inputView addSubview:_answerBtn];
        //下划线
        UIView *answerLine = [[UIView alloc] initWithFrame:CGRectMake(8, _inputView.frame.size.height - 8, _answerField.frame.size.width, 1)];
        answerLine.backgroundColor = [UIColor lightGrayColor];
        answerLine.alpha = 0.3;
        [_inputView addSubview:answerLine];
    }
    [self bringSubviewToFront:_inputView];
    _inputView.hidden = NO;
    [_answerField becomeFirstResponder];
}

- (void)showAnswerBtn
{
    if (_answerField.text.length != 0) {
        _answerBtn.enabled = YES;
        [_answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _answerBtn.layer.borderColor = [UIColor blackColor].CGColor;
    } else {
        _answerBtn.enabled = NO;
        [_answerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _answerBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
}

//收藏按钮点击事件
- (void)collectBtnClick
{
    NSLog(@"collectBtn was clicked!");
}

//写评论按钮点击事件
- (void)writeBtnClick
{
    CGRect commentRect = self.commentTV.frame;
    commentRect.origin.y = -44;
    commentRect.size.height = kScreenHeight;
    [self bringSubviewToFront:_commentTV];
    //动画
    [UIView animateWithDuration:0.5 animations:^{
        self.commentTV.frame = commentRect;
    }];
    [self createInputView];
}

//遮盖视图点击事件
- (void)coverViewClick
{
    _coverView.hidden = YES;
    _choiceView.hidden = YES;
}

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    textField.text = nil;
    [textField resignFirstResponder];
    _inputView.hidden = YES;
    
    //评论列表还原
    CGRect commentRect = self.commentTV.frame;
    commentRect.origin.y = _commentLabel.frame.origin.y + _commentLabel.frame.size.height + 4;
    commentRect.size.height = kScreenHeight - (_commentLabel.frame.origin.y + _commentLabel.frame.size.height + 4);
    //动画
    [UIView animateWithDuration:0.5 animations:^{
        self.commentTV.frame = commentRect;
    }];
    
    return YES;
}

#pragma mark - TableView DataSource
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
    ProjectCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ProjectCommentCell alloc] init];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    _cellHeight = cell.frame.size.height;
    
    //点赞按钮
    UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    likeBtn.frame = CGRectMake(tableView.frame.size.width - 29, 27, 21, 21);
    [likeBtn setTitle:@"赞" forState:UIControlStateNormal];
    likeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [likeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [likeBtn addTarget:self action:@selector(likeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:likeBtn];
    return cell;
}

//点赞视图点击事件
- (void)likeBtnClick
{
    NSLog(@"赞！");
}

#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_moviePlayer pause];
    _coverView.hidden = NO;
    [self bringSubviewToFront:_coverView];
    
    _choiceView.hidden = NO;
    [self bringSubviewToFront:_choiceView];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - moviePlayer
/**
 *  初始化播放按钮
 *
 *  @return 播放按钮
 */
- (UIButton *)playBtn
{
    if (!_playBtn) {
        _playBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        [_playBtn setTitle:@"play" forState:UIControlStateNormal];
        [_playBtn setBackgroundColor:[UIColor redColor]];
        [self.moviePlayer.view addSubview:_playBtn];
        _playBtn.center = self.moviePlayer.view.center;
        [_playBtn addTarget:self action:@selector(playBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }

    return _playBtn;
}

//视频播放按钮点击事件
- (void)playBtnClick
{
    self.playBtn.hidden = YES;
    [self addNotification];
    [self.moviePlayer play];
}

- (NSURL *)getFileUrl
{
    NSString *urlStr=@"http://7xnujb.com2.z0.glb.qiniucdn.com/%E5%A4%8F%E8%87%B3%E6%9C%AA%E8%87%B301/001.mp4";

    NSURL *url=[NSURL URLWithString:urlStr];
    return url;
}

/**
 *  初始化播放器
 *
 *  @return 播放器
 */
- (MPMoviePlayerController *)moviePlayer
{
    if (!_moviePlayer) {
        NSURL *url = [self getFileUrl];
        _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
        _moviePlayer.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight / 3.f);
    }
    _moviePlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self addSubview:_moviePlayer.view];
    return _moviePlayer;
}

//添加通知
- (void)addNotification{
    NSNotificationCenter *notificationCenter=[NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(mediaPlayerPlaybackStateChange:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:self.moviePlayer];
    [notificationCenter addObserver:self selector:@selector(mediaPlayerPlaybackFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
    
}

- (void)mediaPlayerPlaybackStateChange:(NSNotification *)notification{
    switch (self.moviePlayer.playbackState) {
        case MPMoviePlaybackStatePlaying:
            NSLog(@"正在播放...");
            self.playBtn.hidden = YES;
            break;
        case MPMoviePlaybackStatePaused:
            NSLog(@"暂停播放.");
            self.playBtn.hidden = NO;
            break;
        case MPMoviePlaybackStateStopped:
            NSLog(@"停止播放.");
            break;
        default:
            NSLog(@"播放状态:%li",self.moviePlayer.playbackState);
            break;
    }
}

- (void)mediaPlayerPlaybackFinished:(NSNotification *)notification{
    NSLog(@"播放完成.%li",self.moviePlayer.playbackState);
}


@end
