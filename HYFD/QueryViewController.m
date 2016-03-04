//
//  QueryViewController.m
//  HYFD
//
//  Created by songyanming on 16/3/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "QueryViewController.h"
#import "QueryModel.h"
#import "QueryCell.h"

@interface QueryViewController ()
@property(nonatomic,strong)NSMutableArray *datasource;

@end

@implementation QueryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView =self.seg;
    self.datasource = [[NSMutableArray alloc]initWithCapacity:0];
    for(int i=0;i<10;i++){
        QueryModel *model = [[QueryModel alloc]init];
        model.date = @"2016-03-04";
        model.tel = @"18869688888";
        model.operation = @"开卡";
        model.state  = 1;
        [self.datasource addObject:model];
    }
    // Do any additional setup after loading the view from its nib.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
    
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return self.sectionVIew;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"QueryCell";
    QueryCell *cell = (QueryCell *)[tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[QueryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"QueryCell" owner:self options:nil];
        //这时myCell对象已经通过自定义xib文件生成了
        if ([nib count]>0) {
            cell = (QueryCell *)[nib objectAtIndex:0];
            //加判断看是否成功实例化该cell，成功的话赋给cell用来返回。
        }
    }
    QueryModel *model = [self.datasource objectAtIndex:indexPath.row];
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

- (IBAction)segAction:(id)sender {
    UISegmentedControl *seg = sender;
    if(seg.selectedSegmentIndex == 0){
        self.operationLabel.text = @"操作";
        self.stateLabel.text = @"状态";
        
    }
    else
    {
        self.operationLabel.text = @"话费";
        self.stateLabel.text = @"流量";
    }
}
@end
