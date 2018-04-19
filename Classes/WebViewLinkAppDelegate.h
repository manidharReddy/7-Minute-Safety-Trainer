//
//  WebViewLinkAppDelegate.h
//  WebViewLink
//
//  Created by D Manidhar Reddy on 12/10/14.
//  Copyright echoihub.com All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewLinkViewController;

@interface WebViewLinkAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WebViewLinkViewController *viewController;
    UIImage *imagestore;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WebViewLinkViewController *viewController;

@end

