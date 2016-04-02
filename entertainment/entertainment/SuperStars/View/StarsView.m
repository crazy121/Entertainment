//
//  StarsView.m
//  entertainment
//
//  Created by Metallic  on 16/3/8.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import "StarsView.h"

@implementation StarsView
+ (StarsView *)makeStarsView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"StarsView" owner:self options:nil] lastObject];
}
@end
