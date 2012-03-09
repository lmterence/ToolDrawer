//
//  HTPDFMenu.h
//  ToolDrawer
//
//  Created by Lei Ming on 12-3-9.
//  Copyright (c) 2012年 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTPDFMenu : UIView {
    
    CGPoint openPosition;
    CGPoint closePosition;
    
//    CGAffineTransform positionTransform;
    
//    UIButton *handleButton;
    BOOL open;
}

- (bool)isOpen;
- (void)updatePosition;

@end
