//
//  MoreRechangeViewController.h
//  HYFD
//
//  Created by songyanming on 16/3/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreRechangeCell.h"

@interface MoreRechangeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,addDeleteDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UITextField *cutPriceTF;
@property (weak, nonatomic) IBOutlet UILabel *actualPriceLabel;
- (IBAction)RechangeBtnaction:(id)sender;
@property(nonatomic,assign)BOOL Flag;
@property(nonatomic,strong)NSMutableArray *datasource;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableviewHeight;

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
