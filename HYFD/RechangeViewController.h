//
//  RechangeViewController.h
//  HYFD
//
//  Created by SongYanming on 16/2/16.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RechangeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UITextField *cutPriceTF;
@property (weak, nonatomic) IBOutlet UILabel *actualPriceLabel;
- (IBAction)RechangeBtnaction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *phoneNoTF;

@end
