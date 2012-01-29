//
//  ELDayLogCell.h
//  eLogger
//
//  Created by Nan Fang on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELDayLogCell : UITableViewCell{
    UILabel * _titleLabel;
    UILabel * _contentLabel;
}
- (void)fitContent;

@property(nonatomic) int year;
@property(nonatomic) int month;
@property(nonatomic) int day;
@property(nonatomic, retain) NSString * content;

@property(nonatomic, readonly) int cellHeight;
@end
