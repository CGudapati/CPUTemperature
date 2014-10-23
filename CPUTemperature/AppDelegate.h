//
//  AppDelegate.h
//  CPUTemperature
//
//  Created by Venkat on 10/10/14.
//  Copyright (c) 2014 Gudapati Naga Venkata Chaitanya. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "StatusItemView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (weak) IBOutlet NSMenu *menu;
@property (weak) IBOutlet NSImageView *appIconAboutPanel;
@property (weak) IBOutlet NSImageView *appNameAboutPanel;
@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *versionNumber;
@property (unsafe_unretained) IBOutlet NSTextView *copyrightAndLicense;
@property (strong, nonatomic) NSString *temperatureString;
@property double temperature;
@end

