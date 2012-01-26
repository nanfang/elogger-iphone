//
//  ELLoginViewController.m
//  eLogger
//
//  Created by Nan Fang on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ELLoginViewController.h"
#import "ELEditViewController.h"
#import "ELDayLogsViewController.h"

@implementation ELLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_login.jpg"]];
    UIButton* weiboButton = [UIButton buttonWithType:UIButtonTypeCustom];
    weiboButton.backgroundColor = [UIColor clearColor];
    [weiboButton setBackgroundImage:[UIImage imageNamed:@"btn-weibo.png"] forState:UIControlStateNormal];
    weiboButton.frame=CGRectMake(100, 360, 119, 22);
    [weiboButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weiboButton];
    
}

- (void)login
{
//    ELEditViewController *editViewController = [[[ELEditViewController alloc]init]autorelease];
    ELDayLogsViewController *dayLogsController = [[[ELDayLogsViewController alloc]init]autorelease];
    [self presentModalViewController:dayLogsController animated:YES];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
