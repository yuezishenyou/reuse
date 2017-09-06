//
//  HHRegistController.m
//  mj_reuse
//
//  Created by meiyue on 2017/9/6.
//  Copyright © 2017年 meiyue. All rights reserved.
//

#import "HHRegistController.h"
#import "HHTextFieldCell.h"
#import "UIViewController+DismissKeyboard.h"
#import "HHTextModel.h"


@interface HHRegistController ()<UITableViewDelegate,UITableViewDataSource,HHTextFieldCellDelegate>

@property (nonatomic,strong)UITableView *tbView;

@property (nonatomic,strong)NSArray *dataArray;

@property (nonatomic,strong)HHTextModel *textModel;

@end

@implementation HHRegistController
{
    CGFloat width ;
    CGFloat height;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    width = [[UIScreen mainScreen]bounds].size.width;
    height = [[UIScreen mainScreen]bounds].size.height;
    
    [self setupForDismissKeyboard];
    
    [self initData];
    
    [self initSubViews];
    
    
    
}


- (void)initData
{
    self.dataArray = @[
                       @"目录0",
                       @"目录1",
                       @"目录2",
                       @"目录3",
                       @"目录4",
                       @"目录5",
                       @"目录6",
                       @"目录7",
                       @"目录8",
                       @"目录9",
                       @"目录10",
                       @"目录11",
                       @"目录12",
                       @"目录13",
                       @"目录14",
                       @"目录15"
                       ];
    
    NSDictionary *dict = @{
                           @"text0" :@"",
                           @"text1" :@"",
                           @"text2" :@"",
                           @"text3" :@"",
                           @"text4" :@"",
                           @"text5" :@"",
                           @"text6" :@"",
                           @"text7" :@"",
                           @"text8" :@"",
                           @"text9" :@"",
                           @"text10":@"",
                           @"text11":@"",
                           @"text12":@"",
                           @"text13":@"",
                           @"text14":@"",
                           @"text15":@"",
                          
                           };
    
    self.textModel = [[HHTextModel alloc]initWithDict:dict];
    
    }


- (void)initSubViews
{
 
    CGRect frame = CGRectMake(0, 64, width, height - 64);
    
    self.tbView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    
    self.tbView.delegate = self;
    
    self.tbView.dataSource = self;
    
    [self.view addSubview:self.tbView];
    
    //self.tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tbView registerNib:[UINib nibWithNibName:@"HHTextFieldCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    HHTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
    cell.titleLab.text = self.dataArray[indexPath.row];
    
    cell.model = self.textModel;
    
    cell.index = indexPath.row;
    
    cell.delegate = self;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


#pragma mark -------------------HHTextFieldCellDelegate-------------------------

- (void)textFieldCell:(HHTextFieldCell *)cell text:(NSString *)text index:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            self.textModel.text0 = text;
        }
            break;
        case 1:
        {
            self.textModel.text1 = text;
        }
            break;
        case 2:
        {
            self.textModel.text2 = text;
        }
            break;
        case 3:
        {
            self.textModel.text3 = text;
        }
            break;
        case 4:
        {
            self.textModel.text4 = text;
        }
            break;
        case 5:
        {
            self.textModel.text5 = text;
        }
            break;
        case 6:
        {
            self.textModel.text6 = text;
        }
            break;
        case 7:
        {
            self.textModel.text7 = text;
        }
            break;
        case 8:
        {
            self.textModel.text8 = text;
        }
            break;
        case 9:
        {
            self.textModel.text9 = text;
        }
            break;
        case 10:
        {
            self.textModel.text10 = text;
        }
            break;
        case 11:
        {
            self.textModel.text11 = text;
        }
            break;
        case 12:
        {
            self.textModel.text12 = text;
        }
            break;
        case 13:
        {
            self.textModel.text13 = text;
        }
            break;
        case 14:
        {
            self.textModel.text14 = text;
        }
            break;
        case 15:
        {
            self.textModel.text15 = text;
        }
            break;
            
        default:
            break;
    }
}





@end



















