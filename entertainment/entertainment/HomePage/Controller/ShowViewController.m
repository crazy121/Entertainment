//
//  ShowViewController.m
//  entertainment
//
//  Created by Metallic  on 16/2/29.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "ShowViewController.h"
#import "IntroCollectionViewCell.h"
#import "VideoViewController.h"
#import "SelectRasingViewController.h"
#import "GroupViewController.h"
#import "ProgressPlanViewController.h"
#import "BudgetViewController.h"
#import "InvestPlanViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kLabelVerticalSpacing 5 //label垂直间距
#define kLabelHorizontalSpacing 4 //label水平间距
#define kLineViewHeight 0.5 //分割线高度
#define kIntroBtnWidth 70

static NSString *identifier = @"MyCell";

@interface ShowViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;//self.view的scrollView
@property (nonatomic, strong) UIImageView *showImageView;//作品的图片
@property (nonatomic, strong) UILabel *showLabel;//作品名称
@property (nonatomic, strong) UILabel *companyLabel;//出品公司名称
@property (nonatomic, strong) UILabel *areaLabel;//制片地区
@property (nonatomic, strong) UILabel *directorLabel;//导演名称
@property (nonatomic, strong) UILabel *actorsLabel;//主要演员
@property (nonatomic, strong) UILabel *dateLabel;//发布时间
@property (nonatomic, strong) UILabel *typeLabel;//作品类型
@property (nonatomic, strong) UILabel *moneyLabel;//众筹金额
@property (nonatomic, strong) UICollectionView *videoCollectionView;//视频展示
@property (nonatomic, strong) UILabel *storyLabel;//故事梗概
@property (nonatomic, assign) CGSize contentSize;
@end

@implementation ShowViewController
#pragma mark - setters and getters
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}

- (UIImageView *)showImageView
{
    if (!_showImageView) {
        _showImageView = [[UIImageView alloc] init];
    }
    return _showImageView;
}

- (UILabel *)showLabel
{
    if (!_showLabel) {
        _showLabel = [[UILabel alloc] init];
    }
    return _showLabel;
}

- (UILabel *)companyLabel
{
    if (!_companyLabel) {
        _companyLabel = [[UILabel alloc] init];
    }
    return _companyLabel;
}

- (UILabel *)areaLabel
{
    if (!_areaLabel) {
        _areaLabel = [[UILabel alloc] init];
    }
    return _areaLabel;
}

- (UILabel *)directorLabel
{
    if (!_directorLabel) {
        _directorLabel = [[UILabel alloc] init];
    }
    return _directorLabel;
}

- (UILabel *)actorsLabel
{
    if (!_actorsLabel) {
        _actorsLabel = [[UILabel alloc] init];
    }
    return _actorsLabel;
}

- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
    }
    return _dateLabel;
}

- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] init];
    }
    return _typeLabel;
}

- (UILabel *)moneyLabel
{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc] init];
    }
    return _moneyLabel;
}

