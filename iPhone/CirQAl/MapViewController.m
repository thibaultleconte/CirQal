//
//  MapViewController.m
//  CirQAl
//
//  Created by Andre Muis on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

@synthesize mapView;

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
    [mapView release];
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

- (void)mapView: (MKMapView *)aMapView didUpdateUserLocation: (MKUserLocation *)userLocation
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(mapView.userLocation.location.coordinate, 2000.0, 2000.0);
    
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits: viewRegion];                
    
    [mapView setRegion: adjustedRegion animated: YES];  
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget: self action: @selector(handleLongPress:)];
    longPress.cancelsTouchesInView = YES;
    longPress.numberOfTouchesRequired = 1;
    longPress.minimumPressDuration = 0.4;
    [mapView addGestureRecognizer: longPress];
    [longPress release];
}

- (void)handleLongPress: (UILongPressGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan)
	{
        CGPoint touchPoint = [recognizer locationInView: mapView];
    
        CLLocationCoordinate2D annotationCoordinate = [mapView convertPoint: touchPoint toCoordinateFromView: mapView];
        
        MapAnnotation *mapAnnotation = [[MapAnnotation alloc] initWithCoordinate: annotationCoordinate];
        
        [mapView addAnnotation: mapAnnotation];
        
        CirQAlAppDelegate *delegate = [UIApplication sharedApplication].delegate;
        
        Question *question = (Question *)delegate.question;
        
        question.coordinate = annotationCoordinate;
        
        QuestionViewController *questionViewController = [[QuestionViewController alloc] init]; 
        
        [self.navigationController pushViewController: questionViewController animated: YES];
    }
}

- (void)viewDidAppear: (BOOL)animated
{
    [self viewWillAppear: animated];
    
  //  CirQAlAppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    //Question *question = (Question *)delegate.question;

    // NSLog(@"1) %f", question.coordinate.latitude);
    // NSLog(@"2) %f", question.coordinate.longitude);
    // NSLog(@"3) %@", question.text);
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
