//
//  Communication.h
//  PhotoViewer
//
//  Created by Andre Muis on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface Communication : NSObject 
{
    id target;
	SEL action;
    
    NSMutableData *receivedData;
    
    BOOL errorOccurred;
    NSString *errorLocalizedDescription;
}

@property (nonatomic) BOOL errorOccurred;
@property (nonatomic, retain) NSString *errorLocalizedDescription;

- (void)postQuestionWithTarget: (id)aTarget Action: (SEL)anAction;

- (void)postAnswerWithTarget: (id)aTarget Action: (SEL)anAction;

- (void)postResponseWithTarget: (id)aTarget Action: (SEL)anAction;

- (NSString *)URLEncode: (NSString *)string;

@end
