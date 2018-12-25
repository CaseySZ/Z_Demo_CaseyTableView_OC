//
//  TestTableView.m
//  TableViewClass
//
//  Created by sy on 2018/7/6.
//  Copyright © 2018年 sy. All rights reserved.
//

#import "HeadSuspendTableView.h"

@implementation HeadSuspendTableView



- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (self.contentOffset.y > 800) {
        self.oneHeadView.frame = CGRectMake(0, self.contentOffset.y, self.oneHeadView.frame.size.width, self.oneHeadView.frame.size.height);
        if (![self.oneHeadView superview]) {
            [self addSubview:self.oneHeadView];
        }
        self.twoHeadView.frame = CGRectMake(0, CGRectGetMaxY(self.oneHeadView.frame), self.twoHeadView.frame.size.width, self.twoHeadView.frame.size.height);
    }
    
}


@end
