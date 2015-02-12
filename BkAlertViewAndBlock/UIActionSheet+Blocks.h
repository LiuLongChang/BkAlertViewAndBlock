//
//  UIActionSheet+Blocks.h
//  BkAlertViewAndBlock
//
//  Created by llc on 15/2/12.
//  Copyright (c) 2015年 llc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RIButtonItem.h"

@interface UIActionSheet (Blocks)<UIActionSheetDelegate>


-(id)initWithTitle:(NSString*)inTitle cancelButtonItem:(RIButtonItem*)inCancelButtonItem destructiveButtonItem:(RIButtonItem*)inDestructiveItem otherButtonItems:(RIButtonItem*)inOtherButtonItems,...NS_REQUIRES_NIL_TERMINATION;

-(NSInteger)addButtonItem:(RIButtonItem*)item;


@property(copy,nonatomic) void(^dismissalAction)();


@end
