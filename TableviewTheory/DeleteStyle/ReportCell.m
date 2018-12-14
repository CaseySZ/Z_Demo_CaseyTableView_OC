//
//  ReportCell.m
//  TableviewTheory
//
//  Created by Casey on 14/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

#import "ReportCell.h"
#import "UIView+SearchView.h"

@implementation ReportCell{
    
    UIButton *_editButton;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    UIView *view = [self searchSubViewOfClassName:@"UITableViewCellEditControl"];
    
    if (view) {
        
        view.hidden = YES;
        self.editButton.hidden = NO;
        
        [self.editButton removeFromSuperview];
        self.editButton.frame = view.frame;
        [self addSubview:self.editButton];
        
    }else {
        
        self.editButton.hidden = YES;
    }
    
}


- (UIButton*)editButton{
    
    if (_editButton == nil){
        _editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_editButton setTitle:@"新的Style" forState:UIControlStateNormal];
        _editButton.titleLabel.numberOfLines = 0;
        [_editButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    }
    
    return _editButton;
    
}

@end
