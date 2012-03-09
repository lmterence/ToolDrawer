//
//  HTPDFMenu.m
//  ToolDrawer
//
//  Created by Lei Ming on 12-3-9.
//  Copyright (c) 2012年 Ayal Spitz. All rights reserved.
//

#import "HTPDFMenu.h"

@interface HTPDFMenu ()

//- (bool)isOpen;
//- (void)createTabButton;
- (void)computePositions;
//- (void)updatePosition;

@end

@implementation HTPDFMenu

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor blueColor];
        open = NO;
        
        self.opaque = NO;
        
        [self computePositions];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - ()

- (bool)isOpen
{
    return open;
}

- (void)computePositions;
{
    NSLog(@"%s, bounds:%@", __FUNCTION__, NSStringFromCGRect(self.bounds));
    //    openPosition = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
    openPosition = CGPointMake(self.frame.origin.x + self.bounds.size.width / 2.0, self.frame.origin.y + self.bounds.size.height / 2.0);
    closePosition = CGPointMake(openPosition.x+self.bounds.size.width/2, openPosition.y);
    NSLog(@"1 %s, openPosition:%@", __FUNCTION__, NSStringFromCGPoint(openPosition));
    NSLog(@"1 %s, closePosition:%@", __FUNCTION__, NSStringFromCGPoint(closePosition));
    
    //    openPosition = CGPointApplyAffineTransform(openPosition, positionTransform);
    //    closePosition = CGPointApplyAffineTransform(closePosition, positionTransform);
    //    NSLog(@"2 %s, openPosition:%@", __FUNCTION__, NSStringFromCGPoint(openPosition));
    //    NSLog(@"2 %s, closePosition:%@", __FUNCTION__, NSStringFromCGPoint(closePosition));
    self.center = closePosition;
//    if ([self isOpen])
//    {
//        self.center = openPosition;
//    }
//    else
//    {
//        self.center = closePosition;
//    }
}

- (void)updatePosition
{
    [UIView animateWithDuration:0.5
						  delay:0.0
						options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         if ([self isOpen]){
                             self.center = closePosition;
                         } else {
                             self.center = openPosition;
                         }
                         //                         NSLog(@"1%s", __FUNCTION__);
                         open = !open;
                         //                         NSLog(@"2%s", __FUNCTION__);
                         // If the toolbar isn't at full brightness, ie alpha = 1.0, set it to 1.0
                         if (self.alpha != 1.0){
                             self.alpha = 1.0;
                         }
                         
                         //                         self.handleButton.transform = CGAffineTransformRotate(self.handleButton.transform, M_PI);
                     }
					 completion:nil];
}

@end
