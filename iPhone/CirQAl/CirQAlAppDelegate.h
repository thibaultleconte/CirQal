//
//  CirQAlAppDelegate.h
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface CirQAlAppDelegate : NSObject <UIApplicationDelegate> 
{    
    NSData *deviceToken;
    
    Question *question;
    
    Answer *answer;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic, retain) NSData *deviceToken;

@property (nonatomic, retain) Question* question;

@property (nonatomic, retain) Answer* answer;

@end
