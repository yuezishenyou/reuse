//
//  HHTextModel.m
//  mj_reuse
//
//  Created by meiyue on 2017/9/6.
//  Copyright © 2017年 meiyue. All rights reserved.
//

#import "HHTextModel.h"

@implementation HHTextModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        _text0 = dict[@"text0"];
        _text1 = dict[@"text1"];
        _text2 = dict[@"text2"];
        _text3 = dict[@"text3"];
        _text4 = dict[@"text4"];
        _text5 = dict[@"text5"];
        _text6 = dict[@"text6"];
        _text7 = dict[@"text7"];
        _text8 = dict[@"text8"];
        _text9 = dict[@"text9"];
        _text10 = dict[@"text10"];
        _text11 = dict[@"text11"];
        _text12 = dict[@"text12"];
        _text13 = dict[@"text13"];
        _text14 = dict[@"text14"];
        _text15 = dict[@"text15"];
    
        [self setValuesForKeysWithDictionary:dict];
    }
    return  self;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    
}


@end
