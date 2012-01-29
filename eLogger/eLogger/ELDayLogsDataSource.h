//
//  ELDayLogsData.h
//  eLogger
//
//  Created by Nan Fang on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELDayLogsDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>{
    NSMutableDictionary * _dayLogs;
    NSMutableArray * _loadedMonths;
    NSMutableDictionary * _monthDays;
}

@property(nonatomic,retain) NSDate * today;

@end
