//
//  HYFriendCell.h
//  HYQQChatList
//
//  Created by heyang on 15/8/21.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HYFriendsModel;
@interface HYFriendCell : UITableViewCell

@property (nonatomic,strong) HYFriendsModel *model;
@property (nonatomic,strong) UIImage *iconImage;

@end
