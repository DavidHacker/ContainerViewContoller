//
//  LeftSideItem.m
//  zhihuDailyDemo
//
//  Created by hfcb on 2017/6/23.
//  Copyright © 2017年 david. All rights reserved.
//

#import "LeftSideItem.h"

@implementation LeftSideItem
+ (NSArray *)sharedItems {
    return @[[[LeftSideItem alloc] initWithTitle:@"首页"],
             [[LeftSideItem alloc] initWithTitle:@"日常心理学"],
             [[LeftSideItem alloc] initWithTitle:@"用户推荐日报"],
             [[LeftSideItem alloc] initWithTitle:@"电影日报"],
             [[LeftSideItem alloc] initWithTitle:@"不许无聊"],
             [[LeftSideItem alloc] initWithTitle:@"设计日报"]];
}

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}
@end
