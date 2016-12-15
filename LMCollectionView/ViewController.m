//
//  ViewController.m
//  LMCollectionView
//
//  Created by lqm on 16/12/1.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "ViewController.h"
//#import "MYCollectionViewCell.h"
#import "MyModel.h"
#import "LMCollectionViewCell.h"

static NSString *cellID = @"cellID";
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *myCollectionView;
    LMCollectionViewCell *cell;
}
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
  _dataSource = [NSMutableArray array];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 60, Screen_width, Screen_height) collectionViewLayout:flowLayout];
    myCollectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.view addSubview:myCollectionView];
    myCollectionView.dataSource = self;
    myCollectionView.delegate = self;
//    [myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    [myCollectionView registerNib:[UINib nibWithNibName:@"LMCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellID];
    
    [self loadData];
}

#pragma mark --UICollectionViewDataSource,UICollectionViewDelegate----

#pragma mark --UICollectionViewDataSource,UICollectionViewDelegate----
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;

}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];

    [cell configView:_dataSource[indexPath.row]];
    
    if (indexPath.row == 0)
    {
        
        [collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]  animated:YES scrollPosition:UICollectionViewScrollPositionNone];
        
        cell.nameLabel.textColor = [UIColor whiteColor];
        cell.contenLabel.textColor = [UIColor whiteColor];
        cell.bgView.backgroundColor = [UIColor redColor];
        _currentSelectIndex = indexPath;
        
        
    }
    
    return cell;
}

//元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake((Screen_width - 40)/3,80);
    
}
//设置cell与边缘的间隔
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets inset = UIEdgeInsetsMake(10, 10, 10, 10);
    return inset;
}
//最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_currentSelectIndex != nil || _currentSelectIndex != indexPath) {
        cell = (LMCollectionViewCell *)[collectionView cellForItemAtIndexPath:_currentSelectIndex];
        cell.nameLabel.textColor = [UIColor blackColor];
        cell.contenLabel.textColor = [UIColor blackColor];
        cell.bgView.backgroundColor = [UIColor whiteColor];
    }
    
    cell = (LMCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell UpdateCellWithState:!cell.isSelected];
    _currentSelectIndex = indexPath;
    cell.nameLabel.textColor = [UIColor whiteColor];
    cell.contenLabel.textColor = [UIColor whiteColor];
    cell.bgView.backgroundColor = [UIColor redColor];
    
    NSLog(@"选择商品");


}


-(void)loadData
{
    
    NSArray *array = @[@{@"Name":@"测试数据1",@"Content":@"内容1"},@{@"Name":@"测试数据2",@"Content":@"内容2"},@{@"Name":@"测试数据3",@"Content":@"内容3"},@{@"Name":@"测试数据4",@"Content":@"内容4"},@{@"Name":@"测试数据5",@"Content":@"内容5"}];
    for (NSDictionary *dic in array)
    {
        MyModel *myModel = [[MyModel alloc]initWithDictionary:dic];
        [self.dataSource addObject:myModel];
    }
    [myCollectionView reloadData];
    
    
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end





























