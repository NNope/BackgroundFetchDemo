//
//  ViewController.h
//  Background Fetch
//
//  Created by 谈Xx on 16/4/19.
//  Copyright © 2016年 谈Xx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


- (void)fetchDataResultHandler:(void(^)(NSError *error, NSArray *results))resulthandler;

@end

