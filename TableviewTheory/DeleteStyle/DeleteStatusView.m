//
//  DeleteStatusView.m
//  TableviewTheory
//
//  Created by Casey on 13/12/2018.
//  Copyright © 2018 Casey. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "DeleteStatusView.h"

@implementation DeleteStatusView{
    
    UIButton *_button;
    
    
}


- (void)setDeleteStatus:(BOOL)deleteStatus{
    
    if (deleteStatus) {
        
        [_button setTitle:@"删除" forState:UIControlStateNormal];
        [_button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _button.backgroundColor = UIColorFromRGB(0xFB2464);
        
    }else{
        
        [_button setTitle:@"不可\n删除" forState:UIControlStateNormal];
        [_button setTitleColor:UIColorFromRGB(0x888888) forState:UIControlStateNormal];
        _button.backgroundColor = UIColorFromRGB(0x2A2E32);
    }
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _button.layer.cornerRadius = 5;
        _button.titleLabel.font = [UIFont systemFontOfSize:14];
        _button.titleLabel.numberOfLines = 0;
        
        [self addSubview:_button];
    }
    
    return self;
    
}


@end
