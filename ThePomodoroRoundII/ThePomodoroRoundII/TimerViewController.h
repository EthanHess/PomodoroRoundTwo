//
//  TimerViewController.h
//  ThePomodoroRoundII
//
//  Created by Ethan Hess on 5/11/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Timer.h"

@interface TimerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (nonatomic, strong) Timer *timer;

@end
