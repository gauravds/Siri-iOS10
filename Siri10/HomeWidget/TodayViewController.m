//
//  TodayViewController.m
//  HomeWidget
//
//  Created by Gaurav Sharma on 15/09/16.
//  Copyright © 2016 GDS. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "ArcView.h"



@implementation UIColor (PMGAdditions)
    
+ (UIColor *)pmg_orangeYellowColor {
    return [UIColor colorWithRed:255.0f / 255.0f green:159.0f / 255.0f blue:0.0 alpha:1.0f];
}
    
+ (UIColor *)pmg_dirtBrownColor {
    return [UIColor colorWithRed:102.0f / 255.0f green:58.0f / 255.0f blue:42.0f / 255.0f alpha:1.0f];
}

@end


@implementation DesignBtn

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.layer.cornerRadius = 4.f;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor pmg_orangeYellowColor];
        [self setTitleColor:[UIColor pmg_dirtBrownColor] forState:UIControlStateNormal];
    }
    return self;
}

@end


@interface TodayViewController () <NCWidgetProviding> {
    __weak IBOutlet ArcView *arcView;
    __weak IBOutlet UILabel *lblScore;
    NSInteger points;
}
@end

@implementation TodayViewController
    
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self showScore];
}

- (void)viewDidLoad {
    points = 70;
    [self setPoints];
}

- (void)setPoints {
    lblScore.text = [NSString stringWithFormat:@"Points Earned: %ld/100", points];
}
    
- (void)showScore {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [arcView cropStartAngle:0 endAngle:self.angle];
    });
}

- (NSInteger)angle {
    return 360 * points / 100;
}

- (IBAction)btnEarnTapped:(id)sender {
    points += 5;
    [self setPoints];
    
}

- (IBAction)btnRedeemTapped:(id)sender {
    points -= 5;
    [self setPoints];
}

@end
