//
//  AppDelegate.m
//  CPUTemperature
//
//  Created by Venkat on 10/10/14.
//  Copyright (c) 2014 Gudapati Naga Venkata Chaitanya. All rights reserved.
//

#import "AppDelegate.h"
#import "smc.h"
#import "StatusItemView.h"



@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(void) awakeFromNib{
    
    
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    
}

-(void) timer:(NSTimer *) aTimer{
    SMCOpen();
    self.temperature = SMCGetTemperature(SMC_KEY_CPU_TEMP);
    SMCClose();
    self.temperatureString = [NSString stringWithFormat:@"%0.1f°C", self.temperature];
    NSLog(@"The teps are %@", self.temperatureString);
    float width = 70;
    float height = [[NSStatusBar systemStatusBar] thickness];
    NSRect viewFrame = NSMakeRect(0, 0, width, height);
    [self.statusItem setView:[[StatusItemView alloc] initWithFrame:viewFrame controller:self]];
    
}




- (IBAction)showAbout:(NSMenuItem *)sender {
    [NSApp activateIgnoringOtherApps:YES];
    [self.appIconAboutPanel setImage:[NSImage imageNamed:@"IconAbout.png"]];
    [self.appNameAboutPanel setImage:[NSImage imageNamed:@"AppNameAboutPanel.png"]];
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *versionNumber = [infoDict objectForKey:@"CFBundleVersion"];
    [self.versionNumber setStringValue:versionNumber];
    [self.window makeKeyAndOrderFront:nil];
    [self.copyrightAndLicense setString:@"Copyright © Gudapati Naga Venkata Chaitanya.\nDistributed under GPLv3 licence(http://www.gnu.org/copyleft/gpl.html).\nSpecial thanks to devnull for the SMC code and Matt Gemmell for his NSStatusItem code.\nSupport/Feedback?, email: cgudapati@outlook.com"];
    [self.copyrightAndLicense.textStorage setFont:[NSFont systemFontOfSize:11]];
}
- (IBAction)quit:(NSMenuItem *)sender {
    [NSApp terminate:nil];
}

@end
