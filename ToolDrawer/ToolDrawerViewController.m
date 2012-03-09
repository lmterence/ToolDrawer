//
//  ToolDrawerViewController.m
//
//  Created by Ayal Spitz on 7/17/11.
//  Copyright 2011 Ayal Spitz. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//  
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

#import "ToolDrawerViewController.h"
#import "ToolDrawerView.h"
//#import "HTToolbar.h"
//#import "HTPDFMenu.h"

#define HTTOOLBAR

@implementation ToolDrawerViewController
@synthesize menu;
@synthesize handleButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

#ifdef HTTOOLBAR
    htToolbar = [[HTToolbar alloc] initWithFrame:CGRectMake(220, 100, 100, 260)];
    htToolbar.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:htToolbar];
    
//      NSLog(@" %s, openPosition:%@", __FUNCTION__, NSStringFromCGPoint(openPosition));
//    openPosition =  CGPointMake(handleButton.center.x-70, handleButton.center.y);
//    closePosition = handleButton.center;
//    handleButton.center = closePosition;
//    NSLog(@" %s, openPosition:%@", __FUNCTION__, NSStringFromCGPoint(openPosition));
//    NSLog(@" %s, closePosition:%@", __FUNCTION__, NSStringFromCGPoint(closePosition));
//    
//   menu = [[HTPDFMenu alloc] initWithFrame:CGRectMake(320, 100, 70, 260)];
//    menu.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
//    [self.view addSubview:menu];
//    [menu updatePosition];
    
#else
    ToolDrawerView *toolDrawerView;
    
	UIButton *button;
	/*
    toolDrawerView = [[ToolDrawerView alloc]initInVerticalCorner:kTopCorner andHorizontalCorner:kLeftCorner moving:kHorizontally];
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"Apple" forState:UIControlStateNormal];
	[toolDrawerView appendButton:button];
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"Blackboard" forState:UIControlStateNormal];
	[toolDrawerView appendButton:button];
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"China" forState:UIControlStateNormal];
	[toolDrawerView appendButton:button];    
    [button addTarget:toolDrawerView action:@selector(blinkTabButton) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:toolDrawerView];
	[toolDrawerView blinkTabButton];
    
    toolDrawerView = [[ToolDrawerView alloc]initInVerticalCorner:kTopCorner andHorizontalCorner:kRightCorner moving:kVertically];
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"A" forState:UIControlStateNormal];
	[toolDrawerView appendButton:button];
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"B" forState:UIControlStateNormal];
	[toolDrawerView appendButton:button];
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"C" forState:UIControlStateNormal];
	[toolDrawerView appendButton:button];    
    [self.view addSubview:toolDrawerView];
	
    toolDrawerView = [[ToolDrawerView alloc]initInVerticalCorner:kBottomCorner andHorizontalCorner:kLeftCorner moving:kVertically];
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"A" forState:UIControlStateNormal];
	[toolDrawerView appendButton:button];
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"B" forState:UIControlStateNormal];
	[toolDrawerView appendButton:button];
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"C" forState:UIControlStateNormal];
	[toolDrawerView appendButton:button];    
    [self.view addSubview:toolDrawerView];
	*/
    toolDrawerView = [[ToolDrawerView alloc]initInVerticalCorner:kBottomCorner andHorizontalCorner:kRightCorner moving:kHorizontally];
    [self.view addSubview:toolDrawerView];
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"A" forState:UIControlStateNormal];
	[toolDrawerView appendButton:button];
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"B" forState:UIControlStateNormal];
	[toolDrawerView appendButton:button];
	button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setTitle:@"C" forState:UIControlStateNormal];
	[toolDrawerView appendButton:button];    
#endif
}

- (void)viewDidUnload
{
    [self setHandleButton:nil];
    [self setMenu:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
//    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(orientation)) 
    {
        htToolbar.frame = CGRectMake(380, 20, 100, 260);
    }
    else if (UIInterfaceOrientationIsPortrait(orientation))
    {
        htToolbar.frame = CGRectMake(220, 100, 100, 260);
    }
    
    [htToolbar computePositions];
}

- (IBAction)updatePosition:(id)sender 
{
    
    [menu updatePosition];
    
    if ([menu isOpen]) 
    {
        handleButton.center = openPosition;// CGPointMake(handleButton.center.x-menu.bounds.size.width, handleButton.center.y);
    }
    else
    {
        handleButton.center = closePosition;// CGPointMake(handleButton.center.x/*+menu.bounds.size.width*/, handleButton.center.y);
    }
    
    
}
@end
