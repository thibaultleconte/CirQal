//
//  MapAnnotation.h
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface MapAnnotation : NSObject<MKAnnotation> 
{
    CLLocationCoordinate2D coordinate;
    
    NSString *title;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, retain) NSString *title;

@end
