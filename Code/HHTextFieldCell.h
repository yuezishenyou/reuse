//
//  HHTextFieldCell.h
//  mj_reuse
//
//  Created by meiyue on 2017/9/6.
//  Copyright © 2017年 meiyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHTextModel.h"

@class HHTextFieldCell;
@protocol HHTextFieldCellDelegate<NSObject>

@optional
- (void)textFieldCell:(HHTextFieldCell *)cell text:(NSString *)text index:(NSInteger)index;

@end


@interface HHTextFieldCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UITextField *HHTextField;


@property (nonatomic,strong) HHTextModel *model;

@property (nonatomic,assign) NSInteger index;

@property (nonatomic,weak) id<HHTextFieldCellDelegate>delegate;


@end
