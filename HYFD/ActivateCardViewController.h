//
//  ActivateCardViewController.h
//  HYFD
//
//  Created by songyanming on 16/2/19.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivateCardViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *operatorsBtn;
- (IBAction)operatorsBtnAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property(nonatomic,assign)IBInspectable BOOL isOpen;
@property(nonatomic,strong)IBInspectable NSString *testStr;
@property(nonatomic,strong)IBInspectable UIImage *img;


@end
