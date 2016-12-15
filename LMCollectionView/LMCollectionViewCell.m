//
//  LMCollectionViewCell.m
//  LMCollectionView
//
//  Created by lqm on 16/12/1.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "LMCollectionViewCell.h"

@implementation LMCollectionViewCell

- (void)awakeFromNib {
    
    _bgView.userInteractionEnabled=NO;
    _bgView.layer.cornerRadius = 8;
    _bgView.layer.borderWidth = 1;
    _bgView.layer.borderColor = [UIColor redColor].CGColor;
    _bgView.layer.masksToBounds = YES;
}




-(void)UpdateCellWithState:(BOOL)select
{
    _isSelected = select;
}

-(void)configView:(MyModel *)mModel
{
    self.nameLabel.text = mModel.name;
    self.contenLabel.text = mModel.content;
}

@end
