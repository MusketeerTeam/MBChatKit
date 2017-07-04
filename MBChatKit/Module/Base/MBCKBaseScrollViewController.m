//
//  MBCKBaseScrollViewController.m
//  MBChatKit-Demo
//
//  Created by billchan on 01/07/2017.
//  Copyright © 2017 billchan. All rights reserved.
//

#import "MBCKBaseScrollViewController.h"
#import <MJRefresh.h>

@interface MBCKBaseScrollViewController ()

@end

@implementation MBCKBaseScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 避免 NavigationBar 阻挡
    self.automaticallyAdjustsScrollViewInsets = false;
    
    // 加载ScrollView
    self.scrollView = [self loadScrollView];
    
    // 下拉刷新是否开启
    if (self.refreshHeaderEnabled) {
        __weak typeof(self) weakSelf = self;
        self.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf.scrollView.mj_header beginRefreshing];
        }];
    }
    
    // 上拉刷新是否开启
    if (self.refreshFooterEnabled) {
        __weak typeof(self) weakSelf = self;
        self.scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakSelf.scrollView.mj_footer beginRefreshing];
        }];
    }
    
    if (!self.scrollView) NSLog(@"【Warning】scrollView is nil");
    [self.view addSubview:self.scrollView];
}

- (UIScrollView *)loadScrollView {
    // SubClass
    return nil;
}

@end
