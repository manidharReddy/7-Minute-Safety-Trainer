//
//  WebViewLinkViewController.m
//  WebViewLink
//
//  Created by D Manidhar Reddy on 12/10/14.
//  Copyright echoihub.com All rights reserved.
//

#import "WebViewLinkViewController.h"
#import "SystemConfiguration/SystemConfiguration.h"
#import "MBProgressHUD.h"
@implementation WebViewLinkViewController
@synthesize originalUrl,validatedRequest;
- (void)viewDidLoad {
	
    const char *host_name = "www.google.com";
    
    if( [self checkConnection:host_name] ){
     
    // self.originalUrl = [NSURL URLWithString:@"http://192.168.0.14:8080/SafetyMeetingMobile/faces/Login.xhtml"];
       // self.originalUrl = [NSURL URLWithString:@"https://safety-staging.coggno.com/SafetyMeetingMobile/faces/Login.xhtml"];
        self.originalUrl = [NSURL URLWithString:@"https://safetytrainer-int.coggno.com/SafetyMeetingMobile/faces/Login.xhtml"];
        NSURLRequest *request = [NSURLRequest requestWithURL:self.originalUrl];
        [NSURLConnection connectionWithRequest:request delegate:self];
        
       // myWebView.hidden=YES;
       
        
        
     //   url_str =@"http://192.168.0.14:8080/SafetyMeetingMobile/faces/Login.xhtml";
     // url_str =@"https://safety-staging.coggno.com/SafetyMeetingMobile/faces/Login.xhtml";
       url_str =@"https://safetytrainer-int.coggno.com/SafetyMeetingMobile/faces/Login.xhtml";
        myWebView.backgroundColor = [UIColor grayColor];
        myWebView.scrollView.scrollEnabled = YES;
        myWebView.scrollView.bounces = NO;
        
      //  myWebView.clipsToBounds=YES;
       // myWebView.alpha = 0;
        
	 //  [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.14:8080/SafetyMeetingMobile/faces/Login.xhtml"]]];
      //[myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://safety-staging.coggno.com/SafetyMeetingMobile/faces/Login.xhtml"]]];
       [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://safetytrainer-int.coggno.com/SafetyMeetingMobile/faces/Login.xhtml"]]];


        
    }else{
        NSLog(@"Net Not available");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Mobile Data is not available. Please connect to your provider and try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";

    [super viewDidLoad];
}
////////////////////////////////////Webview Delegate Method///////////////////////////////////////////////////////////////////
#pragma mark - UIWebViewDelegate

// you will see this called for 404 errors

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //myWebView.hidden=NO;
    // [myWebView stringByEvaluatingJavaScriptFromString:url_str];
    //myWebView.clipsToBounds=YES;
    self.validatedRequest = NO; // reset this for the next link the user clicks on
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    /*
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:0.30];
    
   // self.webview.alpha = 1;
    myWebView.alpha=1;
    
    [UIView commitAnimations];
     */
}

// you will not see this called for 404 errors
/*
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"didfalied");
    
    
    NSLog(@"%s error=%@", __FUNCTION__, error);
}
*/
// this is where you could, intercept HTML requests and route them through
// NSURLConnection, to see if the server responds successfully.

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
   // myWebView.hidden=YES;
    /////////////HTTPS/////////////////////////////////////
     result = _Authenticated;
    if (!_Authenticated) {
        _FailedRequest = request;
        NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        [urlConnection start];
    }
    //return result;

    //////////////////////////////////////////////////////
    NSLog(@" check mani:%d",self.validatedRequest);
  // if (self.validatedRequest == 1 ){
   // return YES;
    
	if(navigationType == UIWebViewNavigationTypeLinkClicked) {
		
        NSLog(@"Link Test");
      
            [[UIApplication sharedApplication] openURL:[request URL]];
            return NO;
      
        
        
    } else if(navigationType == UIWebViewNavigationTypeOther) {
        
        if (overrideLinksSwitch.on == TRUE) {
            
            NSURL *url  = request.URL;
            NSString *scheme = [url scheme];
            NSString *urlChange = [url absoluteString];
            
            NSLog(@"Schemasd %@",scheme);
            NSLog(@"urlChangefrv %@",urlChange);
            NSLog(@"substring:%@",urlChange);
            @try {
                
             NSRange rangeurl = [urlChange rangeOfString:@"meetingscamera.html"];
                             NSRange rangeurlinc = [urlChange rangeOfString:@"incident.html"];
                NSRange rangejpg = [urlChange rangeOfString:@"jpg"];
                NSRange rangepng = [urlChange rangeOfString:@"png"];
                
                NSLog(@"rangeurl mani:%d",rangeurl.location);
                                NSLog(@"rangeurllink mani:%d",rangeurlinc.location);
             //   if (rangeurl.location!=NSNotFound || rangeurlinc.location!=NSNotFound ) {
                    
               //     return YES;
                //}
                
                
               
                
            //if ([urlChange containsString:@"incident.html"]) {
                if (rangeurlinc.location!=NSNotFound) {
                url_last_str=@"incident.html";
                NSLog(@"Enter in incident ghhj");
                
                @try {
                NSRange range = [urlChange rangeOfString:@"="];
                id_value = [urlChange substringWithRange:NSMakeRange(range.location,[urlChange length] - range.location)];
                NSLog(@"id_value incident check: %@", id_value);
                stored_id = [[NSString alloc]initWithFormat:@"%@",id_value];
                NSLog(@"id_value incident: %@", stored_id);
                }
                @catch (NSException *exception) {
                    
                    NSLog(@"Exception Range:%@",exception);
                }
                @finally {
                    
                }
                [self myMethodAction];
                [myWebView stopLoading];
            
                
            }else //if ([urlChange containsString:@"meetingscamera.html"]) {
                                if (rangeurl.location!=NSNotFound) {
                url_last_str=@"meetingscamera.html";
                NSLog(@"Enter in meetingscamera");
                
                @try {
                    NSRange range = [urlChange rangeOfString:@"="];
                    id_value = [urlChange substringWithRange:NSMakeRange(range.location,[urlChange length] - range.location)];
                    NSLog(@"id_value incident check: %@", id_value);
                    stored_id = [[NSString alloc]initWithFormat:@"%@",id_value];
                    NSLog(@"id_value incident: %@", stored_id);
                }
                @catch (NSException *exception) {
                    
                    NSLog(@"Exception Range:%@",exception);
                }
                @finally {
                    
                }
                [self myMethodAction];
                [myWebView stopLoading];
                
            }else //if ([urlChange containsString:@"jpg"]||[urlChange containsString:@"png"]) {
                if ((rangejpg.location!=NSNotFound)||(rangepng.location!=NSNotFound)) {
                
                NSLog(@"Image Down Check:%@",urlChange);
                NSURL *myUrl = [NSURL URLWithString:urlChange];
                NSData *myData = [NSData dataWithContentsOfURL:myUrl];
                UIImage *img = [UIImage imageWithData:myData];
                [self imageDownload:img];
                [myWebView stopLoading];
            }
                
            }
            @catch (NSException *exception) {
                NSLog(@"Exception couaght:%@",exception);
            }
            @finally {
                
            }

            
            return YES;
            
        }
        
        else {
            return YES;
        }
    }
  //}else{
    
      NSLog(@"mani enter");
        //self.originalUrl = request.URL;
        
        //[NSURLConnection connectionWithRequest:request delegate:self];

    //    return NO;
    //}

	return YES;
}



