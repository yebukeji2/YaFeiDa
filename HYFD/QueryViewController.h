//
//  QueryViewController.h
//  HYFD
//
//  Created by songyanming on 16/3/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QueryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *sectionVIew;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seg;
- (IBAction)segAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *operationLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end
