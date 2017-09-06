//
//  HHTextFieldCell.m
//  mj_reuse
//
//  Created by meiyue on 2017/9/6.
//  Copyright © 2017年 meiyue. All rights reserved.
//

#import "HHTextFieldCell.h"


@interface HHTextFieldCell ()<UITextFieldDelegate>

@end
@implementation HHTextFieldCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setup];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setup
{
    self.HHTextField.delegate = self;
}

- (void)setIndex:(NSInteger)index
{
    _index = index;
    switch (index) {
        case 0:
        {
            self.HHTextField.text = self.model.text0;
        }
            break;
        case 1:
        {
            self.HHTextField.text = self.model.text1;
        }
            break;
        case 2:
        {
            self.HHTextField.text = self.model.text2;
        }
            break;
        case 3:
        {
            self.HHTextField.text = self.model.text3;
        }
            break;
        case 4:
        {
            self.HHTextField.text = self.model.text4;
        }
            break;
        case 5:
        {
            self.HHTextField.text = self.model.text5;
        }
            break;
        case 6:
        {
            self.HHTextField.text = self.model.text6;
        }
            break;
        case 7:
        {
            self.HHTextField.text = self.model.text7;
        }
            break;
        case 8:
        {
            self.HHTextField.text = self.model.text8;
        }
            break;
        case 9:
        {
            self.HHTextField.text = self.model.text9;
        }
            break;
        case 10:
        {
            self.HHTextField.text = self.model.text10;
        }
            break;
        case 11:
        {
            self.HHTextField.text = self.model.text11;
        }
            break;
        case 12:
        {
            self.HHTextField.text = self.model.text12;
        }
            break;
        case 13:
        {
            self.HHTextField.text = self.model.text13;
        }
            break;
        case 14:
        {
            self.HHTextField.text = self.model.text14;
        }
            break;
        case 15:
        {
            self.HHTextField.text = self.model.text15;
        }
            break;
            
        default:
            break;
    }
}



#pragma mark -----------UITextFieldDelegate--------------------

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([_delegate respondsToSelector:@selector(textFieldCell:text:index:)]) {
        [_delegate textFieldCell:self text:self.HHTextField.text index:self.index];
    }
}






@end












