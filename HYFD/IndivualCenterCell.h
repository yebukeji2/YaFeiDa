//
//  IndivualCenterCell.h
//  HYFD
//
//  Created by songyanming on 16/3/2.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cellModel.h"

@interface IndivualCenterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftImgV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
-(void)setCellData:(cellModel*)model;
@end
