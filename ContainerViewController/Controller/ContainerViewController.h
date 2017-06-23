//
//  ContainerViewController.h
//  zhihuDailyDemo
//
//  Created by David on 2017/6/23.
//  Copyright © 2017年 david. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainerViewController : UIViewController
- (instancetype)initWithLeftSideVc:(UIViewController *)leftSideVc centerVc:(UIViewController *)centerVc;

- (void)toggleLeftSide;
@end
