//
//  MoreRechangeCell.m
//  HYFD
//
//  Created by songyanming on 16/3/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "MoreRechangeCell.h"

@implementation MoreRechangeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addDeleteACtion:(id)sender {
    UIButton *btn = (UIButton*)sender;
    [self.delegate ClickBtnWith:btn cell:self];

}
@end
