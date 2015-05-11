//
//  RoundsViewController.h
//  ThePomodoroRoundII
//
//  Created by Ethan Hess on 5/11/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) NSInteger currentRound;
@property (nonatomic, strong) UITableView *tableView;

@end
