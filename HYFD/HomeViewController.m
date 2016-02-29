//
//  HomeViewController.m
//  HYFD
//
//  Created by songyanming on 16/2/18.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "HomeViewController.h"
#import "RechangeViewController.h"
#import "ActivateCardViewController.h"
#import "ViewController.h"

@interface HomeViewController ()
@property(nonatomic,strong) NSString *test;
@end
@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigation_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(leftItemAction:)];

    self.navigationItem.title = @"亚飞达";


}
-(void)leftItemAction:(id)sender
{
    //获取storyboard: 通过bundle根据storyboard的名字来获取我们的storyboard,
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //由storyboard根据myView的storyBoardID来获取我们要切换的视图
    UIViewController *loginVC = [story instantiateViewControllerWithIdentifier:@"ViewController"];

    [[UIApplication sharedApplication].delegate window].rootViewController = loginVC;
}
-(void)rightItemAction:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AllBtnAction:(id)sender {
    self.navigationController.navigationBarHidden = NO;
    UIButton *btn = (UIButton*)sender;
    if(btn.tag==0){
        ActivateCardViewController *detail = [[ActivateCardViewController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
        
    }else if(btn.tag==2){
        RechangeViewController *vc = [[RechangeViewController alloc]initWithNibName:@"RechangeViewController" bundle:nil];
        vc.navigationItem.title = @"话费充值";
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (btn.tag == 3){
        RechangeViewController *vc = [[RechangeViewController alloc]initWithNibName:@"dataRechangeVC" bundle:nil];
        vc.navigationItem.title = @"流量充值";
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}
@end
