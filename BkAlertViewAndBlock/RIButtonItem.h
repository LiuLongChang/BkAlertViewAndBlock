//
//  RIButtonItem.h
//  BkAlertViewAndBlock
//
//  Created by llc on 15/2/12.
//  Copyright (c) 2015年 llc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RIButtonItem : NSObject
{
    NSString * label;
    void (^action)();
    
}


@property(retain,nonatomic)NSString * label;
@property(copy,nonatomic)void(^action)();


+(id)item;
+(id)itemWithLabel:(NSString*)inLabel;
+(id)itemWithLabel:(NSString *)inLabel action:(void(^)(void))action;


@end
