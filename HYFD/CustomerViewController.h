//
//  CustomerViewController.h
//  HYFD
//
//  Created by SongYanming on 16/3/6.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerViewController : UIViewController
- (IBAction)segAction:(id)sender;

@property (strong, nonatomic) IBOutlet UISegmentedControl *seg;
@end
