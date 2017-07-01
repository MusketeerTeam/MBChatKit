//
//  MBCKBaseScrollViewController.m
//  MBChatKit-Demo
//
//  Created by billchan on 01/07/2017.
//  Copyright © 2017 billchan. All rights reserved.
//

#import "MBCKBaseScrollViewController.h"

@interface MBCKBaseScrollViewController ()

@end

@implementation MBCKBaseScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 避免 NavigationBar 阻挡
    self.automaticallyAdjustsScrollViewInsets = false;
    
    // 加载ScrollView
    self.scrollView = [self loadScrollView];
    
    // 定义刷新组件
    if (self.refreshEnabled) {
        // TODO: MJRefreshHeader
    }
    
    // 定义加载组件
    if (self.loadMoreEnabled) {
        // TODO: MJRefreshFooter
    }
    
    if (!self.scrollView) NSLog(@"【Warning】scrollView is nil");
    [self.view addSubview:self.scrollView];
    
    // TODO：KVO - refreshEnabled and loadMoreEnabled
}

- (UIScrollView *)loadScrollView {
    // SubClass
    return nil;
}

@end
