//
//  LeftSideItem.h
//  zhihuDailyDemo
//
//  Created by hfcb on 2017/6/23.
//  Copyright © 2017年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeftSideItem : NSObject

+ (NSArray *)sharedItems;

- (instancetype)initWithTitle:(NSString *)title;

@property (nonatomic, copy) NSString *title;
@end
