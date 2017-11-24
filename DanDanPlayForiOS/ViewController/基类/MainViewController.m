//
//  MainViewController.m
//  DanDanPlayForiOS
//
//  Created by JimHuang on 17/3/5.
//  Copyright © 2017年 JimHuang. All rights reserved.
//

#import "MainViewController.h"
#import "FileViewController.h"
#import "MineViewController.h"
#import "HomePageViewController.h"
#import "JHBaseNavigationController.h"

@interface MainViewController ()
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *homeVC = [self navigationControllerWithNormalImg:[UIImage imageNamed:@"main_bangumi"] selectImg:[UIImage imageNamed:@"main_bangumi"] rootVC:[[HomePageViewController alloc] init] title:nil];
    UINavigationController *fileVC = [self navigationControllerWithNormalImg:[UIImage imageNamed:@"main_file"] selectImg:[UIImage imageNamed:@"main_file"] rootVC:[[FileViewController alloc] init] title:nil];
    UINavigationController *settingVC = [self navigationControllerWithNormalImg:[UIImage imageNamed:@"main_mine"] selectImg:[UIImage imageNamed:@"main_mine"] rootVC:[[MineViewController alloc] init] title:nil];
    
    self.viewControllers = @[homeVC, fileVC, settingVC];
    
    self.tabBar.translucent = NO;
}

- (BOOL)shouldAutorotate {
    return jh_isPad();
}

//设置支持的屏幕旋转方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (jh_isPad()) {
        return UIInterfaceOrientationMaskAll;
    }
    return UIInterfaceOrientationMaskPortrait;
}

//设置presentation方式展示的屏幕方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

#pragma mark - 私有方法
- (UINavigationController *)navigationControllerWithNormalImg:(UIImage *)normalImg selectImg:(UIImage *)selectImg rootVC:(UIViewController *)rootVC title:(NSString *)title {
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:normalImg selectedImage:[[selectImg imageByTintColor:MAIN_COLOR] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *navVC = [[JHBaseNavigationController alloc] initWithRootViewController:rootVC];
    navVC.tabBarItem = item;
    if (jh_isPad() == NO) {
        item.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    }
    
    return navVC;
}

@end
