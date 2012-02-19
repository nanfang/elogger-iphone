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

- (id)initWithYear:(int)year month:(int)month day:(int)day {
    self = [super init];
    if (self) {
        self.year=year;
        self.month=month;
        self.day=day;
    }
    return self;
}

- (NSString*) title{
    return [NSString stringWithFormat:@"%d-%02d-%02d", _year, _month, _day];
}


@end
