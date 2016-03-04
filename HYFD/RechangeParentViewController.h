//
//  RechangeParentViewController.h
//  HYFD
//
//  Created by songyanming on 16/3/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RechangeViewController.h"
#import "MoreRechangeViewController.h"

@interface RechangeParentViewController : UIViewController
@property(nonatomic,strong)RechangeViewController *child1;
@property(nonatomic,strong)MoreRechangeViewController *child2;
- (IBAction)segAction:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seg;
@end
