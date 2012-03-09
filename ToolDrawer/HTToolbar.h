//
//  HTToolbar.h
//  ToolDrawer
//
//  Created by Lei Ming on 12-3-8.
//  Copyright (c) 2012年 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTToolbar : UIView {
    
    CGPoint openPosition;
    CGPoint closePosition;
    
    CGAffineTransform positionTransform;
    
    UIButton *handleButton;
    BOOL open;
}

//@property BOOL open;
@property (nonatomic, retain) UIButton *handleButton;

- (bool)isOpen;
- (void)computePositions;

@end