////////////////////////////////Connection for secure protocol HTTPS////////////////////////////////////////////////////

-(void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        NSURL* baseURL = [NSURL URLWithString:url_str];
        if ([challenge.protectionSpace.host isEqualToString:baseURL.host]) {
            NSLog(@"trusting connection to host %@", challenge.protectionSpace.host);
            [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
        } else
            NSLog(@"Not trusting connection to host %@", challenge.protectionSpace.host);
    }
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}


#pragma mark - NSURLConnectionDataDelegate method

// This code inspired by http://www.ardalahmet.com/2011/08/18/how-to-detect-and-handle-http-status-codes-in-uiwebviews/
// Given that some ISPs do redirects that one might otherwise prefer to see handled as errors, I'm also checking
// to see if the original URL's host matches the response's URL. This logic may be too restrictive (some valid redirects
// will be rejected, such as www.adobephotoshop.com which redirects you to www.adobe.com), but does capture the ISP
// redirect problem I am concerned about.

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)pResponse {
    
    
    _Authenticated = YES;
  //  [connection cancel];
    //[myWebView loadRequest:_FailedRequest];
    NSLog(@"enter in didresponse");
    NSString *originalUrlHostName = self.originalUrl.host;
    NSString *responseUrlHostName = pResponse.URL.host;
    
    NSRange originalInResponse = [responseUrlHostName rangeOfString:originalUrlHostName]; // handle where we went to "apple.com" and got redirected to "www.apple.com"
    NSRange responseInOriginal = [originalUrlHostName rangeOfString:responseUrlHostName]; // handle where we went to "www.stackoverflow.com" and got redirected to "stackoverflow.com"
    
    if (originalInResponse.location == NSNotFound && responseInOriginal.location == NSNotFound) {
        NSLog(@"%s you were redirected from %@ to %@", __FUNCTION__, self.originalUrl.absoluteString, pResponse.URL.absoluteString);
    }
    
    if ([pResponse isKindOfClass:[NSHTTPURLResponse class]]) {
        NSInteger statusCode = [(NSHTTPURLResponse *)pResponse statusCode];
        
        if (statusCode < 200 || statusCode >= 300) {
            NSLog(@"%s request to %@ failed with statusCode=%d", __FUNCTION__, pResponse.URL.absoluteString, statusCode);
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Downtime during server maintenance!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        } else {
            self.validatedRequest = YES;
            
            [myWebView loadRequest:connection.originalRequest];
        }
    }
    
    [connection cancel];
}


