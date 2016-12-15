//
//  MyModel.m
//  LMCollectionView
//
//  Created by lqm on 16/12/1.
//  Copyright © 2016年 LQM. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        [self setValuesForKeysWithDictionary:dictionary];
        
        
    }
    return self;
}

@end
