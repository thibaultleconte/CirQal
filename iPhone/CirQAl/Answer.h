//
//  Answer.h
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Answer : NSObject 
{
    CLLocationCoordinate2D coordinate;  
    NSString *text;
    int iD;
    int questionID;
    BOOL inappropriate;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate; 
@property (nonatomic, retain) NSString *text;
@property (nonatomic, assign) int iD;
@property (nonatomic, assign) int questionID;
@property (nonatomic, assign) BOOL inappropriate;

@end
