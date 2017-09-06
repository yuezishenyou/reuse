//
//  KeyboardManager.m
//  mj_keyboard
//
//  Created by meiyue on 2017/9/6.
//  Copyright © 2017年 meiyue. All rights reserved.
//

#import "KeyboardManager.h"


@implementation KeyboardManager
{
    CGFloat width;
    CGFloat height;
}

+ (instancetype)manager
{
    static KeyboardManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_manager == nil) {
            _manager = [[KeyboardManager alloc]init];
        }
    });
    return _manager;
}


- (instancetype)init
{
    if (self = [super init]) {
        
        width = [[UIScreen mainScreen]bounds].size.width;
        height = [[UIScreen mainScreen]bounds].size.height;
        _distance = 100;
        
        
        //[self setup];
    }
    return self;
}

- (instancetype)initWithSupView:(UIView *)supView
                       distance:(CGFloat)distance
{
    if (self = [super init]) {
        width = [[UIScreen mainScreen]bounds].size.width;
        height = [[UIScreen mainScreen]bounds].size.height;
        _distance = distance;
        _bgView = supView;
        
        //[self setup];
    }
    return self;
}

//**************************** Util ********************************/

- (void)start
{
    [self setup];
}

- (void)stop
{
    [self remove];
}












//**************************** 键盘 ********************************/

- (void)setup
{

    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(keyboardWillChangeFrame:)
                                                name:UIKeyboardWillChangeFrameNotification
                                              object:nil];

    
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect beginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGFloat duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve curve = [userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    void(^animations)() = ^{
        [self _willShowKeyboardFromFrame:beginFrame toFrame:endFrame];
    };
    
    [UIView animateWithDuration:duration delay:0.0f options:(curve << 16 | UIViewAnimationOptionBeginFromCurrentState) animations:animations completion:nil];
    
}


- (void)_willShowKeyboardFromFrame:(CGRect)beginFrame toFrame:(CGRect)toFrame
{
    if (beginFrame.origin.y == [[UIScreen mainScreen] bounds].size.height)
    {
        [self _willShowBottomHeight:toFrame.size.height];
    }
    else if (toFrame.origin.y == [[UIScreen mainScreen] bounds].size.height)
    {
        [self _willShowBottomHeight:0];
    }
    else{
        [self _willShowBottomHeight:toFrame.size.height];
    }
}



- (void)_willShowBottomHeight:(CGFloat)bottomHeight
{
    
    NSArray *array = self.bgView.subviews;
    
    NSMutableArray *textFieldArray = [[NSMutableArray alloc]init];
    
    for (id obj in array) {
        
        if ([obj isKindOfClass:[UITextField class]])
        {
            UITextField *textField = (UITextField *)obj;
            [textFieldArray addObject:textField];
        }
    }
    
    
    for (UITextField *textField in textFieldArray) {
        
        if (textField.isFirstResponder == YES)
        {
            CGFloat h = CGRectGetMaxY(textField.frame) + _distance;
            
            CGFloat bottomStance = height - h;
            
            [self setupFrame:bottomStance bottomHeight:bottomHeight];
        }
    }

}

// bottomStance 空间的位置距离下面      bottomHeight键盘的高度
- (void)setupFrame:(CGFloat)bottomStance bottomHeight:(CGFloat)bottomHeight
{
    if (bottomStance < bottomHeight)
    {
        
        CGFloat offetY = bottomHeight - bottomStance;
        
        [self.bgView layoutIfNeeded];
        [self.bgView layoutSubviews];
        
        CGRect rect = self.bgView.frame;
        
        rect.origin.y = - offetY;
        
        self.bgView.frame = rect;
        
    }
    else
    {
        self.bgView.frame = CGRectMake(0, 0, width, height);
    }
}





- (void)dealloc
{
    [self remove];
}

- (void)remove
{
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:UIKeyboardWillChangeFrameNotification
                                                 object:nil];
}




@end
