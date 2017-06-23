//
//  MenuButton.h
//  ProjectForStudying
//
//  Created by hfcb on 2017/6/22.
//  Copyright © 2017年 David. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuButton : UIView
@property (nonatomic, strong) void(^tapBlock)();
@end
