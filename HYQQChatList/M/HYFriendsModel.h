//
//  HYFriendsModel.h
//  HYQQChatList
//
//  Created by heyang on 15/8/21.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYFriendsModel : NSObject

@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *intro;
@property (nonatomic,assign) BOOL isVip;


- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)friendWithDic:(NSDictionary *)dic;

@end
