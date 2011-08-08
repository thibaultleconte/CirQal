//
//  RootViewController.h
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface RootViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView *webView;
    
    BOOL firstLoad;
}

- (IBAction)btnAsk: (id)sender;

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end
