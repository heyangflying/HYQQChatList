//
//  HYListTVC.m
//  HYQQChatList
//
//  Created by heyang on 15/8/21.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import "HYListTVC.h"
#import "HYGroupModel.h"
#import "HYFriendCell.h"
#import "HYListHeaderView.h"
#import "HYFriendsModel.h"


@interface HYListTVC ()<HYHeaderViewDeleagte>
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation HYListTVC

- (NSArray *)dataArray{
    if(!_dataArray){
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
       
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
       
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *dic in array) {
            
            HYGroupModel *groupModel = [HYGroupModel groupWithDic:dic];
            
            [muArray addObject:groupModel];
        }
        _dataArray = [muArray copy];
    }
    return _dataArray;
}
#pragma mark - 去掉多余的线
- (void)clipExtraCellLine:(UITableView *)tableView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
}

static NSString *identifier = @"YounG";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self clipExtraCellLine:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HYFriendCell" bundle:nil] forCellReuseIdentifier:identifier];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    
   
    
    return self.dataArray.count;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    HYGroupModel *groupModel = self.dataArray[section];
    
    NSInteger count = groupModel.isOpen ? groupModel.friends.count : 0;
    
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
  
    
   
    
    HYFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if(!cell){
        
        cell = [[HYFriendCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
    }
        HYGroupModel *groupModel           = self.dataArray[indexPath.section];
        HYFriendsModel *friendModel        = groupModel.friends[indexPath.row];
    
   
        cell.model = friendModel;
    

        return cell;
    
}
#pragma mark - UITableView delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HYListHeaderView *headerView = [HYListHeaderView headerView:tableView];
    headerView.delegate = self;
    headerView.groupModel = self.dataArray[section];
   
    return headerView;
}
-(void)HYDidSelectedView
{
    [self.tableView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 40;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
