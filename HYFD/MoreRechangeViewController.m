//
//  MoreRechangeViewController.m
//  HYFD
//
//  Created by songyanming on 16/3/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "MoreRechangeViewController.h"
#import "MoreRechangeCell.h"
#import "RechargeCollectionViewCell.h"

@interface MoreRechangeViewController ()
@property(nonatomic,strong)NSArray *numArr;
@property(nonatomic,assign)NSUInteger cellNum;

@end

@implementation MoreRechangeViewController
-(void)updateViewConstraints
{
    [super updateViewConstraints];

    self.tableviewHeight.constant = self.cellNum*35;
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellNum;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"MoreRechangeCell";
    MoreRechangeCell *cell = (MoreRechangeCell *)[tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[MoreRechangeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MoreRechangeCell" owner:self options:nil];
        //这时myCell对象已经通过自定义xib文件生成了
        if ([nib count]>0) {
            cell = (MoreRechangeCell *)[nib objectAtIndex:0];
            //加判断看是否成功实例化该cell，成功的话赋给cell用来返回。
        }
    }
    if(indexPath.row == self.cellNum-1){
        [cell.addDeleteBtn setImage:[UIImage imageNamed:@"addTel"] forState:UIControlStateNormal];

    }
    else{
        [cell.addDeleteBtn setImage:[UIImage imageNamed:@"close_icon"] forState:UIControlStateNormal];
    }
//    if(self.datasource.count == 0){
//        [self.datasource addObject:cell];
//    }
    cell.tag = indexPath.row;
    cell.delegate = self;

    return cell;
}
-(void)ClickBtnWith:(UIButton *)btn cell:(MoreRechangeCell *) cell{
    if(cell.tag == self.cellNum-1){
        self.cellNum++;

    }else{
        self.cellNum--;
        NSIndexPath *index = [NSIndexPath indexPathForRow:cell.tag inSection:0];
        [self.tableview deleteRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationLeft];
    }
    
    [self.tableview reloadData];
    [self updateViewConstraints];
    
}
-(void)rightItemAction:(id)sender{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"time_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(rightItemAction:)];
    self.cellNum = 1;
    self.datasource = [[NSMutableArray alloc]initWithCapacity:0];
    self.numArr = [NSArray arrayWithObjects:@"10",@"20",@"30",@"50",@"100",@"200",@"300",@"500", nil];
    [self.collectionView registerNib:[UINib nibWithNibName:@"RechargeCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:@"RechargeCollectionViewCell"];
    // Do any additional setup after loading the view from its nib.
}
//每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section{
    
    return self.numArr.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RechargeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RechargeCollectionViewCell" forIndexPath:indexPath];
    cell.numLabel.text = [self.numArr objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    RechargeCollectionViewCell *cell = (RechargeCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    if([cell.imgV.image isEqual:[UIImage imageNamed:@"not_select_gray"]]){
        cell.imgV.image = [UIImage imageNamed:@"select_yellow"];

        
    }
    else{
        
    }
    int num =[[self.numArr objectAtIndex:indexPath.row]intValue];
    int cutPrice = num*0.95;
    self.cutPriceTF.text = [NSString stringWithFormat:@"%d",cutPrice];
    self.actualPriceLabel.text = [self.numArr objectAtIndex:indexPath.row];
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    RechargeCollectionViewCell *cell = (RechargeCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    if([cell.imgV.image isEqual:[UIImage imageNamed:@"not_select_gray"]]){

        
        
    }
    else{
        cell.imgV.image = [UIImage imageNamed:@"not_select_gray"];
        
    }
}

//每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(110, 32);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 13, 0,13);
}
//cell的最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}
//cell的最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
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
