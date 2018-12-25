//
//  EOCTableView.m
//  TableViewClass
//
//  Created by sy on 2018/7/6.
//  Copyright © 2018年 sy. All rights reserved.
//

#import "EOCTableView.h"
#import "EOCCellModel.h"
/*
 重用机制，重用的是UI
 */
@implementation EOCTableView{
    
    NSMutableArray *_cellPosArr;
    NSMutableArray *_reusePoolArr; // 重用池
    NSMutableDictionary *_visiblePoolDict; // 现有池
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _cellPosArr = [NSMutableArray new];
        _reusePoolArr = [NSMutableArray new];
        _visiblePoolDict = [NSMutableDictionary dictionary];
        
    }
    return self;
    
}

- (void)reloadData{
    
    // 1 数据处理 (1.1 计算每一个cell的位置和高度，并保存起来； 1.2然后统计处tableview的content高度)
    [self dataHandle];
    
    // 2 UI 处理 （2.1 晓得了每个cell的位置了， 显示当前界面需要显示的cell， 不需要的cell移除界面（））
    [self setNeedsLayout];
}


- (void)dataHandle{
    
    // 1.1 拿到cell的数量模型
    NSInteger cellCount = [self.delegate tableView:self numberOfRowsInSection:0];
    CGFloat startY = 0;
    for (int i = 0; i < cellCount; i++) {
         // 1.2 拿到每个cell的高度
        NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:0];
        CGFloat cellHeight = [self.delegate tableView:self heightForRowAtIndexPath:path];
        
        EOCCellModel *model = [EOCCellModel new];
        model.y = startY;
        model.height = cellHeight;
        
        startY += cellHeight;
        
        [_cellPosArr addObject:model];
    }
    
    [self setContentSize:CGSizeMake(self.frame.size.width, startY)];
    
    
}


// 2 UI处理
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    // 2.1 计算出可视范围 （起始位置和结束位置）
    
    CGFloat startY = self.contentOffset.y;
    CGFloat endY = self.contentOffset.y + self.frame.size.height;
    if(startY < 0){
        startY = 0;
    }
    if (endY > self.contentSize.height) {
        endY = self.contentSize.height;
    }
    
    // 2.2 计算索引（开始和结束）
    NSInteger startIndex = [self binarySerchOC:_cellPosArr target:startY];
    NSInteger endIndex = [self binarySerchOC:_cellPosArr target:endY];
    
//    for (int i = 0; i < _cellPosArr.count; i++) {
//
//        EOCCellModel *model = _cellPosArr[i];
//        if(startY >= model.y && startY < model.y + model.height){
//
//            startIndex = i; // 找到界面上显示起始端的cell  的索引
//            break;
//        }
//    }
//
//    for (int i = 0; i < _cellPosArr.count; i++) {
//
//        EOCCellModel *model = _cellPosArr[i];
//        if(endY > model.y && endY <= model.y + model.height){
//
//            endIndex = i; // 找到界面上显示最末端的cell  的索引
//            break;
//        }
//    }
    
    // 2.3 显示cell (06:18)
    for(NSInteger i = startIndex; i <= endIndex; i++){
        
        // 2.3.1 获取cell
        NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [self.delegate tableView:self cellForRowAtIndexPath:path];
        
        EOCCellModel *model = _cellPosArr[i];
        
        // 2.3.2 对frame赋值
        cell.frame = CGRectMake(0, model.y, self.frame.size.width, model.height);
        
        if (![cell superview]) {
            [self addSubview:cell];
        }
        
    }
    
    // 4 数据清理
    // 4.1 从现有池里面移走不在界面上的cell， 并移到重用池里（把不在可视区域的cell移动到重用池）
    NSArray *visibleCellKey = _visiblePoolDict.allKeys;
    for (int i = 0; i < visibleCellKey.count; i++) {
        
        NSInteger index = [visibleCellKey[i] integerValue];
        if (index < startIndex || index > endIndex) { // 不在索引范围之间（startIndex -endIndex），就不在可视区域
            [_reusePoolArr addObject:_visiblePoolDict[visibleCellKey[i]]];
            [_visiblePoolDict removeObjectForKey:visibleCellKey[i]];
        }
    }
    
}


// 3重用机制
- (__kindof UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    
    //3.1 当前索引的cell是否在现有池里
    UITableViewCell *cell = _visiblePoolDict[@(indexPath.row)];
    if (!cell) {
        
        //3.2 如果没有cell，，从重用池中取
        if(_reusePoolArr.count > 0){
            cell = _reusePoolArr.firstObject; // 从重用池中取
            
        }else{
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];//  alloc 一个cell对象
        }
        
        //
        [_reusePoolArr removeObject:cell];// 移出重用池
        [_visiblePoolDict setObject:cell forKey:@(indexPath.row)];// 存入现有池
       
    }
    
    return cell;
}

// 优化 二分算法  1024*2*2 = 4096 = 2的12次方 (数组有序)
/*
 1024
 512  512
      256 256
          128 128
          。。。。。。
           2    2
 
 */
- (NSInteger)binarySerchOC:(NSArray*)dataAry target:(CGFloat)targetY{
    
    NSInteger min = 0;
    NSInteger max = dataAry.count - 1;
    NSInteger mid;
    while (min < max) {
        mid = min + (max - min)/2;
        // 条件判断
        EOCCellModel *midModel = dataAry[mid];
        if (midModel.y < targetY && midModel.y + midModel.height > targetY) {
            return mid;
        }else if(targetY < midModel.y){
            max = mid;// 在左边
            if (max - min == 1) {
                return min;
            }
        }else {
            min = mid;// 在右边
            if (max - min == 1) {
                return max;
            }
        }
    }
    return -1;
}



@end
