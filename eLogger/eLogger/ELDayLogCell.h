//
//  ELDayLogCell.h
//  eLogger
//
//  Created by Nan Fang on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELDayLog.h"

@interface ELDayLogCell : UITableViewCell{
    UILabel * _titleLabel;
    UILabel * _contentLabel;
}
- (void)fitContent;


@property(nonatomic, retain) ELDayLog * dayLog;
@property(nonatomic, readonly) int cellHeight;
@end
