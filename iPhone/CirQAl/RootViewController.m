//
//  RootViewController.m
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

@synthesize webView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    firstLoad = YES;
    
    NSString *urlAddress = @"http://88.190.232.179/ws/index.php";
        
    NSURL *url = [NSURL URLWithString: urlAddress];
        
    NSURLRequest *requestObj = [NSURLRequest requestWithURL: url];
        
    [webView loadRequest: requestObj];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (IBAction)btnAsk: (id)sender 
{
    MapViewController *mapViewController = [[MapViewController alloc] init];
    
    [self.navigationController pushViewController: mapViewController animated: YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)webViewDidFinishLoad:(UIWebView *)aWebView 
{
    if (firstLoad) 
    {
        firstLoad = NO;
        
        webView.alpha = 1.0;
    }
}

- (void)dealloc
{
    [webView release];
    [super dealloc];
}

@end
