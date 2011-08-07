//
//  Communication.m
//  PhotoViewer
//
//  Created by Andre Muis on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Communication.h"

@implementation Communication

@synthesize errorOccurred, errorLocalizedDescription;

- (id)init
{
	self = [super init];
	
    if (self)
	{
        target = nil;
        
        receivedData = nil;

        errorOccurred = NO;
        errorLocalizedDescription = @"";
	}
	
	return self;
}

- (void)postQuestionWithTarget: (id)aTarget Action: (SEL)anAction
{
    target = aTarget;
    action = anAction;
    
    CirQAlAppDelegate *delegate = (CirQAlAppDelegate *)[UIApplication sharedApplication].delegate;
    
    Question *question = (Question *)delegate.question;
    
	NSString *keyEncoded = [self URLEncode: @"iid"];
	NSString *valueEncoded = [self URLEncode: [NSString stringWithFormat: @"%@", delegate.deviceToken]];
     
	NSString *postBody = [NSString stringWithFormat: @"%@=%@&", keyEncoded, valueEncoded];
	
	keyEncoded = [self URLEncode: @"lo"];
	valueEncoded = [self URLEncode: [NSString stringWithFormat: @"%f", question.coordinate.longitude]];

    postBody = [postBody stringByAppendingFormat: @"%@=%@&", keyEncoded, valueEncoded];
    
    keyEncoded = [self URLEncode: @"la"];
	valueEncoded = [self URLEncode: [NSString stringWithFormat: @"%f", question.coordinate.latitude]];

    postBody = [postBody stringByAppendingFormat: @"%@=%@&", keyEncoded, valueEncoded];

    keyEncoded = [self URLEncode: @"q"];
	valueEncoded = [self URLEncode: question.text];

    postBody = [postBody stringByAppendingFormat: @"%@=%@", keyEncoded, valueEncoded];

    NSLog(@"%@", postBody);
    
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
	[request setURL: [NSURL URLWithString: @"http://88.190.232.179/ws/execute.php?a=ask"]];
	[request setHTTPMethod: @"POST"];
	[request addValue: @"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
    [request setHTTPBody: [postBody dataUsingEncoding: NSUTF8StringEncoding]];
    
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest: request delegate: self];
	[request release];
	
    if (connection) 
    {
        receivedData = [[NSMutableData data] retain];
    } 
    else 
    {
        errorOccurred = YES;
        errorLocalizedDescription = @"";
    }
}

- (void)postAnswerWithTarget: (id)aTarget Action: (SEL)anAction
{
    target = aTarget;
    action = anAction;
    
    CirQAlAppDelegate *delegate = (CirQAlAppDelegate *)[UIApplication sharedApplication].delegate;
    
    Question *question = (Question *)delegate.question;
    Answer *answer = (Answer *)delegate.answer;
    
	NSString *keyEncoded = [self URLEncode: @"iid"];
	NSString *valueEncoded = [self URLEncode: [NSString stringWithFormat: @"%@", delegate.deviceToken]];
    
	NSString *postBody = [NSString stringWithFormat: @"%@=%@&", keyEncoded, valueEncoded];
	
	keyEncoded = [self URLEncode: @"lo"];
	valueEncoded = [self URLEncode: [NSString stringWithFormat: @"%f", answer.coordinate.longitude]];
    
    postBody = [postBody stringByAppendingFormat: @"%@=%@&", keyEncoded, valueEncoded];
    
    keyEncoded = [self URLEncode: @"la"];
	valueEncoded = [self URLEncode: [NSString stringWithFormat: @"%f", answer.coordinate.latitude]];
    
    postBody = [postBody stringByAppendingFormat: @"%@=%@&", keyEncoded, valueEncoded];
    
    keyEncoded = [self URLEncode: @"qid"];
	valueEncoded = [self URLEncode: [NSString stringWithFormat: @"%d", question.iD]];
    
    postBody = [postBody stringByAppendingFormat: @"%@=%@&", keyEncoded, valueEncoded];
    
    keyEncoded = [self URLEncode: @"inap"];
    
    if (question.inappropriate == NO)
        valueEncoded = [self URLEncode: @"no"];
    else
        valueEncoded = [self URLEncode: @"yes"];
            
    postBody = [postBody stringByAppendingFormat: @"%@=%@&", keyEncoded, valueEncoded];
    
    keyEncoded = [self URLEncode: @"m"];
	valueEncoded = [self URLEncode: answer.text];
    
    postBody = [postBody stringByAppendingFormat: @"%@=%@", keyEncoded, valueEncoded];

    NSLog(@"%@", postBody);
    
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
	[request setURL: [NSURL URLWithString: @"http://88.190.232.179/ws/execute.php?a=ans"]];
	[request setHTTPMethod: @"POST"];
	[request addValue: @"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
    [request setHTTPBody: [postBody dataUsingEncoding: NSUTF8StringEncoding]];
    
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest: request delegate: self];
	[request release];
	
    if (connection) 
    {
        receivedData = [[NSMutableData data] retain];
    } 
    else 
    {
        errorOccurred = YES;
        errorLocalizedDescription = @"";
    }
}

