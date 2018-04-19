//
//  WebViewLinkAppDelegate.m
//  WebViewLink
//
//  Created by D Manidhar Reddy on 12/10/14.
//  Copyright echoihub.com All rights reserved.
//

#import "WebViewLinkAppDelegate.h"
#import "WebViewLinkViewController.h"

@implementation WebViewLinkAppDelegate

@synthesize window;
@synthesize viewController;

/*
- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch
    
    self.window = [UIWindow new];
   // [self.window makeKeyAndVisible];443
    self.window.frame = [[UIScreen mainScreen] bounds];
     self.viewController = [[WebViewLinkViewController alloc] initWithNibName:@"WebViewLinkViewController" bundle:nil];
    
    //[window addSubview:viewController.view];
    self.window.rootViewController = viewController;
   // [self.window setRootViewController:self.viewController];
      [window makeKeyAndVisible];
}
*/

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    //self.window = [UIWindow new];
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    self.viewController = [[WebViewLinkViewController alloc] initWithNibName:@"WebViewLinkViewController" bundle:nil];
    
    self.window.rootViewController = viewController;
    
    [window makeKeyAndVisible];
    return YES;
}
- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
