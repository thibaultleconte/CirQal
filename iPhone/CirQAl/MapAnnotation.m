//
//  MapAnnotation.m
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation

@synthesize coordinate, title;

- (id)initWithCoordinate: (CLLocationCoordinate2D) aCoordinate
{
    coordinate = aCoordinate;
    
    return self;
}

@end
