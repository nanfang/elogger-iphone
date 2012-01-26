//
//  ELDayLog.m
//  eLogger
//
//  Created by Nan Fang on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ELDayLog.h"

@implementation ELDayLog
@synthesize year=_year, month=_month, day=_day, content=_content, owner=_owner, type=_type;

- (NSString*) title{
    return [NSString stringWithFormat:@"%d-%02d-%02d", _year, _month, _day];
}

@end
