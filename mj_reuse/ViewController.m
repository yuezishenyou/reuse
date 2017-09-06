//
//  ViewController.m
//  mj_reuse
//
//  Created by meiyue on 2017/9/6.
//  Copyright © 2017年 meiyue. All rights reserved.
//

#import "ViewController.h"
#import "HHRegistController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initSubViews];
    
    
}


- (void)initSubViews
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册"
                                                                             style:UIBarButtonItemStyleDone
                                                                            target:self
                                                                            action:@selector(rightAction)];
    
}

- (void)rightAction
{
    
    HHRegistController *vc = [[HHRegistController alloc]init];
    
    
    [self.navigationController pushViewController:vc animated:YES];
    
}



@end
