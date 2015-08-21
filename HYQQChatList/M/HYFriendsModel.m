//
//  HYFriendsModel.m
//  HYQQChatList
//
//  Created by heyang on 15/8/21.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import "HYFriendsModel.h"

@implementation HYFriendsModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)friendWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}
@end
