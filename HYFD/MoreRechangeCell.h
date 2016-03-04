//
//  MoreRechangeCell.h
//  HYFD
//
//  Created by songyanming on 16/3/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol addDeleteDelegate;

@interface MoreRechangeCell : UITableViewCell

@property (weak,nonatomic) id<addDeleteDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *addDeleteBtn;

- (IBAction)addDeleteACtion:(id)sender;

@end
@protocol addDeleteDelegate <NSObject>

-(void)ClickBtnWith:(UIButton *)btn cell:(MoreRechangeCell *) cell;
@end
