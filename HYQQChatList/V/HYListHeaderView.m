//
//  HYListHeaderView.m
//  HYQQChatList
//
//  Created by heyang on 15/8/21.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//
#import "HYGroupModel.h"

#import "HYListHeaderView.h"

@interface HYListHeaderView ()

@property (nonatomic,strong) UIButton *arrowButton;
@property (nonatomic,strong) UILabel *lineLabel;

@end


@implementation HYListHeaderView

+ (instancetype)headerView:(UITableView *)tableView
{
    static NSString *identifier = @"young";
    HYListHeaderView *headerView = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!headerView){
        headerView = [[HYListHeaderView alloc]initWithResuseIdentifier:identifier];
    }
    return headerView;
}
- (instancetype)initWithResuseIdentifier:(NSString *)resuseIdentifier{
    
    if(self = [super init]){
        
        // 分组栏按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [btn setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"header_bg_highlighted"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        btn.imageView.contentMode = UIViewContentModeCenter;
        [btn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        btn.imageView.clipsToBounds = NO;
        _arrowButton = btn;
        [self addSubview:self.arrowButton];
        
        //显示在线人数
        UILabel *lineLabel = [[UILabel alloc]init];
        lineLabel.font = [UIFont systemFontOfSize:13.0];
        lineLabel.textAlignment = NSTextAlignmentCenter;
        _lineLabel = lineLabel;
        [self addSubview:self.lineLabel];
        
    }
    return self;
}

- (void)buttonAction{
    
    self.groupModel.isOpen = !self.groupModel.isOpen;
    if([self.delegate respondsToSelector:@selector(HYDidSelectedView)]){
        [self.delegate HYDidSelectedView];
    }
}
-(void)didMoveToSuperview{
    _arrowButton.imageView.transform = self.groupModel.isOpen ? CGAffineTransformMakeRotation(M_PI_2) :CGAffineTransformMakeRotation(0);
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    _arrowButton.frame = self.bounds;
    _lineLabel.frame = CGRectMake(self.frame.size.width - 70, 0, 60, self.frame.size.height);
}

- (void)setGroupModel:(HYGroupModel *)groupModel
{
    _groupModel = groupModel;
    [_arrowButton setTitle:_groupModel.name forState:UIControlStateNormal];
    _lineLabel.text = [NSString stringWithFormat:@"%@/%u",_groupModel.online,_groupModel.friends.count];
    
}

@end
