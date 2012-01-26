//
//  ELDayLog.h
//  eLogger
//
//  Created by Nan Fang on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    DAY_LOG=0,
} LOG_TYPE;

@interface ELDayLog : NSObject

@property(nonatomic) int year;
@property(nonatomic) int month;
@property(nonatomic) int day;

@property(nonatomic, retain) NSString *content;
@property(nonatomic, retain) NSString *owner;
@property(nonatomic) LOG_TYPE type;


@property(nonatomic, readonly) NSString* title;

//+(NSArray*) logOfMonth:(int)month year:(int)year owner:(NSString*)owner;

@end
