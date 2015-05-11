//
//  Timer.m
//  ThePomodoroRoundII
//
//  Created by Ethan Hess on 5/11/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "Timer.h"

@interface Timer ()

@property (nonatomic) BOOL isOn;

@end

@implementation Timer

+ (Timer *)sharedInstance {
    static Timer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Timer new];
        
        [sharedInstance registerForNotifications];
    });
    
    return sharedInstance;
    
}

- (void)registerForNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancelTimer) name:timerStarted object:nil];
    
}

- (void)startTimer:(id)sender {
    
    if (self.isOn == YES) {
        [self decreaseSecond];
        
        [self performSelector:@selector(isActive) withObject:nil afterDelay:.001];
    }
    
}

- (void)isActive {
    
    self.isOn = YES;
    [self isActive];
    
}

- (void)cancelTimer {
    
    self.isOn = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(decreaseSecond) object:nil];
    
}

- (void)pauseTimer:(id)sender {
    
    self.isOn = NO;
    
}

- (void)endTimer {
    
    self.isOn = NO;
    
    UILocalNotification *timerRoundDoneNotification = [UILocalNotification new];
    
    timerRoundDoneNotification.fireDate = [NSDate date];
    timerRoundDoneNotification.timeZone = [NSTimeZone defaultTimeZone];
    timerRoundDoneNotification.soundName = @"";
    timerRoundDoneNotification.alertBody = @" Time's up! ";
    timerRoundDoneNotification.applicationIconBadgeNumber = -1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:timerRoundDoneNotification];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:timerEnded object:nil];
    
}

- (void)decreaseSecond {
    
    if (self.seconds > 0) {
        self.seconds --;
        [[NSNotificationCenter defaultCenter]postNotificationName:secondTickNotification object:nil];
    }
    
    if (self.seconds == 0 && self.minutes > 0) {
        self.minutes --;
        self.seconds = 60;
    }
    else if (self.seconds == 0 && self.minutes == 0) {
        [self endTimer];
    }
}




@end



