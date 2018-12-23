//
//  EOCTableView.h
//  TableViewClass
//
//  Created by sy on 2018/7/6.
//  Copyright © 2018年 sy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EOCTableView;

@protocol EOCTableViewDelegate


- (NSInteger)tableView:(EOCTableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (CGFloat)tableView:(EOCTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)tableView:(EOCTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface EOCTableView : UIScrollView


@property (nonatomic, weak)id<EOCTableViewDelegate>delegate;


- (void)reloadData;
- (__kindof UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

@end
