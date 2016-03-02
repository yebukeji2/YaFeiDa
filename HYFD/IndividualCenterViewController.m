//
//  IndividualCenterViewController.m
//  HYFD
//
//  Created by songyanming on 16/3/2.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "IndividualCenterViewController.h"
#import "IndivualCenterCell.h"
#import "cellModel.h"
@interface IndividualCenterViewController ()
@property(nonatomic,strong)NSMutableArray *datasource;

@end

@implementation IndividualCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datasource  = [[NSMutableArray alloc]initWithCapacity:0];
    NSArray *titleArr = [NSArray arrayWithObjects:@"账户设置",@"意见反馈",@"常见问题" ,nil];
    NSArray *imgNameArr = [NSArray arrayWithObjects:@"setting_icon",@"Feedback_icon",@"Question_icon" ,nil];
    for(int i=0;i<titleArr.count;i++){
        cellModel *model = [[cellModel alloc]init];
        model.title = [titleArr objectAtIndex:i];
        model.leftImg = [UIImage imageNamed:[imgNameArr objectAtIndex:i]];
        [self.datasource addObject:model];
    }
    

    // Do any additional setup after loading the view from its nib.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"IndivualCenterCell";
    IndivualCenterCell *cell = (IndivualCenterCell *)[tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[IndivualCenterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"IndivualCenterCell" owner:self options:nil];
        //这时myCell对象已经通过自定义xib文件生成了
        if ([nib count]>0) {
            cell = (IndivualCenterCell *)[nib objectAtIndex:0];
            //加判断看是否成功实例化该cell，成功的话赋给cell用来返回。
        }
    }
    cellModel *model = [self.datasource objectAtIndex:indexPath.row];
    [cell setCellData:model];
        return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
