//
//  IndivualCenterCell.m
//  HYFD
//
//  Created by songyanming on 16/3/2.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "IndivualCenterCell.h"

@implementation IndivualCenterCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setCellData:(cellModel*)model{
    self.nameLabel.text = model.title;
    self.leftImgV.image = model.leftImg;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
