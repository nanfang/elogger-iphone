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


- (NSString*)monthString:(NSDate*)date
{
    return [date formattedDateWithFormatString:@"yyyy-MM"];
}

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

- (void) loadDayLogs
{
    
    // TODO load from local-db/api
    ELDayLog * dayLog = [[[ELDayLog alloc]init]autorelease];
    dayLog.year = 2012;
    dayLog.month = 2;
    dayLog.day = 17;
    dayLog.content = @"1. 搞定elogger的界面,哇哈哈哈哈哈哈\n2. 读完《架构师-11-4》,收获甚微，咋办啊\n3.其他时间在fooling around";
    [_dayLogs setObject:dayLog forKey:dayLog.title];
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

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    _headView = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 69)]autorelease];
    _headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"roll-top.png"]];
    
    _tailView = [[[UIView alloc]initWithFrame:CGRectMake(0, 426, 320, 34)]autorelease];    
    _tailView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"roll-bottom.png"]];
    
    _tableView = [[[UITableView alloc] initWithFrame:CGRectMake(0,50,320,386) style:UITableViewStylePlain] autorelease];    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"roll-bg.png"]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollsToTop = YES;
    _tableView.separatorColor = [UIColor clearColor];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    [self.view addSubview:_tableView];
    [self.view addSubview:_headView];
    [self.view addSubview:_tailView];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadDayLogs];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_loadedMonths count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString * monthString = [_loadedMonths objectAtIndex:section];
    return [self monthDays:monthString];
    
}



- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
}

- (ELDayLog *) dayLogAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * monthString = [_loadedMonths objectAtIndex:indexPath.section];
    NSInteger year = [[monthString substringToIndex:4] intValue];
    NSInteger month = [[monthString substringFromIndex:5] intValue];
    NSInteger day = [self monthDays:monthString] - indexPath.row;
    
    ELDayLog *dayLog =  (ELDayLog *)[_dayLogs objectForKey:[NSString stringWithFormat:@"%d-%02d-%02d", year, month, day]];
    
    if(!dayLog){
        dayLog = [[[ELDayLog alloc]initWithYear:year month:month day:day]autorelease];
    }
    return dayLog;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"DayLogsTableViewCell";
    
    ELDayLogCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[ELDayLogCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.dayLog = [self dayLogAtIndexPath:indexPath];
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
    editViewController.dayLog = [self dayLogAtIndexPath:indexPath];
    editViewController.indexPath = indexPath;
    editViewController.delegate = self;
    [self presentModalViewController:editViewController animated:YES];
}

- (void)savedDayLog:(ELDayLog*)dayLog atIndexPath:(NSIndexPath *)indexPath
{
    [self dismissModalViewControllerAnimated:YES];
    [_dayLogs setValue:dayLog forKey:dayLog.title];
    [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
}


- (void)loadNextMonth
{
    NSLog(@"next month");
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{	
    //    if (_status == LOADING) {
    //        return;
    //    }
    CGPoint offset = scrollView.contentOffset;
    CGSize size = scrollView.contentSize;
    CGSize tableSize = _tableView.bounds.size;
    
    CGFloat offsetHeight = offset.y + tableSize.height;
    if (offsetHeight > size.height + 60) {
//        [_tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:[_nearbyPlaces count] inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
        [self loadNextMonth];
    } else {

    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//	NSLog(@"drag");
}


- (void)dealloc {

    [_loadedMonths release];
    [_dayLogs release];
    [_monthDays release];
    [_today release];
    [super dealloc];
}

@end
