//
//  CenterViewController.m
//  zhihuDailyDemo
//
//  Created by David on 2017/6/23.
//  Copyright © 2017年 david. All rights reserved.
//

#import "CenterViewController.h"
#import "MenuButton.h"
#import "UIViewController+ContainerViewController.h"
@interface CenterViewController ()

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    MenuButton *menuBtn = [[MenuButton alloc] initWithFrame:CGRectMake(20, 20, 44, 44)];
    [self.view addSubview:menuBtn];
    
    CenterViewController __weak *weakSelf = self;
    menuBtn.tapBlock = ^{
        [weakSelf.containerViewController toggleLeftSide];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
