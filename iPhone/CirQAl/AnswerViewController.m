//
//  AnswerViewController.m
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnswerViewController.h"

@implementation AnswerViewController

@synthesize lblQuestion;
@synthesize textViewAnswer;

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
    [lblQuestion release];
    [textViewAnswer release];
    
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
    
    CirQAlAppDelegate *delegate = (CirQAlAppDelegate *)[UIApplication sharedApplication].delegate;
    
    Question *question = (Question *)delegate.question;
    
    lblQuestion.text = question.text;
}

- (IBAction)btnAnswerTouchDown: (id)sender 
{
    CirQAlAppDelegate *delegate = (CirQAlAppDelegate *)[UIApplication sharedApplication].delegate;
    
    Question *question = (Question *)delegate.question;
    Answer *answer = (Answer *)delegate.answer;
    
    answer.coordinate = CLLocationCoordinate2DMake(0.0, 0.0);
    answer.text = textViewAnswer.text;
    question.inappropriate = NO;

    comm = [[Communication alloc] init];
    
    [comm postAnswerWithTarget: self Action: @selector(postAnswerComplete:)];
}

- (IBAction)btnInappropriateTouchDown: (id)sender 
{
    CirQAlAppDelegate *delegate = (CirQAlAppDelegate *)[UIApplication sharedApplication].delegate;

    Question *question = (Question *)delegate.question;
    Answer *answer = (Answer *)delegate.answer;
    
    answer.coordinate = CLLocationCoordinate2DMake(0.0, 0.0);
    answer.text = textViewAnswer.text;
    question.inappropriate = YES; 
    
    comm = [[Communication alloc] init];
    
    [comm postAnswerWithTarget: self Action: @selector(postAnswerComplete:)];
}

- (void)postAnswerComplete: (NSData *)data
{
    NSString *response = [[NSString alloc] initWithData: data encoding: NSASCIIStringEncoding];
    
    NSLog(@"%@", response);
    
    [comm release];
    
    [self.navigationController popViewControllerAnimated: YES];
}

- (void)viewDidUnload
{
    [self setLblQuestion:nil];
    [self setTextViewAnswer:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn: (UITextField *)textField 
{
    [textField resignFirstResponder];
    
    return NO;
}

@end
