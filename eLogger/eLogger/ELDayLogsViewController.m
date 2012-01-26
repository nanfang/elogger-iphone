//
//  ELDayLogsViewController.m
//  eLogger
//
//  Created by Nan Fang on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ELDayLogsViewController.h"

@implementation ELDayLogsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _dayLogsData = [[ELDayLogsData alloc]init];
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
    _headView = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 69)]autorelease];
    _headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"roll-top.png"]];
    
    _tailView = [[[UIView alloc]initWithFrame:CGRectMake(0, 426, 320, 34)]autorelease];    
    _tailView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"roll-bottom.png"]];
    
    _tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0,50,320,386)] autorelease];    
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"roll-bg.png"]];

    _tableView.delegate = _dayLogsData;
    _tableView.dataSource = _dayLogsData;
    _tableView.separatorColor = [UIColor clearColor];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    [self.view addSubview:_tableView];
    [self.view addSubview:_headView];
    [self.view addSubview:_tailView];
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

- (void)dealloc {
    [_dayLogsData release];
    [super dealloc];
}

@end
