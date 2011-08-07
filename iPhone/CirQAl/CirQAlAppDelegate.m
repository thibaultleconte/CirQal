//
//  CirQAlAppDelegate.m
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CirQAlAppDelegate.h"

@implementation CirQAlAppDelegate

@synthesize window=_window;

@synthesize navigationController=_navigationController;

@synthesize question;

@synthesize answer;

@synthesize deviceToken;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    [application registerForRemoteNotificationTypes: UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
    
    answer = [[Answer alloc] init];
    question = [[Question alloc] init];
    
    return YES;
}

- (void)application: (UIApplication *)application didReceiveRemoteNotification: (NSDictionary *)userInfo 
{
    NSLog(@"%@", userInfo);
    
    NSDictionary *data = [userInfo objectForKey: @"data"];

    NSString *type = [data objectForKey: @"type"];

    if ([type isEqualToString: @"Q"])
    {
        NSString *iD = [data objectForKey: @"id"];
        question.iD = [iD intValue];

        question.text = [data objectForKey: @"message"];
    
        AnswerViewController *answerViewController = [[AnswerViewController alloc] init];  
        
        [self.navigationController pushViewController: answerViewController animated: YES];
    } 
    else if ([type isEqualToString: @"A"])
    {
        NSString *iD = [data objectForKey: @"aid"];
        NSString *questionID = [data objectForKey: @"qid"];
        answer.iD = [iD intValue];
        answer.questionID = [questionID intValue];
        
        answer.text = [data objectForKey: @"amessage"];
        question.text = [data objectForKey: @"qmessage"];
        
        ResponseViewController *responseViewController = [[ResponseViewController alloc] init];
        
        [self.navigationController pushViewController: responseViewController animated: YES];
    }
}

- (void)application: (UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken: (NSData *)aDeviceToken 
{
	// You can send here, for example, an asynchronous HTTP request to your web-server to store this deviceToken remotely.
	self.deviceToken = aDeviceToken;
	
    NSLog(@"Did register for remote notifications: %@", deviceToken);
}

- (void)application: (UIApplication *)application didFailToRegisterForRemoteNotificationsWithError: (NSError *)error 
{
	self.deviceToken = nil;
	
    NSLog(@"Fail to register for remote notifications: %@", error);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [super dealloc];
}

@end
