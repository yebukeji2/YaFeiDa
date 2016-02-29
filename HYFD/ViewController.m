//
//  ViewController.m
//  HYFD
//
//  Created by SongYanming on 16/2/4.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "ViewController.h"
#import "RechangeViewController.h"
#import "SVProgressHUD.h"
#import "HomeViewController.h"


@interface ViewController ()

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)loginAction:(id)sender {
    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
    HomeViewController *home = [[HomeViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:home];

    [[UIApplication sharedApplication].delegate window].rootViewController = nav;

}

- (IBAction)forgetPasswordAction:(id)sender {

}



@end
