//
//  DepositReportView.h
//  TableviewTheory
//
//  Created by Casey on 13/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReportTableView : UITableView


@property (nonatomic, assign)BOOL currentCellDeteteStyle;

@end


@interface UIView (SearchView)

- (UIView*)searchSubViewOfClassName:(NSString*)className;
- (UIView*)searchSuperViewOfClassName:(NSString*)className;

@end


NS_ASSUME_NONNULL_END
