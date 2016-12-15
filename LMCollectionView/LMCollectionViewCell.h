//
//  LMCollectionViewCell.h
//  LMCollectionView
//
//  Created by lqm on 16/12/1.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"

@interface LMCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contenLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (nonatomic,assign)BOOL isSelected;

-(void)UpdateCellWithState:(BOOL)select;
- (void)configView:(MyModel *)mModel;

@end
