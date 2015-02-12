//
//  ViewController.m
//  BkAlertViewAndBlock
//
//  Created by llc on 15/2/12.
//  Copyright (c) 2015年 llc. All rights reserved.
//

#import "ViewController.h"

#import "UIAlertView+Blocks.h"
#import "RIButtonItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}




- (IBAction)tapGesAction:(UITapGestureRecognizer *)sender {
    
    
    [[[UIAlertView alloc]initWithTitle:@"提示" message:@"当前为移动网络 会产生流量（•̣̣̣̣̣̥́௰•̣̣̣̣̣̥̀）,是否观看视频" cancelButtonItem:nil otherButtonItems:[RIButtonItem itemWithLabel:@"不看了" action:^{
        
        NSLog(@"不看了");
        
        
    }],[RIButtonItem itemWithLabel:@"继续播" action:^{
        
        NSLog(@"继续播");
        
        
    }],[RIButtonItem itemWithLabel:@"我是土豪，以后都不要烦我" action:^{
        
        NSLog(@"我是土豪,以后都不要烦我");
        
    }],nil]show];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
