//
//  KeyboardManager.h
//  mj_keyboard
//
//  Created by meiyue on 2017/9/6.
//  Copyright © 2017年 meiyue. All rights reserved.
//


//*********************** 监听键盘 防止遮挡 不支持xib ****************************/


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface KeyboardManager : NSObject

//父视图  必填
@property (nonatomic,strong)UIView *bgView;

//距离键盘的高度默认100
@property (nonatomic,assign)CGFloat distance;

@property (nonatomic,weak)NSLayoutConstraint *constraint;


+ (instancetype)manager;

- (void)start;

- (void)stop;

@end
