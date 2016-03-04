//
//  QueryCell.m
//  HYFD
//
//  Created by songyanming on 16/3/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "QueryCell.h"

@implementation QueryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCellData:(QueryModel*)model{
    self.dateLabel.text = model.date;
    self.telLabel.text = model.tel;
    self.operationLabel.text = model.operation;
    if(model.state == 0){
        self.stateLabel.text =@"否";
 
    }else{
        self.stateLabel.text = @"是";
    }
}

@end
