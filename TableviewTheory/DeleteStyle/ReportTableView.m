//
//  DepositReportView.m
//  TableviewTheory
//
//  Created by Casey on 13/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

#import "ReportTableView.h"
#import "DeleteStatusView.h"
#import <objc/runtime.h>
#import "UIView+SearchView.h"


@interface ReportTableView()



@end

@implementation ReportTableView



+ (void)initialize{
    
    
    Method initMethod = class_getInstanceMethod(NSClassFromString(@"UISwipeActionPullView"), NSSelectorFromString(@"moveToOffset:extraOffset:animated:usingSpringWithStiffness:initialVelocity:"));
    
    Method targetMethod = class_getInstanceMethod([UIView class], NSSelectorFromString(@"moveToOffsetTest:extraOffset:animated:usingSpringWithStiffness:initialVelocity:"));
    
    method_exchangeImplementations(initMethod, targetMethod);
    
    
    unsigned int outCount = 0;
    Method *methods =  class_copyMethodList(NSClassFromString(@"UISwipeActionPullView"), &outCount);
    for (int i = 0; i < outCount; i++) {
        Method method = methods[i];
        NSLog(@"%@", NSStringFromSelector(method_getName(method)));
    }
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    UIView * pullview = [self searchSubViewOfClassName:@"UISwipeActionPullView"];
    
    if (pullview) {
        
        if ([self.deleteStatusView superview] == nil) {
            
            [self addSubview:self.deleteStatusView];
            
        }
        
        self.deleteStatusView.deleteStatus = _currentCellDeteteStyle;
        
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

