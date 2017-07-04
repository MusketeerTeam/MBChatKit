//
//  MBCKBaseTableViewController.h
//  MBChatKit-Demo
//
//  Created by billchan on 04/07/2017.
//  Copyright © 2017 billchan. All rights reserved.
//

#import "MBCKBaseScrollViewController.h"

typedef NS_ENUM(NSUInteger, MBCKViewControllerStyle) {
    MBCKViewControllerStylePlain = 0,
    MBCKViewControllerStylePresenting
};

@class MBCKStatusView;

@interface MBCKBaseTableViewController : MBCKBaseScrollViewController

@property (nonatomic, strong, readonly) MBCKStatusView *statusView;
@property (nonatomic, assign) MBCKViewControllerStyle viewControllerStyle;

/**
 *  显示大量数据的控件
 */
@property (nonatomic, weak) UITableView *tableView;

/**
 *  初始化init的时候设置tableView的样式才有效
 */
@property (nonatomic, assign) UITableViewStyle tableViewStyle;

/**
 *  大量数据的数据源
 */
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign, getter=shouldCheckSessionStatus) BOOL checkSessionStatus;

/**
 *  加载本地或者网络数据源
 */
- (void)loadDataSource;
- (void)updateStatusView;

@end
