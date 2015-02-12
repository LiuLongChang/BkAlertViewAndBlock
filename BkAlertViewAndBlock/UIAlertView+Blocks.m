//
//  UIAlertView+Blocks.m
//  BkAlertViewAndBlock
//
//  Created by llc on 15/2/12.
//  Copyright (c) 2015年 llc. All rights reserved.
//

#import "UIAlertView+Blocks.h"

#import <objc/runtime.h>

static NSString * RI_BUTTON_ASS_KEY = @"com.random-ideas.BUTTONS";


@implementation UIAlertView (Blocks)


-(id)initWithTitle:(NSString *)inTitle message:(NSString *)inMessage cancelButtonItem:(RIButtonItem *)inCancelButtonItem otherButtonItems:(RIButtonItem *)inOtherButtonItems, ...{
    
    if ((self = [self initWithTitle:inTitle message:inMessage delegate:self cancelButtonTitle:inCancelButtonItem.label otherButtonTitles:nil])) {
        
        NSMutableArray * buttonsArray = [self buttonItems];
        RIButtonItem * eachItem;
        va_list argumentList;
        if (inOtherButtonItems) {
            [buttonsArray addObject:inOtherButtonItems];
            va_start(argumentList, inOtherButtonItems);
            while ((eachItem = va_arg(argumentList, RIButtonItem*))) {
                [buttonsArray addObject:eachItem];
            }
            va_end(argumentList);
        }
        
        
        
        for (RIButtonItem * item in buttonsArray) {
            [self addButtonWithTitle:item.label];
        }
        
        if (inCancelButtonItem) {
            [buttonsArray insertObject:inCancelButtonItem atIndex:0];
        }
        
        [self setDelegate:self];
        
    }
    
    return self;
}


-(NSInteger)addButtonItem:(RIButtonItem *)item{
    
    NSInteger buttonIndex = [self addButtonWithTitle:item.label];
    [[self buttonItems] addObject:item];
    
    if (![self delegate]) {
        [self setDelegate:self];
    }
    
    return buttonIndex;
}



-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex >= 0) {
        
        NSArray * buttonArray = objc_getAssociatedObject(self, (__bridge const void *)RI_BUTTON_ASS_KEY);
        RIButtonItem * item = [buttonArray objectAtIndex:buttonIndex];
        if (item.action) {
            item.action();
        }
        
    }
    
    objc_setAssociatedObject(self, (__bridge const void *)RI_BUTTON_ASS_KEY,nil,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(NSMutableArray*)buttonItems{
    
    NSMutableArray * buttonItems = objc_getAssociatedObject(self, (__bridge const void *)RI_BUTTON_ASS_KEY);
    if (!buttonItems) {
        buttonItems = [NSMutableArray array];
    }
    
    return buttonItems;
}

@end
