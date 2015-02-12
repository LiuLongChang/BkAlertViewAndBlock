//
//  RIButtonItem.m
//  BkAlertViewAndBlock
//
//  Created by llc on 15/2/12.
//  Copyright (c) 2015年 llc. All rights reserved.
//

#import "RIButtonItem.h"

@implementation RIButtonItem

@synthesize label;
@synthesize action;

+(id)item{
    return [self new];
}

+(id)itemWithLabel:(NSString *)inLabel{
    RIButtonItem * newItem = [self new];
    [newItem setLabel:inLabel];
    
    return newItem;
}

+(id)itemWithLabel:(NSString *)inLabel action:(void (^)(void))action{
    
    RIButtonItem * newItem = [self itemWithLabel:inLabel];
    [newItem setAction:action];
    return newItem;
    
}



@end
