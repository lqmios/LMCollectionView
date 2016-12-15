//
//  MyModel.h
//  LMCollectionView
//
//  Created by lqm on 16/12/1.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *content;


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
