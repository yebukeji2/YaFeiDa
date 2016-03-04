//
//  HomeViewController.h
//  HYFD
//
//  Created by songyanming on 16/2/18.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *DetailBtnAction;
- (IBAction)AllBtnAction:(id)sender;
- (IBAction)myBtnAction:(id)sender;

@end
