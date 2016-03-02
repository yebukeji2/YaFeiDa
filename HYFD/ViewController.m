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
#import "IQKeyboardManager.h"


@interface ViewController ()
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UIButton *rightBtn2;
@property(nonatomic,strong)UIView *rightView2;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //输入框弹出键盘问题
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;//控制整个功能是否启用
    manager.shouldResignOnTouchOutside = YES;//控制点击背景是否收起键盘
    manager.shouldToolbarUsesTextFieldTintColor = YES;//控制键盘上的工具条文字颜色是否用户自定义
    manager.enableAutoToolbar = YES;//控制是否显示键盘上的工具条
    //添加导航条
    UIColor *color = [UIColor whiteColor];
    self.userTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   请输入用户名" attributes:@{NSForegroundColorAttributeName: color}];
    self.passwordTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   请输入密码" attributes:@{NSForegroundColorAttributeName: color}];

    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn setImage:[UIImage imageNamed:@"close_eye"] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@"open_eye"] forState:UIControlStateSelected];
    [self.rightBtn addTarget:self action:@selector(rightViewAction:) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn.frame = CGRectMake(0, 0, 32, 32);
    self.passwordTF.rightView = self.rightBtn;
    self.passwordTF.rightViewMode=UITextFieldViewModeAlways;

    self.rightBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn2 setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.rightBtn2 setTitle:@"已发送" forState:UIControlStateSelected];
    [self.rightBtn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightBtn2.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.rightBtn2 setBackgroundColor:[UIColor lightGrayColor]];
    [self.rightBtn2 addTarget:self action:@selector(rightViewAction2:) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn2.frame = CGRectMake(5, 5, 65, 20);
    self.rightView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    [self.rightView2 addSubview:self.rightBtn2];


    
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

- (IBAction)loginBtnAction:(id)sender {
    UIButton *CurrentBtn = sender;
    CurrentBtn.selected = YES;
    int tag ;
    if(CurrentBtn.tag ==1){
        tag = 2;
    }else{
        tag = 1;
    }
    UIButton *btn = [self.view viewWithTag:tag];
    btn.selected = NO;
    if(CurrentBtn.tag == 1){
        self.firstLine.backgroundColor = [UIColor colorWithRed:34/255.0 green:114/255.0 blue:189/255.0 alpha:1];
        self.secondLine.backgroundColor = [UIColor clearColor];
        UIColor *color = [UIColor whiteColor];
        self.userTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   请输入用户名" attributes:@{NSForegroundColorAttributeName: color}];
        self.passwordTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   请输入密码" attributes:@{NSForegroundColorAttributeName: color}];

        self.passwordTF.rightView = self.rightBtn;
        [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];

    }
    else{
        self.secondLine.backgroundColor = [UIColor colorWithRed:34/255.0 green:114/255.0 blue:189/255.0 alpha:1];
        self.firstLine.backgroundColor = [UIColor clearColor];
        UIColor *color = [UIColor whiteColor];
        self.userTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   请输入手机号" attributes:@{NSForegroundColorAttributeName: color}];
        self.passwordTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   请输入验证码" attributes:@{NSForegroundColorAttributeName: color}];

        self.passwordTF.rightView = self.rightView2;
        [self.loginBtn setTitle:@"注册" forState:UIControlStateNormal];

    }
}
-(void)rightViewAction:(id)sender{
    UIButton *btn = sender;
    btn.selected = !btn.selected;
    if(btn.selected == YES){
        self.passwordTF.secureTextEntry = NO;
    } else{
        self.passwordTF.secureTextEntry = YES;
        
    }
    
}
-(void)rightViewAction2:(id)sender{
    UIButton *btn = sender;
    btn.selected = !btn.selected;
    
}


@end
