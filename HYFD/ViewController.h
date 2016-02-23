//
//  ViewController.h
//  HYFD
//
//  Created by SongYanming on 16/2/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
- (IBAction)loginAction:(id)sender;
- (IBAction)forgetPasswordAction:(id)sender;


@end

