//
//  HYListHeaderView.h
//  HYQQChatList
//
//  Created by heyang on 15/8/21.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYGroupModel;

@protocol HYHeaderViewDeleagte <NSObject>

- (void)HYDidSelectedView;

@end

@interface HYListHeaderView : UITableViewHeaderFooterView


@property (nonatomic,strong) HYGroupModel *groupModel;
@property (nonatomic,weak  ) id <HYHeaderViewDeleagte>delegate;

+ (instancetype)headerView:(UITableView *)tableView;

@end
