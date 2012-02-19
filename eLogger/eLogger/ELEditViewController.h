//
//  ELEditViewController.h
//  eLogger
//
//  Created by Nan Fang on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELDayLog.h"

@interface ELEditViewController : UIViewController{
    UITextView * _logEditView;
    UILabel * _titleLabel;
    
}
@property(nonatomic, retain) ELDayLog * dayLog;
@property(nonatomic, assign) id delegate;
@property(nonatomic, retain) NSIndexPath *indexPath;
@end
