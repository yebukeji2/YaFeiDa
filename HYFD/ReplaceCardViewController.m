//
//  ReplaceCardViewController.m
//  HYFD
//
//  Created by SongYanming on 16/3/6.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "ReplaceCardViewController.h"

@interface ReplaceCardViewController ()

@end

@implementation ReplaceCardViewController
-(void)rightViewAction:(id)sender{
    
}
-(void)rightViewAction2:(id)sender{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"Triangle_up"] forState:UIControlStateNormal];
    
    [rightBtn addTarget:self action:@selector(rightViewAction:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.frame = CGRectMake(0, 0, 32, 32);
    self.selectedTF.rightView = rightBtn;
    self.selectedTF.rightViewMode=UITextFieldViewModeAlways;
    UIButton * rightBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn2 setImage:[UIImage imageNamed:@"Triangle_up"] forState:UIControlStateNormal];
    
    [rightBtn2 addTarget:self action:@selector(rightViewAction2:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn2.frame = CGRectMake(0, 0, 32, 32);
    self.selectedTF2.rightView = rightBtn2;
    self.selectedTF2.rightViewMode=UITextFieldViewModeAlways;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
