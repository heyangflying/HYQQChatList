//
//  HYGroupModel.h
//  HYQQChatList
//
//  Created by heyang on 15/8/21.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HYFriendsModel;

@interface HYGroupModel : NSObject
@property (nonatomic,copy) NSString *name; //分组名
@property (nonatomic,copy) NSString *online;//在线人数
@property (nonatomic,strong) NSArray *friends;//朋友数组
@property (nonatomic,strong) HYFriendsModel *friendModel;//单个朋友模型
@property (nonatomic,assign) BOOL isOpen;

- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)groupWithDic:(NSDictionary *)dic;

@end
