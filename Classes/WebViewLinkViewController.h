//
//  WebViewLinkViewController.h
//  WebViewLink
//
//  Created by D Manidhar Reddy on 12/10/14.
//  Copyright echoihub.com All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewLinkViewController : UIViewController <UIWebViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate,NSURLConnectionDataDelegate,UIAlertViewDelegate>{
	
    BOOL _Authenticated;
    BOOL result ;
    NSURLRequest *_FailedRequest;
    NSString *url_store;
    NSString *boundary;
    UIImage *chosenImage;
    UIImageView *imageView;
    NSString *url_last_str;
    NSString *id_value;
    NSString *stored_id;
    NSString *url_str;
	IBOutlet UIWebView *myWebView;
	IBOutlet UISwitch *overrideLinksSwitch;

}
@property (nonatomic, strong) NSURL *originalUrl;
@property (nonatomic) BOOL validatedRequest;
-(void)imageDownload:(UIImage*)img;
- (void) myMethodAction;

@end

