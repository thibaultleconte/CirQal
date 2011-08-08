//
//  QuestionViewController.h
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface QuestionViewController : UIViewController <UITextViewDelegate>
{    
    Communication *comm;
        
    UITextView *textViewQuestion;
}

@property (nonatomic, retain) IBOutlet UITextView *textViewQuestion;

- (IBAction)btnAskTouchDown:(id)sender;

- (void)postQuestionComplete: (NSData *)data;

@end
