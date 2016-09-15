//
//  ArcImageView.h
//  ArcDraw
//
//  Created by Gaurav Sharma on 31/08/16.
//  Copyright © 2016 GDS. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface ArcImageView : UIImageView

@property (nonatomic) IBInspectable BOOL clockWise;

- (void)cropStartAngle:(CGFloat)start endAngle:(CGFloat)end;

@end