/////////////////////Checking if internet is Avialable or Not////////////////////////
#pragma mark Custom Actions
-(BOOL)CheckNetwork
{
    const char *host_name = "www.google.com";
    if( [self checkConnection:host_name] )
    {
        NSLog(@"Net available");
        return YES;
    }
    else
    {
        NSLog(@"Net Not available");
        return NO;
    }
    
}

- (BOOL) checkConnection:(const char*) host_name
{
    BOOL _isDataSourceAvailable = NO;
    Boolean success;
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host_name);
    
    SCNetworkReachabilityFlags flags;
    success = SCNetworkReachabilityGetFlags(reachability, &flags);
    _isDataSourceAvailable = success &&(flags & kSCNetworkFlagsReachable) &&!(flags & kSCNetworkFlagsConnectionRequired);
    
    CFRelease(reachability);
    
    return _isDataSourceAvailable;
}
////////////////////////////////////////////////////////////////////////////////////////////
- (void) myMethodAction {
	
	UIAlertView *nwAlert = [[UIAlertView alloc] initWithTitle:@"" 
													  message:@""
													 delegate:self 
											cancelButtonTitle:@"Cancel"
											otherButtonTitles:@"Take Pic",@"Select Pic",nil];
	[nwAlert show];
	[nwAlert release];
	
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonmeetingscamera
{
    NSLog(@"Alert meetingscamera:%d",buttonmeetingscamera);
    
    
    
    if(buttonmeetingscamera==0)
    {
        NSLog(@"Heelo0");
        [self backtoUrl];
    }
    else  if(buttonmeetingscamera==1)
    {
        NSLog(@"Heelo1");
        
        
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                  message:@"Device has no camera"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            
            [myAlertView show];
            
        }else{
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
        }
    }
    else  if(buttonmeetingscamera==2){
        NSLog(@"Heelo2");
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

-(void)backtoUrl{

    //[myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://safetytrainer-int.coggno.com/SafetyMeetingMobile/faces/NewIncident.xhtml"]]];
}

////////////////////////////////Image uploading from iphone////////////////////////
-(void)uploadImage{

    MBProgressHUD *hud1 = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud1.labelText = @"Uploading....";
    
    NSLog(@"imageDisplay:%@",imageView.image);
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *now = [[NSDate alloc] init];
    NSString *imageName = [NSString stringWithFormat:@"Image_%@", [format stringFromDate:now]];
    
    [now release];
    [format release];
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    
    if([url_last_str isEqualToString:@"meetingscamera.html"]){
        NSLog(@"Enter in if meetingscamera.html");
     //[request setURL:[NSURL URLWithString:@"http://192.168.0.14:8080/SafetyMeetingMobile/faces/upload.xhtml"]];
       //  [request setURL:[NSURL URLWithString:@"https://safety-staging.coggno.com/SafetyMeetingMobile/faces/upload.xhtml"]];
        [request setURL:[NSURL URLWithString:@"https://safetytrainer-int.coggno.com/SafetyMeetingMobile/faces/upload.xhtml"]];
    }else if([url_last_str isEqualToString:@"incident.html"]){
         NSLog(@"Enter in if incident.html");
      // [request setURL:[NSURL URLWithString:@"http://192.168.0.14:8080/SafetyMeetingMobile/faces/incidentimageupload.xhtml"]];
     //[request setURL:[NSURL URLWithString:@"https://safety-staging.coggno.com/SafetyMeetingMobile/faces/incidentimageupload.xhtml"]];
        [request setURL:[NSURL URLWithString:@"https://safetytrainer-int.coggno.com/SafetyMeetingMobile/faces/incidentimageupload.xhtml"]];
    }
    [request setHTTPMethod:@"POST"];
    
    /*
     Set Header and content type of your request.
     */
    boundary = @"--------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    /*
     now lets create the body of the request.
     */
    NSMutableData *body = [NSMutableData data];
    
    if (stored_id) {
        @try {
            NSLog(@"ID Value:%@",stored_id);
        
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"id"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", stored_id] dataUsingEncoding:NSUTF8StringEncoding]];
        
        }
        @catch (NSException *exception) {
            NSLog(@"Exception Handle::%@",exception);
        }
        @finally {
            
            NSLog(@"Finally Block");
        }
        
    }
    
    
    
    NSData *imageData = UIImageJPEGRepresentation(imageView.image, 1.0);
    if (imageData) {
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@.jpg\"\r\n", imageName] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:imageData];
    [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    // set body with request.
    [request setHTTPBody:body];
    [request addValue:[NSString stringWithFormat:@"%d", [body length]] forHTTPHeaderField:@"Content-Length"];

    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if(data.length > 0)
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"success");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Image uploaded" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
            
            //success
        }else{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"Failed to load image");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Image uploaded failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }];
    
    
    

}
///////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    chosenImage =[[UIImage alloc]init];
    chosenImage = info[UIImagePickerControllerEditedImage];
    imageView = [[UIImageView alloc] init];
    imageView.image = info[UIImagePickerControllerEditedImage];
    NSLog(@"ImageViewDisplay:%@",chosenImage);
    [self uploadImage];
    //self.imageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    //[self backtoUrl];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

