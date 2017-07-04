//
//  MBCKBaseScrollViewController.h
//  MBChatKit-Demo
//
//  Created by billchan on 01/07/2017.
//  Copyright © 2017 billchan. All rights reserved.
//

#import "MBCKBaseViewController.h"



@interface MBCKBaseScrollViewController : MBCKBaseViewController <UIScrollViewDelegate>

/**
 *  滑动控件
 */
@property (nonatomic, weak) UIScrollView *scrollView;

/**
 *  下拉刷新是否开启
 */
@property (nonatomic, assign) BOOL refreshHeaderEnabled;

/**
 *  上拉刷新是否开启
 */
@property (nonatomic, assign) BOOL refreshFooterEnabled;

/**
 *  加载ScrollView，子类要重写该方法
 */
- (UIScrollView *)loadScrollView;

@end
