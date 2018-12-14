//
//  ReportTestTableView.h
//  TableviewTheory
//
//  Created by Casey on 14/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeleteStatusView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReportTestTableView : UITableView

@property (nonatomic,strong)DeleteStatusView *deleteStatusView;
@property (nonatomic, assign)BOOL currentCellDeteteStyle;

@end

NS_ASSUME_NONNULL_END
