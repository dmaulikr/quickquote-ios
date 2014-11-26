//
//  Appium.swift
//  QuickQuote


import Foundation

class Apptest {
    init()
    {
        
    }
    
    func run()
    {
     
    }
}



/*
#import <Selenium/SERemoteWebDriver.h>

@implementation SeleniumTest

-(void) run
{
SECapabilities *caps = [SECapabilities new];
[caps addCapabilityForKey:@"appium-version" andValue:@"1.0"];
[caps setPlatformName:@"iOS"];
[caps setPlatformVersion:@"8.1"];
[caps setDeviceName:@"iPhone 6"];
[caps setApp:@"/Users/bmcleod/Library/Developer/Xcode/DerivedData/quickTest-QuickQuote-cudombkntbcpcsdhgihimsxqvjfh/Build/Products/Debug-iphonesimulator/quickTest.app"];
NSError *error;
SERemoteWebDriver *wd = [[SERemoteWebDriver alloc] initWithServerAddress:@"0.0.0.0" port:4723 desiredCapabilities:caps requiredCapabilities:nil error:&error];
[[wd findElementBy:[SEBy xPath:@"//UIAApplication[1]/UIAWindow[1]/UIAButton[1]"]] click];
}

@end
*/