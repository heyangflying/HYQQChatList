//
//  HYFriendCell.m
//  HYQQChatList
//
//  Created by heyang on 15/8/21.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import "HYFriendsModel.h"
#import "HYFriendCell.h"


@interface HYFriendCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *netStatusLabel;


@end


@implementation HYFriendCell


-(void)setModel:(HYFriendsModel *)model
{
        _model = model;
    
    
        _headImageView.image = [UIImage imageNamed:model.icon];
        _nameLabel.text               = model.name;
        _introLabel.text          = model.intro;
    
    
    
}

- (void)awakeFromNib {
    
    
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    _headImageView.layer.cornerRadius = _headImageView.bounds.size.height / 2;
    _headImageView.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
