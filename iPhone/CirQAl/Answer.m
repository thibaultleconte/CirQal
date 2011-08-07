//
//  Answer.m
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Answer.h"

@implementation Answer

@synthesize coordinate, text, iD, questionID, inappropriate;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        coordinate = CLLocationCoordinate2DMake(0.0, 0.0);
        text = @"";
        iD = 0;
        questionID = 0;
        inappropriate = NO;
    }
    
    return self;
}

- (void)deallac
{
    [text release];
}

@end
