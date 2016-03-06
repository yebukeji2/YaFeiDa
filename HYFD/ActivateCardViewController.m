//
//  ActivateCardViewController.m
//  HYFD
//
//  Created by songyanming on 16/2/19.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "ActivateCardViewController.h"
#import "TableViewWithBlock.h"
#import "SelectionCell.h"
#import "MLTableAlert.h"


@interface ActivateCardViewController ()
@property(nonatomic,strong)TableViewWithBlock *mTableV_name;
@property(nonatomic,strong)MLTableAlert *alert;
@property(nonatomic,strong)UIButton *rightBtn;
@end
IBInspectable
@implementation ActivateCardViewController
-(void)rightViewAction:(id)sender{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn setImage:[UIImage imageNamed:@"saomiao_icon"] forState:UIControlStateNormal];

    [self.rightBtn addTarget:self action:@selector(rightViewAction:) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn.frame = CGRectMake(0, 0, 32, 32);
    self.simTF.rightView = self.rightBtn;
    self.simTF.rightViewMode=UITextFieldViewModeAlways;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigation_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(leftItemAction:)];


}
-(void)leftItemAction:(id)sender{
    
}
-(void)setUp{
    __weak ActivateCardViewController *weakSelf = self;
    self.mTableV_name = [[TableViewWithBlock alloc]initWithFrame:CGRectMake(100, 100, 200, 0)];
    [self.mTableV_name initTableViewDataSourceAndDelegate:^NSInteger(UITableView *tableView,NSInteger section){
        return 10;
    } setCellForIndexPathBlock:^(UITableView *tableView,NSIndexPath *indexPath){
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SelectionCell"];
        if (!cell) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SelectionCell"];
            //cell.frame = CGRectMake(0, 0, 100, 25);
            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        return cell;
    } setDidSelectRowBlock:^(UITableView *tableView,NSIndexPath *indexPath){
        [UIView animateWithDuration:0.3 animations:^{
            SelectionCell *cell = (SelectionCell*)[tableView cellForRowAtIndexPath:indexPath];
            [self.operatorsBtn setTitle:cell.textLabel.text forState:UIControlStateNormal];
            weakSelf.mTableV_name.frame =  CGRectMake(100, 100, 200, 0);
            weakSelf.isOpen = NO;
            
        } completion:^(BOOL finished){
            
        }];
    }];
    
    [self.mTableV_name.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.mTableV_name.layer setBorderWidth:1];
    [self.view addSubview:self.mTableV_name];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)operatorsBtnAction:(id)sender {
    self.alert = [MLTableAlert tableAlertWithTitle:@"请选择运营商" cancelButtonTitle:@"" numberOfRows:^NSInteger (NSInteger section)
                  {
                      
                      
                      return 10;
                  }
                                          andCells:^UITableViewCell* (MLTableAlert *anAlert, NSIndexPath *indexPath)
                  {
                      static NSString *CellIdentifier = @"CellIdentifier";
                      UITableViewCell *cell = [anAlert.table dequeueReusableCellWithIdentifier:CellIdentifier];
                      if (cell == nil)
                          cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                      cell.imageView.image = [UIImage imageNamed:@"setting_icon"];

                      cell.textLabel.text = @"山东移动";
                      return cell;
                  }];
    self.alert.height = 500;
    [self.alert configureSelectionBlock:^(NSIndexPath *selectedIndex){
        [self.operatorsBtn setTitle:@"山东移动" forState:UIControlStateNormal];
        
    } andCompletionBlock:^{
        
        
        
        
    }];
    
    [self.scrollview addSubview:self.alert];
    [self.alert show];
    if(self.isOpen == YES)
    {
        self.mTableV_name.frame =  CGRectMake(100,100, 100, 0);
        self.isOpen = NO;
    }
    else
    {

        self.mTableV_name.frame =  CGRectMake(100,100, 200, 500);
        self.isOpen = YES;
    }
}
@end
