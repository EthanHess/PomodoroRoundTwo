//
//  AppearanceController.m
//  ThePomodoroRoundII
//
//  Created by Ethan Hess on 5/12/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "AppearanceController.h"

@implementation AppearanceController

+ (void)setUpAppearance {
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:152/255.0f green:216/255.0f blue:83/255.0f alpha:1.0f]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           
    NSForegroundColorAttributeName: [UIColor colorWithRed:38/255.0f green:27/255.0f blue:227/255.0f alpha:1.0f]}];
    
}

@end
