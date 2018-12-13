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



@interface ReportTableView()

@property (nonatomic,strong)DeleteStatusView *deleteStatusView;

@end

@implementation ReportTableView



+ (void)initialize{
    
    
    Method initMethod = class_getInstanceMethod(NSClassFromString(@"UISwipeActionPullView"), NSSelectorFromString(@"moveToOffset:extraOffset:animated:usingSpringWithStiffness:initialVelocity:"));
    
    Method targetMethod = class_getInstanceMethod([UIView class], @selector(moveToOffsetTest:extraOffset:animated:usingSpringWithStiffness:initialVelocity:));
    
    method_exchangeImplementations(initMethod, targetMethod);
    
    
    int outCount = 0;
    Method *methods =  class_copyMethodList(NSClassFromString(@"UISwipeActionPullView"), &outCount);
    for (int i = 0; i < outCount; i++) {
        Method method = methods[i];
        NSLog(@"%s", method_getName(method));
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



@implementation UIView (SearchView)

- (UIView*)searchSubViewOfClassName:(NSString*)className{
    
    
    NSArray *subViews = self.subviews;
    for (int i = 0; i < subViews.count; i++) {
        
        UIView *view = subViews[i];
        if ([view isKindOfClass:NSClassFromString(className)]) {
            return view;
        }
    }
    return nil;
    
}

- (void)moveToOffsetTest:(CGPoint)Offset extraOffset:(CGPoint)extraOffset animated:(BOOL)animated usingSpringWithStiffness:(BOOL)usingSpringWithStiffness initialVelocity:(BOOL)initialVelocity {
    
    NSLog(@"moveToOffsetTest");
    self.hidden = YES;
    [self moveToOffsetTest:Offset extraOffset:extraOffset animated:animated usingSpringWithStiffness:usingSpringWithStiffness initialVelocity:initialVelocity];
    
    ReportTableView *tableview = (ReportTableView*)[self searchSuperViewOfClassName:@"ReportTableView"];
    if (tableview) {
        tableview.deleteStatusView.frame = self.frame;
    }
    
}

- (UIView*)searchSuperViewOfClassName:(NSString*)className{
    
    if ([self isKindOfClass:NSClassFromString(className)]){
        return self;
    }
    if (self.superview == nil){
        
        return nil;
    }
    return [self.superview searchSuperViewOfClassName:className];
}



@end
