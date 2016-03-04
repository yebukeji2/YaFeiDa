//
//  QueryCell.h
//  HYFD
//
//  Created by songyanming on 16/3/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QueryModel.h"

@interface QueryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UILabel *operationLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
-(void)setCellData:(QueryModel*)model;

@end
