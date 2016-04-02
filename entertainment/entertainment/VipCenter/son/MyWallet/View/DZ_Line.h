//
//  DZ_Line.h
//  Flying
//
//  Created by 杨梦瑶 on 16/1/5.
//  Copyright © 2016年 太乙奇门. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZ_Line : UIView

//线宽.
@property(nonatomic)CGFloat lineWith;
//基准圆环颜色
@property(nonatomic, strong)UIColor *unfillColor;
//中心数据显示标签
@property (nonatomic, strong)UILabel *centerLable;

//  四个区域的颜色
@property (nonatomic, strong)UIColor *firstColor;
@property (nonatomic, strong)UIColor *secondColor;
@property (nonatomic, strong)UIColor *thirdColor;
@property (nonatomic, strong)UIColor *fourthColor;
//  四个区域所占的百分比
@property (nonatomic, assign)float firstScale;
@property (nonatomic, assign)float secondScale;
@property (nonatomic, assign)float thirdScale;
@property (nonatomic, assign)float fourthScale;
//动画时长
@property (nonatomic, assign)float animation_time;
- (instancetype) initWithFrame:(CGRect)frame;


@end
