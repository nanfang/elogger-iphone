//
//  ELDayLogsData.m
//  eLogger
//
//  Created by Nan Fang on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ELDayLogsDataSource.h"
#import "ELDayLogCell.h"
#import "NSDate+Extensions.h"

@implementation ELDayLogsDataSource 
@synthesize today=_today;

- (id)init {
    self = [super init];
    if (self) {
        _loadedMonths = [[NSMutableArray arrayWithCapacity:2]retain];
        _dayLogs = [[NSMutableDictionary dictionaryWithCapacity:30]retain];
        _monthDays = [[NSMutableDictionary dictionaryWithCapacity:2]retain]; 
        self.today = [NSDate date];
        [_loadedMonths addObject:[self monthString:_today]];
        [_loadedMonths addObject:[self monthString:[_today dateBySubtractingDays:_today.day]]];
    }
    return self;
}

- (NSString*)monthString:(NSDate*)date
{
    return [date formattedDateWithFormatString:@"yyyy-MM"];
}

- (void)loadDate {
    
    self.today = [NSDate date];
    
}

- (void)dealloc {
    [_loadedMonths release];
    [_dayLogs release];
    [_monthDays release];
    self.today = nil;
    [super dealloc];
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

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 100;
//}

@end
