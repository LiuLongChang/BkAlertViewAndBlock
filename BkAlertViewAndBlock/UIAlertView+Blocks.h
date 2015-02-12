//
//  UIAlertView+Blocks.h
//  BkAlertViewAndBlock
//
//  Created by llc on 15/2/12.
//  Copyright (c) 2015年 llc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RIButtonItem.h"

@interface UIAlertView (Blocks)


-(id)initWithTitle:(NSString*)inTitle message:(NSString*)inMessage cancelButtonItem:(RIButtonItem*)inCancelButtonItem otherButtonItems:(RIButtonItem*)inOtherButtonItems,...NS_REQUIRES_NIL_TERMINATION;

-(NSInteger)addButtonItem:(RIButtonItem*)item;


@end
