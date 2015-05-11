//
//  Timer.h
//  ThePomodoroRoundII
//
//  Created by Ethan Hess on 5/11/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit; 

static NSString * const currentRoundNotification = @"currentRoundNotification";
static NSString * const secondTickNotification = @"secondTickNotification";
static NSString * const selectedRound = @"selectedRoundNotification";
static NSString * const timerEnded = @"timerEnded";
static NSString * const timerStarted = @"timerStarted";
static NSString * const appStarted = @"appStarted";

@interface Timer : NSObject

@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger seconds;

+ (Timer *)sharedInstance; 

@end
