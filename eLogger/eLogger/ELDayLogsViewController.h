//
//  ELDayLogsViewController.h
//  eLogger
//
//  Created by Nan Fang on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ELDayLogsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    UIView * _headView;
    UIView * _tailView;
    UITableView * _tableView;

    
    NSMutableDictionary * _dayLogs;
    NSMutableArray * _loadedMonths;
    NSMutableDictionary * _monthDays;
    NSDate * _today;
}

@end
