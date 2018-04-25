//
//  BaseViewController.m
//  DPWebview
//
//  Created by roc on 2018/4/24.
//  Copyright © 2018年 roc. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //这里设置高度貌似不起作用，无论怎么设置高度显示的高度是固定的
    // 创建一个导航栏
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];
    // 导航栏背景颜色
    //navBar.barTintColor = [UIColor colorWithRed:101/255.0 green:215/255.0 blue:237/255.0 alpha:1.0];
    
    // 自定义导航栏的title，用UILabel实现
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    titleLabel.text = @"标题";
    titleLabel.textColor = [UIColor darkGrayColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    
    // 创建导航栏组件
    UINavigationItem *navItem = [[UINavigationItem alloc] init];
    // 设置自定义的title
    navItem.titleView = titleLabel;
    
    // 创建左侧按钮
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonClick)];
    leftButton.tintColor = [UIColor darkGrayColor];
    
    // 创建右侧按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick)];
    rightButton.tintColor = [UIColor darkGrayColor];
    
    // 添加左侧、右侧按钮
    [navItem setLeftBarButtonItem:leftButton animated:false];
    [navItem setRightBarButtonItem:rightButton animated:false];
    // 把导航栏组件加入导航栏
    [navBar pushNavigationItem:navItem animated:false];
    
    // 导航栏添加到view上
    [self.view addSubview:navBar];

}
//左侧按钮的点击事件
-(void)leftButtonClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//右侧按钮的点击事件
-(void)rightButtonClick{
    
}


@end
