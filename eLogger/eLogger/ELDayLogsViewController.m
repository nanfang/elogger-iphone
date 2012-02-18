//
//  ELDayLogsViewController.m
//  eLogger
//
//  Created by Nan Fang on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ELDayLogsViewController.h"
#import "ELEditViewController.h"
#import "ELDayLog.h"
#import "ELDayLogCell.h"
#import "NSDate+Extensions.h"

@implementation ELDayLogsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _loadedMonths = [[NSMutableArray arrayWithCapacity:2]retain];
        _dayLogs = [[NSMutableDictionary dictionaryWithCapacity:30]retain];
        _monthDays = [[NSMutableDictionary dictionaryWithCapacity:2]retain]; 
        _today = [[NSDate date]retain];
        [_loadedMonths addObject:[self monthString:_today]];
        [_loadedMonths addObject:[self monthString:[_today dateBySubtractingDays:_today.day]]];

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
    
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
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

- (NSString*)monthString:(NSDate*)date
{
    return [date formattedDateWithFormatString:@"yyyy-MM"];
}

- (void)loadDate {
    [_today release];
    _today = [NSDate date];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_loadedMonths count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString * monthString = [_loadedMonths objectAtIndex:section];
    return [self monthDays:monthString];
}

- (NSInteger) monthDays:(NSString*)monthString
{
    if([_monthDays objectForKey:monthString]){
        return [[_monthDays objectForKey:monthString] intValue];
    }
    
    int days = [monthString isEqualToString:[self monthString:_today]]?  _today.day:[[NSDate dateWithDateString:[monthString stringByAppendingString:@"-1"]] monthDays];
    [_monthDays setObject:monthString forKey:[NSNumber numberWithInt:days]];
    return days;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"DayLogsTableViewCell";
    
    ELDayLogCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[ELDayLogCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    NSString * monthString = [_loadedMonths objectAtIndex:indexPath.section];
    NSInteger year = [[monthString substringToIndex:4] intValue];
    NSInteger month = [[monthString substringFromIndex:5] intValue];
    NSInteger day = [self monthDays:monthString] - indexPath.row;
    cell.day = day;
    cell.year = year;
    cell.month = month;
    cell.content = @"1. 搞定elogger的界面,哇哈哈哈哈哈哈\n2. 读完《架构师-11-4》,收获甚微，咋办啊\n3.其他时间在fooling around";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ELDayLogCell *cell = (ELDayLogCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    [cell fitContent];
    return cell.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ELEditViewController *editViewController = [[[ELEditViewController alloc]init]autorelease];
    [self presentModalViewController:editViewController animated:YES];
    
}


- (void)dealloc {

    [_loadedMonths release];
    [_dayLogs release];
    [_monthDays release];
    [_today release];
    [super dealloc];
}

@end
