//
//  XLMaskView.m
//  ScanDownload
//
//  Created by xie liang on 12-6-15.
//  Copyright (c) 2012年 pretang. All rights reserved.
//

#import "XLMaskView.h"

@implementation XLMaskView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.bounds];
        bgView.image = [UIImage imageNamed:@"mask.png"];
        [self addSubview:bgView];
        [bgView release];
        
        UIImageView *barView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 480-44, 320, 44)];
        barView.image = [UIImage imageNamed:@"bar_bg.png"];
        [self addSubview:barView];
        [barView release];
    }
    return self;
}

- (id)init
{
    return [self initWithFrame:CGRectMake(0, 0, 320, 480)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
