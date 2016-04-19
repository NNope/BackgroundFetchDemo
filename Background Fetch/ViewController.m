//
//  ViewController.m
//  Background Fetch
//
//  Created by 谈Xx on 16/4/19.
//  Copyright © 2016年 谈Xx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(111, 111, 111, 111);
    [btn setTitle:@"TestButton" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)fetchDataResultHandler:(void (^)(NSError *, NSArray *))resulthandler
{
    for (UIButton *test in self.view.subviews)
    {
        if ([test isKindOfClass:[UIButton class]])
        {
            [test setTitle:@"yes" forState:UIControlStateNormal];
            resulthandler(nil,@[@"1",@"2"]);
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
