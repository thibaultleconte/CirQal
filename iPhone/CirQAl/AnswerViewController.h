//
//  AnswerViewController.h
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface AnswerViewController : UIViewController <UITextFieldDelegate> 
{
    Communication *comm;
    
    UILabel *lblQuestion;
    UITextView *textViewAnswer;
}

@property (nonatomic, retain) IBOutlet UILabel *lblQuestion;
@property (nonatomic, retain) IBOutlet UITextView *textViewAnswer;

- (IBAction)btnAnswerTouchDown:(id)sender;
- (IBAction)btnInappropriateTouchDown:(id)sender;

- (void)postAnswerComplete: (NSData *)data;

@end
