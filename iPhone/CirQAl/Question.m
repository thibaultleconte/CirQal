//
//  Question.m
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize iD, coordinate, text, inappropriate;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        iD = 0;
        coordinate = CLLocationCoordinate2DMake(0.0, 0.0);
        text = @"";
        inappropriate = NO;
    }

    return self;
}

- (void)dealloc
{
    [text release];
    
    [super dealloc];
}

@end
