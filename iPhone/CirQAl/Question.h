//
//  Question.h
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface Question : NSObject 
{
    int iD;
    CLLocationCoordinate2D coordinate; 
    NSString *text;
    BOOL inappropriate;
}

@property (nonatomic, assign) int iD; 
@property (nonatomic, assign) CLLocationCoordinate2D coordinate; 
@property (nonatomic, retain) NSString *text;
@property (nonatomic, assign) BOOL inappropriate; 

@end
