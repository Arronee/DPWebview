//
//  DPView.m
//  DPWebview
//
//  Created by roc on 2018/4/24.
//  Copyright © 2018年 roc. All rights reserved.
//

#import "DPView.h"

@implementation DPView

+(void)showAlertView:(id)showVC title:(NSString *)title message:(NSString *)msg okTitle:(NSString *)okTitle canelTitle:(NSString *)canelTitle okCallback:(void (^ __nullable)(UIAlertAction *action))okBlock  canelCallback:(void (^ __nullable)(UIAlertAction *action))canelBlock{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    [showVC presentViewController:alertVC animated:YES completion:nil];
    
    if (canelTitle.length != 0) {
        UIAlertAction *canel = [UIAlertAction actionWithTitle:canelTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            canelBlock(action);
        }];
        [alertVC addAction:canel];
    }
    
    if (okTitle.length != 0) {
        UIAlertAction *ok = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            okBlock(action);
        }];
        [alertVC addAction:ok];
    }
}
@end
