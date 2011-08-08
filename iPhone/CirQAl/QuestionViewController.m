//
//  QuestionViewController.m
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuestionViewController.h"

@implementation QuestionViewController

@synthesize textViewQuestion;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [textViewQuestion release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btnAskTouchDown: (id)sender 
{
    CirQAlAppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    Question *question = (Question *)delegate.question;
    
    question.text = textViewQuestion.text;
    
    comm = [[Communication alloc] init];
    
    [comm postQuestionWithTarget: self Action: @selector(postQuestionComplete:)];
}

- (void)postQuestionComplete: (NSData *)data
{
    NSString *response = [[NSString alloc] initWithData: data encoding: NSASCIIStringEncoding];
    
    NSLog(@"%@", response);

    [comm release];
    
    [self.navigationController popToRootViewControllerAnimated: YES];
}

- (void)viewDidUnload
{
    [self setTextViewQuestion:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textView: (UITextView *)textView shouldChangeTextInRange: (NSRange)range replacementText: (NSString *)string
{
	BOOL changeText = YES;
	
	NSRange rangeNewLine = [string rangeOfString: @"\n"];
    
	if (rangeNewLine.location != NSNotFound)
	{
		changeText = NO;
        
		[textViewQuestion resignFirstResponder];
	}
	
	return changeText;
}

@end
