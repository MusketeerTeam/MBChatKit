//
//  MBCKBaseTableViewController.m
//  MBChatKit-Demo
//
//  Created by billchan on 04/07/2017.
//  Copyright © 2017 billchan. All rights reserved.
//

#import "MBCKBaseTableViewController.h"
#import "MBCKStatusView.h"
#import "MBCKConstants.h"

@interface MBCKBaseTableViewController ()
<
    MBCKStatusViewDelegate,
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) MBCKStatusView *statusView;

@end

@implementation MBCKBaseTableViewController

#pragma mark - Publish Method

- (void)loadDataSource {
    // subClass
}

#pragma mark - Propertys

- (UITableView *)tableView {
    if (!_tableView) {
        CGRect tableViewFrame = self.view.bounds;
        UITableView *tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:self.tableViewStyle];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        if (self.tableViewStyle == UITableViewStyleGrouped) {
            UIView *backgroundView = [[UIView alloc] initWithFrame:tableView.bounds];
            backgroundView.backgroundColor = tableView.backgroundColor;
            tableView.backgroundView = backgroundView;
        }
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [[UIView alloc] init];
        tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        [self.view addSubview:_tableView = tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _dataSource;
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //view在导航栏下方
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateStatusView)
                                                 name:MBCKNotificationConnectivityUpdated
                                               object:nil];
    
    if (self.viewControllerStyle == MBCKViewControllerStylePresenting) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismissViewController:)];
    }
    self.checkSessionStatus = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];
}

- (void)dismissViewController:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // subClass
    return nil;
}

#pragma mark - MBCKBaseScrollViewController

- (UIScrollView *)loadScrollView {
    return self.tableView;
}

#pragma mark - connect status view

- (MBCKStatusView *)clientStatusView {
    if (_statusView == nil) {
        _statusView = [[MBCKStatusView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, MBCKStatusViewHight)];
        _statusView.delegate = self;
    }
    return _statusView;
}

- (void)updateStatusView {}

- (void)statusViewClicked:(id)sender {
//    [[MBCKSessionService sharedInstance] reconnectForViewController:self callback:nil];
}

- (void)applicationDidBecomeActive:(NSNotification*)note {
    self.checkSessionStatus = YES;
}

- (void)applicationWillResignActive:(NSNotification*)note {
    self.checkSessionStatus = NO;
}

@end
