//
//  WKWebViewVC.m
//  DPWebview
//
//  Created by roc on 2018/4/24.
//  Copyright © 2018年 roc. All rights reserved.
//

#import "WKWebViewVC.h"

@interface WKWebViewVC ()<WKNavigationDelegate,WKUIDelegate>

@property(nonatomic,strong)WKWebView *wkWebV;

@end

@implementation WKWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
    config.preferences.minimumFontSize = 10;
    
    self.wkWebV = [[WKWebView alloc]initWithFrame:CGRectMake(0, 66, self.view.frame.size.width, self.view.frame.size.height) configuration:config];
    self.wkWebV.navigationDelegate = self;
    self.wkWebV.UIDelegate = self;
    [self.view addSubview:self.wkWebV];
    
    //加载本地的HTML页面
    
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"index" withExtension:@"html"];
    [self.wkWebV loadRequest:[NSURLRequest requestWithURL:url]];
    
    //加载服务器的页面
    //[self.wkWebV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:localHttps]]];
    
}
#pragma mark ====== WKNavigationDelegate ======
//页面开始加载的时候调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"页面开始加载");
}
//当内容开始返回的时候调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"内容开始返回");
}
//页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"页面加载完成");
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"11111====%@",error);
}
-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"222222====%@",error);

}
//WKWebview销毁
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{
    NSLog(@"WKWebview销毁");
}

//发送请求前，决定是否跳转
-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    decisionHandler(WKNavigationActionPolicyAllow);
}
//收到响应后，决定是否跳转
-(void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    decisionHandler(WKNavigationResponsePolicyAllow);
}
//接收到服务器跳转请求之后调用
-(void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
}
//身份认证
-(void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        NSLog(@"======这是服务器信任");
        SecTrustRef serverTrust = challenge.protectionSpace.serverTrust;
        CFDataRef exceptions = SecTrustCopyExceptions (serverTrust);
        SecTrustSetExceptions (serverTrust, exceptions);
        CFRelease (exceptions);
        completionHandler (NSURLSessionAuthChallengeUseCredential, [NSURLCredential credentialForTrust:serverTrust]);
    }else{
        NSLog(@"======客户端信任");
        completionHandler(NSURLSessionAuthChallengeUseCredential,nil);
    }

}

#pragma mark ====== end ======

#pragma mark ====== WKUIDelegate ======
//捕获网页中alert事件
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    [DPView showAlertView:self title:@"提示" message:message okTitle:@"好的" canelTitle:@"" okCallback:^(UIAlertAction *action) {
        completionHandler();
    } canelCallback:^(UIAlertAction *action) {
        completionHandler();
    }];
}
//捕获网页中的confirm事件
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    [DPView showAlertView:self title:@"提示" message:message okTitle:@"好的" canelTitle:@"取消" okCallback:^(UIAlertAction *action) {
        completionHandler(YES);
    } canelCallback:^(UIAlertAction *action) {
        completionHandler(NO);
    }];
}
//捕获网页中的prompt事件
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
    
    completionHandler(@"这是从WKWebviewVC传过来的值");
}
#pragma mark ====== end ======


@end
