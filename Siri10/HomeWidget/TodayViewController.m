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
    
+ (UIColor *)pmg_lightPeachColor {
    return [UIColor colorWithRed:254.0f / 255.0f green:228.0f / 255.0f blue:193.0f / 255.0f alpha:1.0f];
}
    
+ (UIColor *)pmg_dirtBrownColor {
    return [UIColor colorWithRed:102.0f / 255.0f green:58.0f / 255.0f blue:42.0f / 255.0f alpha:1.0f];
}
    
+ (UIColor *)pmg_dirtBrownColorLowAlpha {
    return [UIColor colorWithRed:102.0f / 255.0f green:58.0f / 255.0f blue:42.0f / 255.0f alpha:0.10f];
}
    
+ (UIColor *)pmg_butterscotchColor {
    return [UIColor colorWithRed:255.0f / 255.0f green:202.0f / 255.0f blue:56.0f / 255.0f alpha:1.0f];
}
    
+ (UIColor *)pmg_siennaColor {
    return [UIColor colorWithRed:165.0f / 255.0f green:64.0f / 255.0f blue:27.0f / 255.0f alpha:1.0f];
}
    
+ (UIColor *)pmg_goldenYellowColor {
    return [UIColor colorWithRed:255.0f / 255.0f green:198.0f / 255.0f blue:39.0f / 255.0f alpha:1.0f];
}
    
+ (UIColor *)pmg_denimBlueColor {
    return [UIColor colorWithRed:59.0f / 255.0f green:89.0f / 255.0f blue:152.0f / 255.0f alpha:1.0f];
}
    
+ (UIColor *)pmg_lightBlueGreyColor {
    return [UIColor colorWithRed:187.0f / 255.0f green:199.0f / 255.0f blue:225.0f / 255.0f alpha:1.0f];
}
    
+ (UIColor *)pmg_lightPeach40Color {
    //return [UIColor colorWithRed:254.0f / 255.0f green:228.0f / 255.0f blue:193.0f / 255.0f alpha:0.4f]; //67
    return [UIColor colorWithRed:254.0f / 255.0f green:228.0f / 255.0f blue:193.0f / 255.0f alpha:1.0f];
}
    
+ (UIColor *)pmg_lightPeach67Color {
    // return [UIColor colorWithRed:254.0f / 255.0f green:228.0f / 255.0f blue:193.0f / 255.0f alpha:0.67f]; //67
    return [UIColor colorWithRed:254.0f / 255.0f green:228.0f / 255.0f blue:193.0f / 255.0f alpha:1.0f];
}
    
    
+ (UIColor *)pmg_scarletColor {
    return [UIColor colorWithRed:208.0f / 255.0f green:2.0f / 255.0f blue:27.0f / 255.0f alpha:1.0f];
}
    
+ (UIColor *)pmg_yellowOrangeColor {
    return [UIColor colorWithRed:255.0f / 255.0f green:186.0f / 255.0f blue:0.0 alpha:1.0f];
}
    
+ (UIColor *)pmg_appleGreenColor {
    return [UIColor colorWithRed:126.0f / 255.0f green:211.0f / 255.0f blue:33.0f / 255.0f alpha:1.0f];
}
    
+ (UIColor *)pmg_sectionHeaderColor {
    return [UIColor colorWithRed:176.0f / 255.0f green:67.0f / 255.0f blue:28.0f / 255.0f alpha:1.0f];
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
}
@end

@implementation TodayViewController
    
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self showScore];
}
    
- (void)showScore {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [arcView cropStartAngle:0 endAngle:252];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
