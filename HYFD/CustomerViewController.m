//
//  CustomerViewController.m
//  HYFD
//
//  Created by SongYanming on 16/3/6.
//  Copyright © 2016年 SongYanming. All rights reserved.
//

#import "CustomerViewController.h"
#import "ReplaceCardViewController.h"
#import "TransferViewController.h"

@interface CustomerViewController ()
@property(nonatomic,strong)ReplaceCardViewController *child1;
@property(nonatomic,strong)TransferViewController *child2;

@end

@implementation CustomerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.seg;
    self.automaticallyAdjustsScrollViewInsets = NO;

        self.child1 = [[ReplaceCardViewController alloc]init];
        [self addChildViewController:self.child1];
        [self.child1 didMoveToParentViewController:self];
    
    self.child2 = [[TransferViewController alloc]init];
    [self addChildViewController:self.child2];
    [self.child2 didMoveToParentViewController:self];
    [self addChild:self.child1 withChildToRemove:nil];
}
- (void)addChild:(UIViewController *)childToAdd withChildToRemove:(UIViewController *)childToRemove
{
    assert(childToAdd != nil);
    
    if (childToRemove != nil)
    {
        [childToRemove.view removeFromSuperview];
    }
    
    // match the child size to its parent
    CGRect frame = childToAdd.view.frame;
    frame.size.height = CGRectGetHeight(self.view.frame);
    frame.size.width = CGRectGetWidth(self.view.frame);
    childToAdd.view.frame = frame;
    
    [self.view addSubview:childToAdd.view];
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

- (IBAction)segAction:(id)sender {
    UISegmentedControl *segControl = (UISegmentedControl *)sender;
    
    UIViewController *childToAdd, *childToRemove;
    
    childToAdd = (segControl.selectedSegmentIndex == 0) ? self.child1 : self.child2;
    childToRemove = (segControl.selectedSegmentIndex == 0) ? self.child2 : self.child1;
    
    [self addChild:childToAdd withChildToRemove:childToRemove];
}
@end
