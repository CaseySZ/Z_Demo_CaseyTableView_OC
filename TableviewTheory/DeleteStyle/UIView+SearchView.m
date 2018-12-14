//
//  UIView+SearchView.m
//  TableviewTheory
//
//  Created by Casey on 14/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

#import "UIView+SearchView.h"
#import "ReportTableView.h"

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
