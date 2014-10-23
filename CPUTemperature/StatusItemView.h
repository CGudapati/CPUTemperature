//
//  CustomView.h
//  NSStatusItemTest
//
//  Created by Matt Gemmell on 04/03/2008.
//  Copyright 2008 Magic Aubergine. All rights reserved.
//


//
//  StatusItemView.h
//  CPUTemperature
//
//  Created by Venkat on 23/10/14.
//  Copyright (c) 2014 Gudapati Naga Venkata Chaitanya. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class AppDelegate;

@interface StatusItemView : NSView

@property (weak) AppDelegate *controller;
@property BOOL clicked;
@property NSSize msgSize;

-(instancetype) initWithFrame:(NSRect)frameRect controller:(AppDelegate *) cntrlr;

@end
