//
//  StudyViewController.m
//  TableviewTheory
//
//  Created by sy on 2018/12/23.
//  Copyright © 2018年 Casey. All rights reserved.
//

#import "StudyViewController.h"

@interface StudyViewController ()<UITableViewDelegate, UITableViewDataSource>{
    
    UITableView *_tableView;
    NSMutableArray *_cellArr;
    
}

@end

@implementation StudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Study Theory";
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 0;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    _cellArr = [NSMutableArray new];
    
}


#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [@(indexPath.row) description];
    
    BOOL isExist = NO;
    for (int i = 0; i < _cellArr.count; i++) {
        
        NSValue *value = _cellArr[i];
        UITableViewCell *tmpCell = [value nonretainedObjectValue];
        if (tmpCell == cell) {
            isExist = YES;
            break;
        }
    }
    
    if (!isExist) {
        
        NSValue *value = [NSValue valueWithNonretainedObject:cell];
        [_cellArr addObject:value];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"count::%@", @(_cellArr.count));
}


@end
