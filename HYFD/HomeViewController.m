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
#import "IndividualCenterViewController.h"
#import "QueryViewController.h"
#import "MyViewController.h"
#import "InviteViewController.h"
#import "RechangeParentViewController.h"

@interface HomeViewController ()
@property(nonatomic,strong) NSString *test;
@end
@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigation_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(leftItemAction:)];
//
    self.navigationItem.title = @"亚飞达";
    self.navigationController.navigationBarHidden = YES;


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
        detail.navigationItem.title = @"普号开卡";

        
    }
    else if (btn.tag==1){
        ActivateCardViewController *detail = [[ActivateCardViewController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
        detail.navigationItem.title = @"靓号开卡";
        
        
    }
    else if(btn.tag==2){
        RechangeParentViewController *vc = [[RechangeParentViewController alloc]initWithNibName:@"RechangeParentViewController" bundle:nil];
        //vc.Flag = 0;
        //vc.navigationItem.titleView = self.seg;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (btn.tag == 4){
        RechangeViewController *vc = [[RechangeViewController alloc]initWithNibName:@"dataRechangeVC" bundle:nil];
        vc.Flag = 1;
        //vc.navigationItem.titleView = self.SecSeg;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (btn.tag == 5){
        QueryViewController*vc = [[QueryViewController alloc]initWithNibName:@"QueryViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (btn.tag == 6){
        InviteViewController*vc = [[InviteViewController alloc]initWithNibName:@"InviteViewController" bundle:nil];
        vc.navigationItem.title = @"邀请";
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (btn.tag == 7){
         IndividualCenterViewController*vc = [[IndividualCenterViewController alloc]initWithNibName:@"IndividualCenterViewController" bundle:nil];
        vc.navigationItem.title = @"个人中心";
        [self.navigationController pushViewController:vc animated:YES];
    }

    
}

- (IBAction)myBtnAction:(id)sender {
    MyViewController *detail = [[MyViewController alloc]init];
    detail.navigationItem.title = @"我的";
    [self.navigationController pushViewController:detail animated:YES];
}


@end
