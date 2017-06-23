//
//  UIViewController+ContainerViewController.h
//  zhihuDailyDemo
//
//  Created by David on 16/8/23.
//  Copyright © 2016年 David. All rights reserved.
//


#import "UIViewController+ContainerViewController.h"

@implementation UIViewController (ContainerViewController)

-(ContainerViewController*)containerViewController{
    UIViewController *parentViewController = self.parentViewController;
    while (parentViewController != nil) {
        if([parentViewController isKindOfClass:[ContainerViewController class]]){
            return (ContainerViewController *)parentViewController;
        }
        parentViewController = parentViewController.parentViewController;
    }
    return nil;
}

@end