//////////////////Image downloading///////////////////////////////////////
-(void)imageDownload:(UIImage*)img{


    MBProgressHUD *hud1 = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud1.labelText = @"Downloading....";
    
    NSLog(@"Downloading...");
    // Get an image from the URL below
    
    NSLog(@"%f,%f",img.size.width,img.size.height);
    
    // Let's save the file into Document folder.
    // You can also change this to your desktop for testing. (e.g. /Users/kiichi/Desktop/)
    // NSString *deskTopDir = @"/Users/kiichi/Desktop";
    @try{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    // If you go to the folder below, you will find those pictures
    NSLog(@"%@",docDir);
    
    NSLog(@"saving png");
    NSString *pngFilePath = [NSString stringWithFormat:@"%@/test.png",docDir];
    NSData *data1 = [NSData dataWithData:UIImagePNGRepresentation(img)];
    [data1 writeToFile:pngFilePath atomically:YES];
    
    NSLog(@"saving jpeg");
    NSString *jpegFilePath = [NSString stringWithFormat:@"%@/test.jpeg",docDir];
    NSData *data2 = [NSData dataWithData:UIImageJPEGRepresentation(img, 1.0f)];//1.0f = 100% quality
    [data2 writeToFile:jpegFilePath atomically:YES];
    UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
    
    NSLog(@"saving image done");
    
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Image Downloaded" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    
    }
    @catch (NSException *exception) {
     
        NSLog(@"Exception Image:%@",exception);
    }
    @finally {
      
        NSLog(@"Finally");
    }

}


-(void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_USEC), dispatch_get_main_queue(),
                   ^{
                       @try {
                           
                       
                       [super presentViewController:viewControllerToPresent animated:flag completion:completion];
                       }
                       @catch (NSException *exception) {
                           NSLog(@"Exception Handle:%@",exception);
                       }
                       @finally {
                           NSLog(@"Final Block");
                       }
                   });
}


- (void)dealloc {
    [super dealloc];
}

@end
