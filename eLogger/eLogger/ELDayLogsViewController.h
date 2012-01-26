//
//  ELDayLogsViewController.h
//  eLogger
//
//  Created by Nan Fang on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELDayLogsDataSource.h"

@interface ELDayLogsViewController : UIViewController{
    UIView * _headView;
    UIView * _tailView;
    UITableView * _tableView;
    ELDayLogsDataSource * _dayLogsData;
}

@end
