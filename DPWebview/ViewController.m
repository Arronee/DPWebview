//
//  ViewController.m
//  DPWebview
//
//  Created by roc on 2018/4/23.
//  Copyright © 2018年 roc. All rights reserved.
//

#import "ViewController.h"
#import "UIWebViewVC.h"
#import "WKWebViewVC.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)UIWebViewClick:(UIButton *)sender {
    
    UIWebViewVC *webviewvc = [[UIWebViewVC alloc]init];
    [self presentViewController:webviewvc animated:YES completion:nil];
}

- (IBAction)WKWebViewClick:(UIButton *)sender {
    WKWebViewVC *wkwebviewvc = [[WKWebViewVC alloc]init];
    [self presentViewController:wkwebviewvc animated:YES completion:nil];
}




@end
