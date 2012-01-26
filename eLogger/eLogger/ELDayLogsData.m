//
//  ELDayLogsData.m
//  eLogger
//
//  Created by Nan Fang on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ELDayLogsData.h"

@implementation ELDayLogsData 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
    cell.backgroundColor = [UIColor clearColor];
    cell.opaque = NO;
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
//    cell.backgroundColor = [UIColor colorWithRed:.1 green:.1 blue:.1 alpha:0];
    
    [[cell textLabel] setText:@"1. my work"];
    return cell;
}
@end
