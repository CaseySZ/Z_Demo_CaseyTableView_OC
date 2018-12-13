//
//  DeleteStyleViewController.m
//  TableviewTheory
//
//  Created by Casey on 13/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

#import "DeleteStyleViewController.h"
#import "ReportTableView.h"

@interface DeleteStyleViewController ()<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet ReportTableView *_tableView;
}

@end

@implementation DeleteStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"DeleteStyle";
    self.view.backgroundColor = UIColor.whiteColor;
    _tableView.estimatedRowHeight = 0;
    
    [_tableView setEditing:NO];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [@(indexPath.row) description];
    return cell;
    
}


- (NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row%2 == 0){
        _tableView.currentCellDeteteStyle = false;
    }else{
        _tableView.currentCellDeteteStyle = true;
    }
    
    
    return @"删除";
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
    
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}


@end
