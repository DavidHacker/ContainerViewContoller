//
//  ContainerViewController.m
//  zhihuDailyDemo
//
//  Created by David on 2017/6/23.
//  Copyright © 2017年 david. All rights reserved.
//



#import "ContainerViewController.h"
#import "UIView+Frame.h"

//#define leftSideWidth 0.7 * self.view.frame.size.width

static CGFloat animationDuration = 0.5;
static CGFloat leftSideWidth = 300;

@interface ContainerViewController ()
@property (nonatomic, strong) UIViewController *leftSideVc;
@property (nonatomic, strong) UIViewController *centerVc;


@property (nonatomic, assign) BOOL isOpening;
@end

@implementation ContainerViewController
- (instancetype)initWithLeftSideVc:(UIViewController *)leftSideVc centerVc:(UIViewController *)centerVc {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.leftSideVc = leftSideVc;
        self.centerVc = centerVc;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加子控制器
    [self addChildViewController:self.leftSideVc];
    //设置frame
    self.leftSideVc.view.frame = CGRectMake(-leftSideWidth, 0, leftSideWidth, self.view.height);
    //添加view
    [self.view addSubview:self.leftSideVc.view];
    
    [self.leftSideVc didMoveToParentViewController:self];
    
    [self addChildViewController:self.centerVc];
    
    [self.view addSubview:self.centerVc.view];
    
    [self.centerVc didMoveToParentViewController:self];
    
    //添加拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:pan];
}

- (void)toggleLeftSide {
    
        BOOL isOpen = floor(self.centerVc.view.frame.origin.x / leftSideWidth);
        CGFloat progress = isOpen == 1.0 ? 0.0 : 1.0;
        
        [UIView animateWithDuration:animationDuration animations:^{
            [self setToPercent:progress];
        }];
}

- (void)setToPercent:(CGFloat)progress {
    self.centerVc.view.x = leftSideWidth * progress;
    self.leftSideVc.view.x = leftSideWidth * progress - leftSideWidth;
}

- (void)panGesture:(UIPanGestureRecognizer *)gesture {
 
    CGFloat offsetX = [gesture translationInView:self.view].x;
    CGFloat progress = offsetX / leftSideWidth;
    progress = self.isOpening ? MAX(MIN(progress, 0.0),-1.0) : MIN(MAX(progress, 0.0),1.0);
    
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            //获取初始的位置
        {
            CGFloat isOpen = floor(self.centerVc.view.x / leftSideWidth);
            
            if (isOpen) {
                //处于展开状态
                self.isOpening = YES;
            } else {
                self.isOpening = NO;
            }
        }
            break;
        case UIGestureRecognizerStateChanged: {
            [self setToPercent:(self.isOpening ? (1 + progress) : progress)];
        }
            break;
            
        default: {
            
            CGFloat targetProgress;
            if (self.isOpening) {
                targetProgress = progress < -0.3? 0.0 : 1.0;
            } else {
                targetProgress = progress > 0.3? 1.0 : 0.0;
            }
            [UIView animateWithDuration:animationDuration animations:^{
                [self setToPercent:targetProgress];
            }];
            
        }
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
