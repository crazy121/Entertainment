//
//  CrowdFundModel.h
//  entertainment
//
//  Created by Metallic  on 16/3/6.
//  Copyright © 2016年 tyqm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrowdFundModel : NSObject
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) BOOL isOverRaised;
@property (nonatomic, assign) float expectedFund;
@property (nonatomic, assign) float raisedFund;
@property (nonatomic, strong) NSArray *investorsArray;
@end
