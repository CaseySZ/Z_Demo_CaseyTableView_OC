//
//  TheoryViewController.m
//  TableviewTheory
//
//  Created by Casey on 13/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

#import "TheoryViewController.h"
#import "EOCTableView.h"

@interface TheoryViewController ()<EOCTableViewDelegate>{
    
    EOCTableView *_tableView;
}

@end

@implementation TheoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"Theory";
    self.view.backgroundColor = UIColor.whiteColor;
    _tableView = [[EOCTableView alloc] init];
    _tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _tableView.delegate = self;
    [_tableView reloadData];
    [self.view addSubview:_tableView];
    
    
}



#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [@(indexPath.row) description];
    
    if (indexPath.row%2) {
        cell.backgroundColor = [UIColor redColor];
    }else{
        cell.backgroundColor = [UIColor blueColor];
    }
    
    return cell;
    
}



@end
