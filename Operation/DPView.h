//
//  DPView.h
//  DPWebview
//
//  Created by roc on 2018/4/24.
//  Copyright © 2018年 roc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPView : UIView

/**
 *  @brief 自定义alertview
 *  @param showVC alertview展示的容器，title：标题 msg:消息 okTitle：按钮1标题 canelTitle:按钮2的标题 okBlock：按钮1的回调 canelBlock：按钮2的回调
 *
 */
+(void)showAlertView:(id)showVC title:(NSString *)title message:(NSString *)msg okTitle:(NSString *)okTitle canelTitle:(NSString *)canelTitle okCallback:(void (^ __nullable)(UIAlertAction *action))okBlock  canelCallback:(void (^ __nullable)(UIAlertAction *action))canelBlock;

@end
