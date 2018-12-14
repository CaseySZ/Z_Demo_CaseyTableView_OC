//
//  ReportTestTableView.m
//  TableviewTheory
//
//  Created by Casey on 14/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

#import "ReportTestTableView.h"
#import "DeleteStatusView.h"
#import "UIView+SearchView.h"
#import <objc/runtime.h>

@interface ReportTestTableView()

@end

@implementation ReportTestTableView



// 或者通过尝试交换 UISwipeActionPullView的layoutSubviews的方式，也是有bug的

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    UIView * pullview = [self searchSubViewOfClassName:@"UISwipeActionPullView"];
    
    if (pullview) {
        
        if ([self.deleteStatusView superview] == nil) {
            
            [self addSubview:self.deleteStatusView];
            
        }
        
        self.deleteStatusView.deleteStatus = _currentCellDeteteStyle;
        
        pullview.hidden = YES;
        self.deleteStatusView.frame = pullview.frame;
    }
    
}






- (DeleteStatusView*)deleteStatusView{
    
    if (_deleteStatusView == nil){
        
        _deleteStatusView = [DeleteStatusView new];
        _deleteStatusView.backgroundColor = UIColor.clearColor;
    }
    
    return _deleteStatusView;
    
}





@end

