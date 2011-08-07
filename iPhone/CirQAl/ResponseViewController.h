//
//  ResponseViewController.h
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ResponseViewController : UIViewController <UITextFieldDelegate>
{
    Communication *comm;
    
    UILabel *lblQuestion;
    UITextView *lblAnswer;
}

@property (nonatomic, retain) IBOutlet UILabel *lblQuestion;
@property (nonatomic, retain) IBOutlet UITextView *lblAnswer;

- (IBAction)btnAcceptTouchDown:(id)sender;
- (IBAction)lblRejectTouchDown:(id)sender;

@end
