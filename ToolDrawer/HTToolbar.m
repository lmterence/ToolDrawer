//
//  HTToolbar.m
//  ToolDrawer
//
//  Created by Lei Ming on 12-3-8.
//  Copyright (c) 2012年 Ayal Spitz. All rights reserved.
//

#import "HTToolbar.h"

#define handleButtonWidth 30
#define handleButtonHeight 30

@interface HTToolbar ()

//- (bool)isOpen;
- (void)createTabButton;
//- (void)computePositions;
- (void)updatePosition;

@end

@implementation HTToolbar

@synthesize handleButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        // Initialization code
        
        self.backgroundColor = [UIColor blueColor];
        open = YES;
        
        self.opaque = NO;
        
        [self createTabButton];
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

//- (void)dealloc
//{
//    [handleButton release];
//}

#pragma mark - view methods

#pragma mark
/*
- (void)didMoveToSuperview{
    
    NSLog(@"%s", __FUNCTION__);
    
    CGRect r = self.bounds;
    
    NSLog(@"%s, rect:%@", __FUNCTION__, NSStringFromCGRect(self.superview.bounds));
    CGFloat w = r.size.width / 2.0;
    CGFloat h = r.size.height / 2.0;
    
    CGAffineTransform directionTransform;
    
//    if (self.direction == kVertically){
//        directionTransform = CGAffineTransformMakeScale(-1.0, 1.0);
//        directionTransform = CGAffineTransformConcat(directionTransform, CGAffineTransformMakeRotation(-(M_PI / 2.0)));
//    } else {
        directionTransform = CGAffineTransformIdentity;
//    }
    
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(-1, -1);
    
    self.transform = CGAffineTransformConcat(directionTransform, scaleTransform);
    
//    for(UIView *subview in self.subviews){
//        if (subview != handleButton){
//            subview.transform = CGAffineTransformInvert(self.transform);
//        }
//    }
    
    CGAffineTransform screenTransform;
    screenTransform = CGAffineTransformMakeTranslation(-w, -h);
//    screenTransform = CGAffineTransformConcat(screenTransform, scaleTransform);
//    screenTransform = CGAffineTransformConcat(screenTransform, CGAffineTransformMakeTranslation(w, h));
    
    
    positionTransform = screenTransform;//CGAffineTransformConcat(directionTransform, screenTransform);
    
    [self computePositions];
}
*/

#pragma mark - ()

- (bool)isOpen
{
    return open;
}

- (void)createTabButton
{
    CGRect rect = self.frame;
    NSLog(@"%s, self frame:%@", __FUNCTION__, NSStringFromCGRect(self.frame));
    self.handleButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    self.handleButton.frame = CGRectMake(0, (rect.size.height-handleButtonHeight)/2, handleButtonWidth, handleButtonHeight);
    self.handleButton.center = CGPointMake(handleButtonWidth/2, (rect.size.height/2));
    NSLog(@"%s, handle button frame:%@ \n center:%@", __FUNCTION__, NSStringFromCGRect(self.handleButton.frame), NSStringFromCGPoint(self.handleButton.center));
//    self.handleButton.frame = CGRectMake(0.0, 115.0, 30.0, 30.0);
//    self.handleButton.center = CGPointMake(15.0, 130.0);
    self.handleButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
//    [self.handleButton setImage:handleButtonImage forState:UIControlStateNormal];
    [self.handleButton addTarget:self action:@selector(updatePosition) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.handleButton];
    
    [self computePositions];
}

- (void)computePositions
{
    NSLog(@"%s, bounds:%@", __FUNCTION__, NSStringFromCGRect(self.bounds));
//    openPosition = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
     openPosition = CGPointMake(self.frame.origin.x + self.bounds.size.width / 2.0, self.frame.origin.y + self.bounds.size.height / 2.0);
    closePosition = CGPointMake(openPosition.x + 70, openPosition.y);
    NSLog(@"1 %s, openPosition:%@", __FUNCTION__, NSStringFromCGPoint(openPosition));
    NSLog(@"1 %s, closePosition:%@", __FUNCTION__, NSStringFromCGPoint(closePosition));
    
//    openPosition = CGPointApplyAffineTransform(openPosition, positionTransform);
//    closePosition = CGPointApplyAffineTransform(closePosition, positionTransform);
//    NSLog(@"2 %s, openPosition:%@", __FUNCTION__, NSStringFromCGPoint(openPosition));
//    NSLog(@"2 %s, closePosition:%@", __FUNCTION__, NSStringFromCGPoint(closePosition));
//    self.center = openPosition;
    
    if ([self isOpen])
    {
        self.center = openPosition;
    }
    else
    {
        self.center = closePosition;
    }
    
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
