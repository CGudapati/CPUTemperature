//
//  CustomView.m
//  NSStatusItemTest
//
//  Created by Matt Gemmell on 04/03/2008.
//  Copyright 2008 Magic Aubergine. All rights reserved.
//


//
//  StatusItemView.m
//  CPUTemperature
//
//  Created by Venkat on 23/10/14.
//  Copyright (c) 2014 Gudapati Naga Venkata Chaitanya. All rights reserved.
//


#import "StatusItemView.h"
#import "AppDelegate.h"

@implementation StatusItemView



-(instancetype) initWithFrame:(NSRect)frameRect controller:(AppDelegate *) cntrlr;
{
    if (self = [super initWithFrame:frameRect]) {
        self.controller = cntrlr;
    }
    
    return self;
}

- (void)drawRect:(NSRect)rect {
    // Draw background if appropriate.
    
    if (self.clicked) {
        [[NSColor selectedMenuItemColor] set];
        NSRectFill(rect);
    }
    if(self.controller.temperature <= 50){
        
        NSString *text = self.controller.temperatureString;
        NSColor *textColor = [NSColor controlTextColor];
        
        if (self.clicked) {
            textColor = [NSColor selectedMenuItemTextColor];
        }
        
        NSFont *msgFont = [NSFont menuBarFontOfSize:13.5];
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        [paraStyle setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
        [paraStyle setAlignment:NSCenterTextAlignment];
        [paraStyle setLineBreakMode:NSLineBreakByTruncatingTail];
        NSMutableDictionary *msgAttrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                         msgFont, NSFontAttributeName,
                                         textColor, NSForegroundColorAttributeName,
                                         paraStyle, NSParagraphStyleAttributeName,
                                         nil];
        NSImage *greenImage = [NSImage imageNamed:@"statusGreen"];
        
        self.msgSize = [text sizeWithAttributes:msgAttrs] ;
        NSSize imageSize = [greenImage size];
        NSRect msgRect = NSMakeRect(0, 0, self.msgSize.width, self.msgSize.height);
        NSRect imageRect = NSMakeRect(0, 0, imageSize.width, imageSize.height);
        msgRect.origin.x = ([self frame].size.width - self.msgSize.width) / 2.0 + imageSize.width/3.0;
        msgRect.origin.y = ([self frame].size.height - self.msgSize.height) / 2.0;
        imageRect.origin.x = 2.0;
        imageRect.origin.y = ([self frame].size.height - imageSize.height) / 2.0;
        
        [text drawInRect:msgRect withAttributes:msgAttrs];
        [greenImage drawInRect:imageRect];
    }
    
    
    if(self.controller.temperature > 50 && self.controller.temperature<70){
        
        NSString *text = self.controller.temperatureString;
        NSColor *textColor = [NSColor controlTextColor];
        
        if (self.clicked) {
            textColor = [NSColor selectedMenuItemTextColor];
        }
        
        NSFont *msgFont = [NSFont menuBarFontOfSize:13.5];
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        [paraStyle setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
        [paraStyle setAlignment:NSCenterTextAlignment];
        [paraStyle setLineBreakMode:NSLineBreakByTruncatingTail];
        NSMutableDictionary *msgAttrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                         msgFont, NSFontAttributeName,
                                         textColor, NSForegroundColorAttributeName,
                                         paraStyle, NSParagraphStyleAttributeName,
                                         nil];
        NSImage *orangeImage = [NSImage imageNamed:@"statusOrange"];
        
        self.msgSize = [text sizeWithAttributes:msgAttrs] ;
        NSSize imageSize = [orangeImage size];
        NSRect msgRect = NSMakeRect(0, 0, self.msgSize.width, self.msgSize.height);
        NSRect imageRect = NSMakeRect(0, 0, imageSize.width, imageSize.height);
        msgRect.origin.x = ([self frame].size.width - self.msgSize.width) / 2.0 + imageSize.width/3.0;
        msgRect.origin.y = ([self frame].size.height - self.msgSize.height) / 2.0;
        imageRect.origin.x = 2.0;
        imageRect.origin.y = ([self frame].size.height - imageSize.height) / 2.0;
        
        [text drawInRect:msgRect withAttributes:msgAttrs];
        [orangeImage drawInRect:imageRect];
    }
    
    if(self.controller.temperature >= 70){
        NSString *text = self.controller.temperatureString; // whatever you want
        NSColor *textColor = [NSColor controlTextColor];
        
        if (self.clicked) {
            textColor = [NSColor selectedMenuItemTextColor];
        }
        
        NSFont *msgFont = [NSFont menuBarFontOfSize:13.5];
        NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
        [paraStyle setParagraphStyle:[NSParagraphStyle defaultParagraphStyle]];
        [paraStyle setAlignment:NSCenterTextAlignment];
        [paraStyle setLineBreakMode:NSLineBreakByTruncatingTail];
        NSMutableDictionary *msgAttrs = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                         msgFont, NSFontAttributeName,
                                         textColor, NSForegroundColorAttributeName,
                                         paraStyle, NSParagraphStyleAttributeName,
                                         nil];
        
        NSImage *redImage = [NSImage imageNamed:@"statusRed"];
        
        self.msgSize = [text sizeWithAttributes:msgAttrs] ;
        NSSize imageSize = [redImage size];
        NSRect msgRect = NSMakeRect(0, 0, self.msgSize.width, self.msgSize.height);
        NSRect imageRect = NSMakeRect(0, 0, imageSize.width, imageSize.height);
        msgRect.origin.x = ([self frame].size.width - self.msgSize.width) / 2.0 + imageSize.width/3.0;
        msgRect.origin.y = ([self frame].size.height - self.msgSize.height) / 2.0;
        imageRect.origin.x = 2.0;
        imageRect.origin.y = imageSize.height/ 2.0;
        [text drawInRect:msgRect withAttributes:msgAttrs];
        [redImage drawInRect:imageRect];
    }
    
    
}

- (void)mouseDown:(NSEvent *)event
{
    self.clicked = !self.clicked;
    [self setNeedsDisplay:YES];
    [self.controller.statusItem popUpStatusItemMenu:self.controller.menu];
    self.clicked = !self.clicked;
    [self setNeedsDisplay:YES];
    
}






@end
