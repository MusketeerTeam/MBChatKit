//
//  MBCKBaseViewController.m
//  MBChatKit
//
//  Created by billchan on 01/07/2017.
//  Copyright © 2017 billchan. All rights reserved.
//

#import "MBCKBaseViewController.h"

// TODO: use socket error code
static const int kMBIMErrorConnectionLost = -100;

@interface MBCKBaseViewController ()

@property (nonatomic, copy) MBCKBarButtonItemActionBlock barButtonItemAction;

@end

@implementation MBCKBaseViewController

/** Synthesize Delegate Property */
@synthesize loadViewBlock = _loadViewBlock;
@synthesize viewDidLoadBlock = _viewDidLoadBlock;
@synthesize viewWillAppearBlock = _viewWillAppearBlock;
@synthesize viewWillLayoutSubviewsBlock = _viewWillLayoutSubviewsBlock;
@synthesize viewDidLayoutSubviewsBlock = _viewDidLayoutSubviewsBlock;
@synthesize viewDidAppearBlock = _viewDidAppearBlock;
@synthesize viewWillDisappearBlock = _viewWillDisappearBlock;
@synthesize viewDidDisappearBlock = _viewDidDisappearBlock;
@synthesize viewDidDismissBlock = _viewDidDismissBlock;
@synthesize viewControllerWillDeallocBlock = _viewControllerWillDeallocBlock;
@synthesize didReceiveMemoryWarningBlock = _didReceiveMemoryWarningBlock;

#pragma mark -
#pragma mark - UIViewController Life Event Block

- (void)setViewDidLoadBlock:(MBCKViewDidLoadBlock)viewDidLoadBlock {
    _viewDidLoadBlock = viewDidLoadBlock;
}

- (void)setViewWillAppearBlock:(MBCKViewWillAppearBlock)viewWillAppearBlock {
    _viewWillAppearBlock = viewWillAppearBlock;
}

- (void)setViewWillLayoutSubviewsBlock:(MBCKViewWillLayoutSubviewsBlock)viewWillLayoutSubViewsBlock {
    _viewWillLayoutSubviewsBlock = viewWillLayoutSubViewsBlock;
}

- (void)setViewDidLayoutSubviewsBlock:(MBCKViewDidLayoutSubviewsBlock)viewDidLayoutSubViewsBlock {
    _viewDidLayoutSubviewsBlock = viewDidLayoutSubViewsBlock;
}

- (void)setViewDidAppearBlock:(MBCKViewDidAppearBlock)viewDidAppearBlock {
    _viewDidAppearBlock = viewDidAppearBlock;
}

- (void)setViewWillDisappearBlock:(MBCKViewWillDisappearBlock)viewWillDisappearBlock {
    _viewWillDisappearBlock = viewWillDisappearBlock;
}

- (void)setViewDidDisappearBlock:(MBCKViewDidDisappearBlock)viewDidDisappearBlock {
    _viewDidDisappearBlock = viewDidDisappearBlock;
}

- (void)setViewDidDismissBlock:(MBCKViewDidDismissBlock)viewDidDismissBlock {
    _viewDidDismissBlock = viewDidDismissBlock;
}

- (void)setViewControllerWillDeallocBlock:(MBCKViewControllerWillDeallocBlock)viewControllerWillDeallocBlock {
    _viewControllerWillDeallocBlock = viewControllerWillDeallocBlock;
}

- (void)setViewDidReceiveMemoryWarningBlock:(MBCKViewDidReceiveMemoryWarningBlock)didReceiveMemoryWarningBlock {
    _didReceiveMemoryWarningBlock = didReceiveMemoryWarningBlock;
}

- (void)clickedBarButtonItemAction:(UIBarButtonItem *)sender event:(UIEvent *)event {
    if (self.barButtonItemAction) {
        self.barButtonItemAction(self, sender, event);
    }
}

#pragma mark - Public Method

- (void)setBarButtonItemStyle:(MBCKBarButtonItemStyle)style
                  actionBlock:(MBCKBarButtonItemActionBlock)actionBlock {
    NSString *icon;
    switch (style) {
        case MBCKBarButtonItemStyleSetting: {
            icon = @"barbuttonicon_set";
            break;
        }
        case MBCKBarButtonItemStyleMore: {
            icon = @"barbuttonicon_more";
            break;
        }
        case MBCKBarButtonItemStyleAdd: {
            icon = @"barbuttonicon_add";
            break;
        }
        case MBCKBarButtonItemStyleAddFriends:
            icon = @"barbuttonicon_addfriends";
            break;
        case MBCKBarButtonItemStyleSingleProfile:
            icon = @"barbuttonicon_InfoSingle";
            break;
        case MBCKBarButtonItemStyleGroupProfile:
            icon = @"barbuttonicon_InfoMulti";
            break;
        case MBCKBarButtonItemStyleShare:
            icon = @"barbuttonicon_Operate";
            break;
    }
    // TODO: load the local resource
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage lcck_imageNamed:icon bundleName:@"BarButtonIcon" bundleForClass:[self class]] style:UIBarButtonItemStylePlain target:self action:@selector(clickedBarButtonItemAction:event:)];
    self.barButtonItemAction = actionBlock;
}

#pragma mark - alert and async utils

- (void)alert:(NSString *)message {
    // TODO: socket notification to handle it
}

- (BOOL)alertWithError:(NSError *)error {
    if (error) {
        if (error.code == kMBIMErrorConnectionLost) {
            [self alert:@"未能连接聊天服务"];
        } else if ([error.domain isEqualToString:NSURLErrorDomain]) {
            [self alert:@"网络连接发生错误"];
        } else {
            [self alert:[NSString stringWithFormat:@"%@", error]];
        }
        return YES;
    }
    return NO;
}

#pragma mark - UIViewController Life Method

- (void)loadView {
    [super loadView];
    !self.loadViewBlock ?: self.loadViewBlock(self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    !self.viewDidLoadBlock ?: self.viewDidLoadBlock(self);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    !self.viewWillAppearBlock ?: self.viewWillAppearBlock(self, animated);
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    !self.viewWillLayoutSubviewsBlock ?: self.viewWillLayoutSubviewsBlock(self);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    !self.viewDidLayoutSubviewsBlock ?: self.viewDidLayoutSubviewsBlock(self);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    !self.viewDidAppearBlock ?: self.viewDidAppearBlock(self, animated);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    !self.viewWillDisappearBlock ?: self.viewWillDisappearBlock(self, animated);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    !self.viewDidAppearBlock ?: self.viewDidAppearBlock(self, animated);
}

- (void)dealloc {
    !self.viewControllerWillDeallocBlock ?: self.viewControllerWillDeallocBlock(self);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    !self.didReceiveMemoryWarningBlock ?: self.didReceiveMemoryWarningBlock(self);
}

@end
