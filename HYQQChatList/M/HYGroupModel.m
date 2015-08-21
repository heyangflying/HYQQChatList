//
//  HYGroupModel.m
//  HYQQChatList
//
//  Created by heyang on 15/8/21.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//
#import "HYFriendsModel.h"
#import "HYGroupModel.h"

@implementation HYGroupModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            HYFriendsModel *model = [HYFriendsModel friendWithDic:dict];
            [array addObject:model];
        }
        self.friends = array;
    }
    return self;
}

+ (instancetype)groupWithDic:(NSDictionary *)dic
{
    return  [[self alloc]initWithDic:dic];
}
@end
