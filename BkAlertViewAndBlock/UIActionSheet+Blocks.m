//
//  UIActionSheet+Blocks.m
//  BkAlertViewAndBlock
//
//  Created by llc on 15/2/12.
//  Copyright (c) 2015年 llc. All rights reserved.
//

#import "UIActionSheet+Blocks.h"

#import <objc/runtime.h>

static NSString * RI_BUTTON_ASS_KEY = @"com.random-ideas.BUTTONS";
static NSString * RI_DISMISSAL_ACTION_KEY = @"com.random-ideas.DISMISSAL_ACTION";


@implementation UIActionSheet (Blocks)


-(id)initWithTitle:(NSString *)inTitle cancelButtonItem:(RIButtonItem *)inCancelButtonItem destructiveButtonItem:(RIButtonItem *)inDestructiveItem otherButtonItems:(RIButtonItem *)inOtherButtonItems, ...{
    
    
    if (self = [self initWithTitle:inTitle delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil]) {
        
        
        NSMutableArray * buttonArray = [NSMutableArray array];
        RIButtonItem * eachItem;
        va_list argumentList;
        if (inOtherButtonItems) {
            
            [buttonArray addObject:inOtherButtonItems];
            va_start(argumentList, inOtherButtonItems);
            while ((eachItem = va_arg(argumentList, RIButtonItem *))) {
                [buttonArray addObject:eachItem];
            }
            va_end(argumentList);
            
        }
        
        
        
        for (RIButtonItem * item in buttonArray) {
            [self addButtonWithTitle:item.label];
        }
        
        
        if (inDestructiveItem) {
            [buttonArray addObject:inDestructiveItem];
            NSInteger destIndex = [self addButtonWithTitle:inCancelButtonItem.label];
            [self setCancelButtonIndex:destIndex];
        }
        
        
        if (inCancelButtonItem) {
            
            [buttonArray addObject:inCancelButtonItem];
            NSInteger cancelIndex = [self addButtonWithTitle:inCancelButtonItem.label];
            [self setCancelButtonIndex:cancelIndex];
            
        }
       
        objc_setAssociatedObject(self, (__bridge const void *)RI_BUTTON_ASS_KEY, buttonArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    return self;
    
}

-(NSInteger)addButtonItem:(RIButtonItem *)item{
    
    
    NSMutableArray * buttonsArray = objc_getAssociatedObject(self, (__bridge const void *)RI_BUTTON_ASS_KEY);
    
    NSInteger buttonIndex = [self addButtonWithTitle:item.label];
    
    [buttonsArray addObject:item];
    
    return buttonIndex;
    
}






-(void)setDismissalAction:(void (^)())dismissalAction{
    
    objc_setAssociatedObject(self, (__bridge const void *)RI_DISMISSAL_ACTION_KEY,nil, OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self, (__bridge const void *)RI_DISMISSAL_ACTION_KEY,dismissalAction,OBJC_ASSOCIATION_COPY);
    
}
-(void(^)())dismissalAction{
    return objc_getAssociatedObject(self, (__bridge const void *)RI_DISMISSAL_ACTION_KEY);
}







-(void)actionSheet:(UIActionSheet*)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex>=0) {
    
        NSArray * buttonsArray = objc_getAssociatedObject(self, (__bridge  const void *)RI_BUTTON_ASS_KEY);
        RIButtonItem * item = [buttonsArray objectAtIndex:buttonIndex];
    
        if (item.action) {
            item.action();
        }
        
    }
    
    if (self.dismissalAction) {
        self.dismissalAction();
    }
    
    objc_setAssociatedObject(self, (__bridge const void *)RI_BUTTON_ASS_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, (__bridge const void *)RI_DISMISSAL_ACTION_KEY, nil, OBJC_ASSOCIATION_COPY);
    
}
















@end
