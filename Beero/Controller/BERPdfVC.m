//
//  BERPdfVC.m
//  Beero
//
//  Created by Chris Lin on 9/12/15.
//  Copyright (c) 2015 Beero. All rights reserved.
//

#import "BERPdfVC.h"
#import "Global.h"
#import "BERGenericFunctionManager.h"

@interface BERPdfVC () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *m_webview;
@property (weak, nonatomic) IBOutlet UIView *m_viewContainer;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *m_activityIndicator;

@end

@implementation BERPdfVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.m_webview.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated{
//    self.m_viewContainer.layer.cornerRadius = 3;
    self.m_viewContainer.layer.borderWidth = 1;
    self.m_viewContainer.layer.borderColor = [UIColor blackColor].CGColor;
    self.m_viewContainer.clipsToBounds = YES;

    self.m_activityIndicator.hidden = NO;
    [self.m_activityIndicator startAnimating];
    
    NSLog(@"Url: %@", self.m_szUrl);
    NSURL *targetURL = [NSURL URLWithString:self.m_szUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];

    [self.m_webview loadRequest:request];
    [BERGenericFunctionManager drawDropShadowToView:self.m_viewContainer Size:5];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) closeDialog{
    [UIView animateWithDuration:TRANSITION_FADEOUT_DURATION animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL b){
        [self dismissViewControllerAnimated:NO completion:nil];
        // self.view.alpha = 1;
    }];
}

- (IBAction)onBtnCloseClick:(id)sender {
    [self closeDialog];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.m_activityIndicator stopAnimating];
    self.m_activityIndicator.hidden = YES;

    [BERGenericFunctionManager showAlertWithMessage:error.localizedDescription];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.m_activityIndicator stopAnimating];
    self.m_activityIndicator.hidden = YES;
}

@end
