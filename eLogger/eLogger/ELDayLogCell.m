//
//  ELDayLogCell.m
//  eLogger
//
//  Created by Nan Fang on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ELDayLogCell.h"

@implementation ELDayLogCell
@synthesize dayLog=_dayLog;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _titleLabel = [[[UILabel alloc]initWithFrame:CGRectMake(20, 5, 100, 20)]autorelease];
        _titleLabel.backgroundColor = [UIColor clearColor]; 
        
        
        _contentLabel = [[[UILabel alloc]initWithFrame:CGRectMake(20, 30, 280, 0)]autorelease];
        _contentLabel.backgroundColor = [UIColor clearColor];         
        _contentLabel.lineBreakMode = UILineBreakModeWordWrap;
        _contentLabel.numberOfLines = 0;

        

        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_contentLabel];
        

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)dealloc {
    self.dayLog = nil;
    [super dealloc];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _titleLabel.text = _dayLog.title;
    [self fitContent];
    CGRect cellFrame = [self frame];
    cellFrame.size.height = self.cellHeight; 
    self.frame = cellFrame;
}

- (int)cellHeight
{
    return _contentLabel.frame.size.height + 50;
}

- (void)fitContent
{
    _contentLabel.text = _dayLog.content;
    CGRect labelFrame = _contentLabel.frame;
    labelFrame.size.width = 280;
    _contentLabel.frame = labelFrame;
    [_contentLabel sizeToFit];
}

@end
