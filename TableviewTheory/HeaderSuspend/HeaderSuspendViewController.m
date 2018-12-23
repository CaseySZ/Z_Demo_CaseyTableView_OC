//
//  HeaderSuspendViewController.m
//  TableviewTheory
//
//  Created by Casey on 13/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

#import "HeaderSuspendViewController.h"
#import "HeadSuspendTableView.h"

@interface HeaderSuspendViewController ()<UITableViewDataSource, UITableViewDelegate>{
    
     HeadSuspendTableView *_tableView;
    
    UIView *_oneHeadView;
    UIView *_towHeadView;
    
    
}

@end

@implementation HeaderSuspendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"HeaderSuspend";
    self.view.backgroundColor = UIColor.whiteColor;
    
    _tableView = [[HeadSuspendTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 0;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    
}

#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 如果是动态的高度，最好把高度保存起来， 直接拿高度值
    return 100;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        if (!_oneHeadView) {
            _oneHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
            _oneHeadView.backgroundColor = [UIColor blueColor];
            _tableView.oneHeadView = _oneHeadView;
        }
        
        return _oneHeadView;
    }
    
    if (section == 1) {
        if (!_towHeadView) {
            _towHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
            _towHeadView.backgroundColor = [UIColor redColor];
            _tableView.twoHeadView = _towHeadView;
        }
        
        return _towHeadView;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [@(indexPath.row) description];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


@end
