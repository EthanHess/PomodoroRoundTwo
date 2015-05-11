//
//  TimerViewController.m
//  ThePomodoroRoundII
//
//  Created by Ethan Hess on 5/11/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        self.timer = [Timer sharedInstance];
        [self registerForNotifications];
    }
    
    return self;
    
}

- (void)registerForNotifications {
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateTimerLabel) name:secondTickNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(newRound) name:currentRoundNotification object:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timer.minutes = 25;
    [self updateTimerLabel];

    
}

- (void)updateTimerLabel {
    
    self.timerLabel.text = [NSString stringWithFormat:@"%lu:%02lu", (long)self.timer.minutes, (long)self.timer.seconds];
    
}

- (IBAction)startTimer:(id)sender {
    
    self.startButton.enabled = NO;
    
    [[Timer sharedInstance] startTimer:sender];
    
}


- (IBAction)pauseTimer:(id)sender {
    
    self.startButton.enabled = YES;
    
    [[Timer sharedInstance] pauseTimer:sender];
    
}

- (void)newRound {
    
    self.startButton.enabled = YES;
    
    [self updateTimerLabel];
    
    [self updateButton];
    
}

- (void)updateButton {
    
    self.startButton.enabled = YES; 
    
}



@end