- (UICollectionView *)videoCollectionView
{
    if (!_videoCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(80, 120);
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _videoCollectionView = [[UICollectionView alloc] initWithFrame:_videoCollectionView.frame collectionViewLayout:layout];
        _videoCollectionView.dataSource = self;
        _videoCollectionView.delegate = self;
        _videoCollectionView.backgroundColor = [UIColor whiteColor];
        _videoCollectionView.showsHorizontalScrollIndicator = NO;
        [_videoCollectionView registerClass:[IntroCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    }
    return _videoCollectionView;
}

- (UILabel *)storyLabel
{
    if (!_storyLabel) {
        _storyLabel = [[UILabel alloc] init];
    }
    return _storyLabel;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    //viewcontroller设置
    self.title = @"众筹信息";
    self.view.backgroundColor = [UIColor whiteColor];
    //添加scrollView到视图中
    self.scrollView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:self.scrollView];
    //上部分视图
    [self createTopView];
    //中间部分视图
    [self createCenterView];
    //底部视图
    [self createBottomView];
    //scrollView整体大小
    self.scrollView.contentSize = self.contentSize;
}

- (void)createTopView
{
    //电影图片
    self.showImageView.frame = CGRectMake(8, 8, 120, 180);
    self.showImageView.image = [UIImage imageNamed:@"movie_1"];
    [self.scrollView addSubview:self.showImageView];
    //电影名称
    self.showLabel.text = @"变形金刚3";
    self.showLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    CGSize showLabelSize = [self.showLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.showLabel.font, NSFontAttributeName, nil]];
    self.showLabel.frame = CGRectMake(self.showImageView.frame.origin.x + self.showImageView.bounds.size.width + 8, self.showImageView.frame.origin.y, showLabelSize.width, showLabelSize.height);
    [self.scrollView addSubview:self.showLabel];
    //出品公司
    UILabel *beCompanyLabel = [[UILabel alloc] init];
    beCompanyLabel.text = @"出品公司:";
    beCompanyLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    CGSize size = [beCompanyLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    beCompanyLabel.frame = CGRectMake(self.showLabel.frame.origin.x, self.showLabel.frame.origin.y + self.showLabel.bounds.size.height + kLabelVerticalSpacing, size.width, size.height);
    [self.scrollView addSubview:beCompanyLabel];
    
    self.companyLabel.text = @"派拉蒙影业公司";
    self.companyLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    self.companyLabel.numberOfLines = 0;
    self.companyLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize companyLabelSize = [self.companyLabel sizeThatFits:CGSizeMake(kScreenWidth - beCompanyLabel.frame.origin.x - beCompanyLabel.bounds.size.width, MAXFLOAT)];
    self.companyLabel.frame = CGRectMake(beCompanyLabel.frame.origin.x + beCompanyLabel.bounds.size.width + kLabelHorizontalSpacing, beCompanyLabel.frame.origin.y, companyLabelSize.width, companyLabelSize.height);
    [self.scrollView addSubview:self.companyLabel];
    //制片地区
    UILabel *beAreaLabel = [[UILabel alloc] init];
    beAreaLabel.text = @"制片地区:";
    beAreaLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    beAreaLabel.frame = CGRectMake(beCompanyLabel.frame.origin.x, self.companyLabel.frame.origin.y + self.companyLabel.bounds.size.height + kLabelVerticalSpacing, size.width, size.height);
    [self.scrollView addSubview:beAreaLabel];
    
    self.areaLabel.text = @"美国";
    self.areaLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    self.areaLabel.numberOfLines = 0;
    self.areaLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize areaLabelSize = [self.areaLabel sizeThatFits:CGSizeMake(kScreenWidth - beAreaLabel.frame.origin.x - beAreaLabel.bounds.size.width, MAXFLOAT)];
    self.areaLabel.frame = CGRectMake(beAreaLabel.frame.origin.x + beAreaLabel.bounds.size.width + kLabelHorizontalSpacing, beAreaLabel.frame.origin.y, areaLabelSize.width, areaLabelSize.height);
    [self.scrollView addSubview:self.areaLabel];
    //导演
    UILabel *beDirectorLabel = [[UILabel alloc] init];
    beDirectorLabel.text = @"导演:";
    beDirectorLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    beDirectorLabel.textAlignment = NSTextAlignmentRight;
    beDirectorLabel.frame = CGRectMake(beAreaLabel.frame.origin.x, self.areaLabel.frame.origin.y + self.areaLabel.bounds.size.height + kLabelVerticalSpacing, size.width, size.height);
    [self.scrollView addSubview:beDirectorLabel];
    
    self.directorLabel.text = @"迈克尔⋅贝";
    self.directorLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    self.directorLabel.numberOfLines = 0;
    self.directorLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize directorLabelSize = [self.directorLabel sizeThatFits:CGSizeMake(kScreenWidth - beDirectorLabel.frame.origin.x - beDirectorLabel.bounds.size.width, MAXFLOAT)];
    self.directorLabel.frame = CGRectMake(beDirectorLabel.frame.origin.x + beDirectorLabel.bounds.size.width + kLabelHorizontalSpacing, beDirectorLabel.frame.origin.y, directorLabelSize.width, directorLabelSize.height);
    [self.scrollView addSubview:self.directorLabel];
    //主要演员
    UILabel *beActorLabel = [[UILabel alloc] init];
    beActorLabel.text = @"主要演员:";
    beActorLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    beActorLabel.frame = CGRectMake(beDirectorLabel.frame.origin.x, self.directorLabel.frame.origin.y + self.directorLabel.bounds.size.height + kLabelVerticalSpacing, size.width, size.height);
    [self.scrollView addSubview:beActorLabel];
    
    self.actorsLabel.text = @"希亚·拉博夫，罗茜·汉丁顿·惠特莉，乔什·杜哈明，约翰·特托罗，彼得·库伦";
    self.actorsLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    self.actorsLabel.numberOfLines = 0;
    self.actorsLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize actorsLabelSize = [self.actorsLabel sizeThatFits:CGSizeMake(kScreenWidth - beActorLabel.frame.origin.x - beActorLabel.bounds.size.width, MAXFLOAT)];
    self.actorsLabel.frame = CGRectMake(beActorLabel.frame.origin.x + beActorLabel.bounds.size.width + kLabelHorizontalSpacing, beActorLabel.frame.origin.y, actorsLabelSize.width - 4, actorsLabelSize.height);
    [self.scrollView addSubview:self.actorsLabel];
    //发布日期
    UILabel *beDateLabel = [[UILabel alloc] init];
    beDateLabel.text = @"发布日期:";
    beDateLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    beDateLabel.frame = CGRectMake(beActorLabel.frame.origin.x, self.actorsLabel.frame.origin.y + self.actorsLabel.bounds.size.height + kLabelVerticalSpacing, size.width, size.height);
    [self.scrollView addSubview:beDateLabel];
    
    self.dateLabel.text = @"2016年3月1日";
    self.dateLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    self.dateLabel.numberOfLines = 0;
    self.dateLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize dateLabelSize = [self.dateLabel sizeThatFits:CGSizeMake(kScreenWidth - beDateLabel.frame.origin.x - beDateLabel.bounds.size.width, MAXFLOAT)];
    self.dateLabel.frame = CGRectMake(beDateLabel.frame.origin.x + beDateLabel.bounds.size.width + kLabelHorizontalSpacing, beDateLabel.frame.origin.y, dateLabelSize.width, dateLabelSize.height);
    [self.scrollView addSubview:self.dateLabel];
    //类型
    UILabel *beTypeLabel = [[UILabel alloc] init];
    beTypeLabel.text = @"类型:";
    beTypeLabel.textAlignment = NSTextAlignmentRight;
    beTypeLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    beTypeLabel.frame = CGRectMake(beDateLabel.frame.origin.x, self.dateLabel.frame.origin.y + self.dateLabel.bounds.size.height + kLabelVerticalSpacing, size.width, size.height);
    [self.scrollView addSubview:beTypeLabel];
    
    self.typeLabel.text = @"动作，科幻，冒险";
    self.typeLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    self.typeLabel.numberOfLines = 0;
    self.typeLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize typeLabelSize = [self.typeLabel sizeThatFits:CGSizeMake(kScreenWidth - beTypeLabel.frame.origin.x - beTypeLabel.bounds.size.width, MAXFLOAT)];
    self.typeLabel.frame = CGRectMake(beTypeLabel.frame.origin.x + beTypeLabel.bounds.size.width + kLabelHorizontalSpacing, beTypeLabel.frame.origin.y, typeLabelSize.width, typeLabelSize.height);
    [self.scrollView addSubview:self.typeLabel];
    //lineView1
    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = [UIColor grayColor];
    lineView1.alpha = 0.5;
    CGFloat y1 = self.showImageView.frame.origin.y + self.showImageView.bounds.size.height;
    CGFloat y2 = self.typeLabel.frame.origin.y + self.typeLabel.bounds.size.height;
    if (y1 > y2) {
        lineView1.frame = CGRectMake(8, y1 + 21, kScreenWidth - 8, kLineViewHeight);
    } else {
        lineView1.frame = CGRectMake(8, y2 + 21, kScreenWidth - 8, kLineViewHeight);
    }
    [self.scrollView addSubview:lineView1];
    //支持
    UIButton *supportButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [supportButton setTitle:@"支持它" forState:UIControlStateNormal];
    [supportButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [supportButton setBackgroundColor:[UIColor colorWithRed:0.0 green:0.502 blue:0.251 alpha:1.0]];
    supportButton.titleLabel.font = [UIFont systemFontOfSize:15];
    supportButton.showsTouchWhenHighlighted = YES;
    supportButton.layer.borderWidth = 1;
    supportButton.layer.borderColor = [UIColor blackColor].CGColor;
    supportButton.layer.cornerRadius = 5;
    supportButton.frame = CGRectMake(8, lineView1.frame.origin.y + 8, 100, 50);
    [supportButton addTarget:self action:@selector(supportBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:supportButton];
    //是否在众筹
    UILabel *audienceLabel = [[UILabel alloc] init];
    audienceLabel.text = @"正在进行众筹哦!";
    audienceLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    audienceLabel.textColor = [UIColor colorWithRed:0.251 green:0.502 blue:0.0 alpha:1.0];
    CGSize audienceLabelSize = [audienceLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    audienceLabel.frame = CGRectMake(supportButton.frame.origin.x + supportButton.bounds.size.width + 8, supportButton.frame.origin.y + 4, audienceLabelSize.width, audienceLabelSize.height);
    [self.scrollView addSubview:audienceLabel];
    //众筹情况
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"已经筹集528万，目标是1000万"];
    UIFont *attrFont = [UIFont boldSystemFontOfSize:15];
    UIColor *attrColor1 = [UIColor colorWithRed:0.4196 green:0.7922 blue:0.9765 alpha:1.0];
    UIColor *attrColor2 = [UIColor redColor];
    [attrString addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:attrFont, NSFontAttributeName, attrColor1, NSForegroundColorAttributeName, nil] range:NSMakeRange(4, 3)];
    [attrString addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:attrFont, NSFontAttributeName, attrColor2, NSForegroundColorAttributeName, nil] range:NSMakeRange(12, 4)];
    
    self.moneyLabel.attributedText = attrString;
    self.moneyLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    self.moneyLabel.numberOfLines = 0;
    self.moneyLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize moneyLabelSize = [self.moneyLabel sizeThatFits:CGSizeMake(kScreenWidth - supportButton.frame.origin.x - supportButton.bounds.size.width - 10, MAXFLOAT)];
    self.moneyLabel.frame = CGRectMake(audienceLabel.frame.origin.x, audienceLabel.frame.origin.y + audienceLabel.bounds.size.height + 8, moneyLabelSize.width, moneyLabelSize.height);
    [self.scrollView addSubview:self.moneyLabel];
    //supportButton对齐
    supportButton.frame = CGRectMake(8, lineView1.frame.origin.y + 8, 100, self.moneyLabel.frame.origin.y + moneyLabelSize.height - audienceLabel.frame.origin.y + 4);
}

- (void)supportBtnClicked
{
    SelectRasingViewController *selectedVC = [[SelectRasingViewController alloc] init];
    [self.navigationController pushViewController:selectedVC animated:YES];
}

- (void)createCenterView
{
    //lineView2
    UIView *lineView2 = [[UIView alloc] init];
    lineView2.backgroundColor = [UIColor grayColor];
    lineView2.alpha = 0.5;
    lineView2.frame = CGRectMake(8, self.moneyLabel.frame.origin.y + self.moneyLabel.bounds.size.height + 21, kScreenWidth - 8, kLineViewHeight);
    [self.scrollView addSubview:lineView2];
    //精彩花絮
    UILabel *briefLabel = [[UILabel alloc] init];
    briefLabel.text = @"精彩花絮";
    briefLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    CGSize briefLabelSize = [briefLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    briefLabel.frame = CGRectMake(8, lineView2.frame.origin.y + lineView2.bounds.size.height + 8, briefLabelSize.width, briefLabelSize.height);
    [self.scrollView addSubview:briefLabel];
    
    self.videoCollectionView.frame = CGRectMake(8, briefLabel.frame.origin.y + briefLabel.bounds.size.height + 4, kScreenWidth - 8, 120);
    [self.scrollView addSubview:self.videoCollectionView];
}



- (void)createBottomView
{
    //lineView3
    UIView *lineView3 = [[UIView alloc] init];
    lineView3.backgroundColor = [UIColor grayColor];
    lineView3.alpha = 0.5;
    lineView3.frame = CGRectMake(8, self.videoCollectionView.frame.origin.y + self.videoCollectionView.bounds.size.height + 21, kScreenWidth - 8, kLineViewHeight);
    [self.scrollView addSubview:lineView3];
    //故事梗概
    UILabel *beStoryLabel = [[UILabel alloc] init];
    beStoryLabel.text = @"故事梗概:";
    beStoryLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    CGSize beStoryLabelSize = [beStoryLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    beStoryLabel.frame = CGRectMake(8, lineView3.frame.origin.y + lineView3.bounds.size.height + 8, beStoryLabelSize.width, beStoryLabelSize.height);
    [self.scrollView addSubview:beStoryLabel];
    
    self.storyLabel.text = @"    山姆大学毕业后和新女友卡莉住在华盛顿，他曾拯救过两次世界，所以有点适应不了正常人的生活，但他还是找了份工作，试着让自己安定下来。但卡莉并不了解山姆的苦闷，她为一个艺术品和汽车收藏家迪兰·古尔德工作，后者由帕特里克·德姆西饰演。与山姆和卡莉住在一起的还有小变形金刚“转轮”和它的同类小机器人“Brain”。与此同时，汽车人正与兰诺克斯少校一起在世界各地与人类的敌人——霸天虎作战。在一次与钻探兽的激战后，擎天柱发现一个属于一艘他们认为早已失踪的汽车人飞船的柱状物件。霸天虎仍然留在地球上，其首领威震天在上一次大战后现在很虚弱，但他仍在计划着什么。擎天柱对人类向他隐瞒实情很生气，尤其是对美国国家情报局局长夏洛特·米樱感到愤怒，原来多年前美国宇航员登陆月球就发现了坠毁的变形金刚汽车人飞船——“方舟号”（Ark）里的能量柱，但他们一直向世人和汽车人隐瞒。";
    self.storyLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    self.storyLabel.numberOfLines = 0;
    CGSize storyLabelSize = [self.storyLabel sizeThatFits:CGSizeMake(kScreenWidth - 16, MAXFLOAT)];
    self.storyLabel.frame = CGRectMake(8, beStoryLabel.frame.origin.y + beStoryLabel.bounds.size.height + 4, storyLabelSize.width, storyLabelSize.height);
    [self.scrollView addSubview:self.storyLabel];
    
    //lineView3
    UIView *lineView4 = [[UIView alloc] init];
    lineView4.backgroundColor = [UIColor grayColor];
    lineView4.alpha = 0.5;
    lineView4.frame = CGRectMake(8, self.storyLabel.frame.origin.y + self.storyLabel.bounds.size.height + 21, kScreenWidth - 8, kLineViewHeight);
    [self.scrollView addSubview:lineView4];
    //
    UILabel *concernLabel = [[UILabel alloc] init];
    concernLabel.text = @"特别关心(点击进入):";
    concernLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    CGSize concernLabelSize = [concernLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    concernLabel.frame = CGRectMake(8, lineView4.frame.origin.y + lineView4.bounds.size.height + 8, concernLabelSize.width, concernLabelSize.height);
    [self.scrollView addSubview:concernLabel];
    //四个按钮
    NSArray *introArray = @[@"主创团队", @"进度安排", @"财务预算", @"投资方案"];
    for (int i = 0; i < 4; i ++) {
        UIButton *introBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [introBtn setTitle:introArray[i] forState:UIControlStateNormal];
        [introBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [introBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [introBtn setBackgroundColor:[UIColor colorWithRed:0.0 green:0.502 blue:0.251 alpha:1.0]];
        introBtn.frame = CGRectMake(8 + (8 + kIntroBtnWidth) * i, concernLabel.frame.origin.y + concernLabel.bounds.size.height + 8, kIntroBtnWidth, 30);
        introBtn.layer.cornerRadius = 5.0;
        [self.scrollView addSubview:introBtn];
        [introBtn addTarget:self action:@selector(introBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        introBtn.tag = i + 101;
    }
    self.contentSize = CGSizeMake(kScreenWidth, concernLabel.frame.origin.y + concernLabel.bounds.size.height + 57);
}

- (void)introBtnClicked:(UIButton *)button
{
    if (button.tag == 101) {
        GroupViewController *groupVC = [[GroupViewController alloc] init];
        [self.navigationController pushViewController:groupVC animated:YES];
    } else if (button.tag == 102) {
        ProgressPlanViewController *progressVC = [[ProgressPlanViewController alloc] init];
        [self.navigationController pushViewController:progressVC animated:YES];
    } else if (button.tag == 103) {
        BudgetViewController *budgetVC = [[BudgetViewController alloc] init];
        [self.navigationController pushViewController:budgetVC animated:YES];
    } else if (button.tag == 104) {
        InvestPlanViewController *investVC = [[InvestPlanViewController alloc] init];
        [self.navigationController pushViewController:investVC animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark - UICollectionView dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IntroCollectionViewCell *cell = (IntroCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell updateUIWithImage:@"movie_1" andTitle:@"变形金刚3预告片"];
    return cell;
}

#pragma mark - UICollectionView delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    [self.navigationController pushViewController:videoVC animated:YES];
}

@end
