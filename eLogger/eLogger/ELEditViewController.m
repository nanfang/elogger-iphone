//
//  ELEditViewController.m
//  eLogger
//
//  Created by Nan Fang on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "ELEditViewController.h"

@implementation ELEditViewController
@synthesize dayLog=_dayLog, delegate=_delegate,indexPath=_indexPath;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    self.dayLog = nil;
    self.indexPath = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void) saveLog
{
    self.dayLog.content=_logEditView.text;
    [_delegate savedDayLog:_dayLog atIndexPath:_indexPath];
}

- (void) cancel
{
    [self dismissModalViewControllerAnimated:YES];
}


#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_edit.jpg"]];
    
    _logEditView = [[[UITextView alloc]init]autorelease];
    _logEditView.layer.borderWidth = 1;
    _logEditView.layer.cornerRadius = 5;
    _logEditView.layer.borderColor = [[UIColor blueColor] CGColor];
    _logEditView.frame = CGRectMake(10, 50, 300, 150);
    _logEditView.backgroundColor = [UIColor clearColor];
    [_logEditView becomeFirstResponder];
    
    _titleLabel = [[[UILabel alloc]init]autorelease];
    _titleLabel.frame = CGRectMake(10, 10, 120, 30);
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:22];
    [self.view addSubview:_titleLabel];
    
    [self.view addSubview:_logEditView];
    
    UIButton * saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    saveButton.frame = CGRectMake(180, 10, 60, 30);
    [saveButton addTarget:self action:@selector(saveLog) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
    
    UIButton * cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    cancelButton.frame = CGRectMake(250, 10, 60, 30);
    [cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:cancelButton];
    
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    _logEditView.text = _dayLog.content;
    _titleLabel.text = _dayLog.title;
}

- (void)viewDidUnload
{
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