- (void)postResponseWithTarget: (id)aTarget Action: (SEL)anAction
{
    target = aTarget;
    action = anAction;
    
    CirQAlAppDelegate *delegate = (CirQAlAppDelegate *)[UIApplication sharedApplication].delegate;
    
    Question *question = (Question *)delegate.question;
    Answer *answer = (Answer *)delegate.answer;
    
	NSString *keyEncoded = [self URLEncode: @"iid"];
	NSString *valueEncoded = [self URLEncode: [NSString stringWithFormat: @"%@", delegate.deviceToken]];
    
	NSString *postBody = [NSString stringWithFormat: @"%@=%@&", keyEncoded, valueEncoded];
	
	keyEncoded = [self URLEncode: @"lo"];
	valueEncoded = [self URLEncode: [NSString stringWithFormat: @"%f", answer.coordinate.longitude]];
    
    postBody = [postBody stringByAppendingFormat: @"%@=%@&", keyEncoded, valueEncoded];
    
    keyEncoded = [self URLEncode: @"la"];
	valueEncoded = [self URLEncode: [NSString stringWithFormat: @"%f", answer.coordinate.latitude]];
    
    postBody = [postBody stringByAppendingFormat: @"%@=%@&", keyEncoded, valueEncoded];
    
    keyEncoded = [self URLEncode: @"aid"];
	valueEncoded = [self URLEncode: [NSString stringWithFormat: @"%d", answer.iD]];
    
    postBody = [postBody stringByAppendingFormat: @"%@=%@&", keyEncoded, valueEncoded];
    
    keyEncoded = [self URLEncode: @"inap"];
    
    if (question.inappropriate == NO)
        valueEncoded = [self URLEncode: @"no"];
    else
        valueEncoded = [self URLEncode: @"yes"];
    
    postBody = [postBody stringByAppendingFormat: @"%@=%@&", keyEncoded, valueEncoded];
    
    NSLog(@"%@", postBody);
    
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
	[request setURL: [NSURL URLWithString: @"http://88.190.232.179/ws/execute.php?a=res"]];
	[request setHTTPMethod: @"POST"];
	[request addValue: @"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
    [request setHTTPBody: [postBody dataUsingEncoding: NSUTF8StringEncoding]];
    
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest: request delegate: self];
	[request release];
	
    if (connection) 
    {
        receivedData = [[NSMutableData data] retain];
    } 
    else 
    {
        errorOccurred = YES;
        errorLocalizedDescription = @"";
    }
}

- (void)connection: (NSURLConnection *)connection didReceiveResponse: (NSURLResponse *)response
{
    if ([response respondsToSelector: @selector(statusCode)] == YES)
    {
        int statusCode = [((NSHTTPURLResponse *)response) statusCode];
        
        if (statusCode >= 400)
        {
            [connection cancel];
            
            NSDictionary *errorInfo = [NSDictionary dictionaryWithObject: [NSString stringWithFormat: NSLocalizedString(@"Server returned status code %d", @""), statusCode]
                                                                  forKey: NSLocalizedDescriptionKey];

            NSError *statusError = [NSError errorWithDomain: @"com.ClipLabs.PhotoViewer"
                                                       code: statusCode
                                                   userInfo: errorInfo];

            [self connection: connection didFailWithError: statusError];
        }
    }

    [receivedData setLength: 0];
}

- (void)connection: (NSURLConnection *)connection didReceiveData: (NSData *)data
{
    [receivedData appendData: data];
}

- (void)connection: (NSURLConnection *)connection didFailWithError: (NSError *)error
{
    [connection release];
    [receivedData release];
    
    errorOccurred = YES;
    errorLocalizedDescription = @"";
}

- (void)connectionDidFinishLoading: (NSURLConnection *)connection 
{
    if ([target respondsToSelector: action] == YES)
    {
        [target performSelector: action withObject: receivedData];
    }
    else
    {    
        [NSException raise: @"" format: @"Target %@ does not respond to given selector.", target];
    }
    
    [connection release];
    [receivedData release];
}

- (NSString *)URLEncode: (NSString *)string
{
	NSString *encodedString = (NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)string, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);
	
	return [encodedString autorelease];
}

- (void)deaaloc
{
    [receivedData release];
    
    [errorLocalizedDescription release];

    [super dealloc];
}

@end
