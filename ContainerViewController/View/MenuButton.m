//
//  MenuButton.m
//  ProjectForStudying
//
//  Created by hfcb on 2017/6/22.
//  Copyright © 2017年 David. All rights reserved.
//

#import "MenuButton.h"

@implementation MenuButton

- (void)didMoveToWindow {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu"]];
    
    imageView.userInteractionEnabled = YES;
    [self addSubview:imageView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];
    [imageView addGestureRecognizer:tap];
}

- (void)didTap {
    if (self.tapBlock) {
        self.tapBlock();
    }
}

@end
