//
//  RoundsViewController.m
//  ThePomodoroRoundII
//
//  Created by Ethan Hess on 5/11/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "RoundsViewController.h"
#import "Timer.h"

@interface RoundsViewController ()

@property (nonatomic, strong) NSArray *roundTimes;

@end

@implementation RoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Rounds";
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithRed:38/255.0f green:211/255.0f blue:246/255.0f alpha:1.0f];
    [self.view addSubview:self.tableView];
    
    self.currentRound = 0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(roundComplete) name:timerEnded object:nil];
    
}

- (void)roundComplete {
    
    if (self.currentRound != [self roundTimes].count - 1) {
        
        self.currentRound ++;
    }
    
    [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:self.currentRound inSection:0]];
    
    
}

- (NSArray *)roundTimes {
    
    return self.roundTimes = @[@25,@5,@25,@5,@25,@15];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self roundTimes].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ Minutes", [self roundTimes][indexPath.row]];
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:24];
    cell.textLabel.textColor = [UIColor colorWithRed:(243.0/255.0) green:(235.0/255.0) blue:(20.0/255.0) alpha:1.0];
    cell.backgroundColor = [UIColor colorWithRed:(152.0/255.0) green:(10.0/255.0) blue:(13.0/255.0) alpha:1.0];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(roundSelected:) name:@"timerStarted" object:nil];
    
    self.currentRound = indexPath.row;
    
    [self roundSelected:indexPath.row];
    
}

- (void)roundSelected:(NSInteger)currentRound {
    
    Timer *timer = [Timer sharedInstance];
    
    NSArray *array = [self roundTimes];
    
    currentRound = self.currentRound;
    
    timer.minutes = [array[currentRound]integerValue];
    
    timer.seconds = 0;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:currentRoundNotification object:nil];
    
}

@end





