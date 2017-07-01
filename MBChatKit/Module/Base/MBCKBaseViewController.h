//
//  MBCKBaseViewController.h
//  MBChatKit
//
//  Created by billchan on 01/07/2017.
//  Copyright © 2017 billchan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class MBCKBaseViewController;

#pragma mark -
#pragma mark - MBCKBaseViewControllerEventProtocol

@protocol MBCKBaseViewControllerEventProtocol <NSObject>

/* LoadView Block */
typedef void(^MBCKLoadViewBlock)
(__kindof MBCKBaseViewController *viewController);

/* ViewDidLoad Block */
typedef void(^MBCKViewDidLoadBlock)
(__kindof MBCKBaseViewController *viewController);

/* ViewWillAppear Block */
typedef void(^MBCKViewWillAppearBlock)
(__kindof MBCKBaseViewController *viewController, BOOL aAnimated);

/* ViewWillLayoutSubviews Block */
typedef void(^MBCKViewWillLayoutSubviewsBlock)
(__kindof MBCKBaseViewController *viewController);

/* ViewDidLayoutSubviews Block */
typedef void(^MBCKViewDidLayoutSubviewsBlock)
(__kindof MBCKBaseViewController *viewController);

/* ViewDidAppear Block */
typedef void(^MBCKViewDidAppearBlock)
(__kindof MBCKBaseViewController *viewController, BOOL aAnimated);

/* ViewWillDisappear Block */
typedef void(^MBCKViewWillDisappearBlock)
(__kindof MBCKBaseViewController *viewController, BOOL aAnimated);

/* ViewDidDisappear Block */
typedef void(^MBCKViewDidDisappearBlock)
(__kindof MBCKBaseViewController *viewController, BOOL aAnimated);

/* ViewDidDismiss Block */
typedef void(^MBCKViewDidDismissBlock)
(__kindof MBCKBaseViewController *viewController);

/* ViewControllerWillDealloc Block */
typedef void(^MBCKViewControllerWillDeallocBlock)
(__kindof MBCKBaseViewController *viewController);

/* ViewDidReceiveMemoryWarning Block */
typedef void(^MBCKViewDidReceiveMemoryWarningBlock)
(__kindof MBCKBaseViewController *viewController);

/* Block Property */
@property (nonatomic, copy) MBCKLoadViewBlock loadViewBlock;
@property (nonatomic, copy) MBCKViewDidLoadBlock viewDidLoadBlock;
@property (nonatomic, copy) MBCKViewWillAppearBlock viewWillAppearBlock;
@property (nonatomic, copy) MBCKViewWillLayoutSubviewsBlock viewWillLayoutSubviewsBlock;
@property (nonatomic, copy) MBCKViewDidLayoutSubviewsBlock viewDidLayoutSubviewsBlock;
@property (nonatomic, copy) MBCKViewDidAppearBlock viewDidAppearBlock;
@property (nonatomic, copy) MBCKViewWillDisappearBlock viewWillDisappearBlock;
@property (nonatomic, copy) MBCKViewDidDisappearBlock viewDidDisappearBlock;
@property (nonatomic, copy) MBCKViewDidDismissBlock viewDidDismissBlock;
@property (nonatomic, copy) MBCKViewControllerWillDeallocBlock viewControllerWillDeallocBlock;
@property (nonatomic, copy) MBCKViewDidReceiveMemoryWarningBlock didReceiveMemoryWarningBlock;

/* Set Block Method */
- (void)setLoadViewBlock:(MBCKLoadViewBlock)loadViewBlock;
- (void)setViewDidLoadBlock:(MBCKViewDidLoadBlock)viewDidLoadBlock;
- (void)setViewWillAppearBlock:(MBCKViewWillAppearBlock)viewWillAppearBlock;
- (void)setViewWillLayoutSubviewsBlock:(MBCKViewWillLayoutSubviewsBlock)viewWillLayoutSubViewsBlock;
- (void)setViewDidLayoutSubviewsBlock:(MBCKViewDidLayoutSubviewsBlock)viewDidLayoutSubViewsBlock;
- (void)setViewDidAppearBlock:(MBCKViewDidAppearBlock)viewDidAppearBlock;
- (void)setViewWillDisappearBlock:(MBCKViewWillDisappearBlock)viewWillDisappearBlock;
- (void)setViewDidDisappearBlock:(MBCKViewDidDisappearBlock)viewDidDisappearBlock;
- (void)setViewDidDismissBlock:(MBCKViewDidDismissBlock)viewDidDismissBlock;
- (void)setViewControllerWillDeallocBlock:(MBCKViewControllerWillDeallocBlock)viewControllerWillDeallocBlock;
- (void)setViewDidReceiveMemoryWarningBlock:(MBCKViewDidReceiveMemoryWarningBlock)didReceiveMemoryWarningBlock;

@end

/** Bar Button 响应的 Block */
typedef void(^MBCKBarButtonItemActionBlock)(__kindof MBCKBaseViewController *viewController, UIBarButtonItem *sender, UIEvent *event);

/** Bar Button 模式 */
typedef NS_ENUM(NSUInteger, MBCKBarButtonItemStyle) {
    MBCKBarButtonItemStyleSetting = 0,    // 设置模式
    MBCKBarButtonItemStyleMore,           // 更多模式
    MBCKBarButtonItemStyleAdd,            // 添加模式
    MBCKBarButtonItemStyleAddFriends,     // 加好友模式
    MBCKBarButtonItemStyleShare,          // 分享模式
    MBCKBarButtonItemStyleSingleProfile,  // 个人信息模式
    MBCKBarButtonItemStyleGroupProfile,   // 群信息模式
};

#pragma mark -
#pragma mark - MBCKBaseViewController

@interface MBCKBaseViewController : UIViewController <MBCKBaseViewControllerEventProtocol>

/**
 设置Bar Button

 @param style 风格
 @param actionBlock 响应回调
 */
- (void)setBarButtonItemStyle:(MBCKBarButtonItemStyle)style
                  actionBlock:(MBCKBarButtonItemActionBlock)actionBlock;

/**
 警告

 @param messsage 内容
 */
- (void)alert:(NSString *)messsage;

/**
 警告(带错误信息)
 
 @param error 错误信息
 @return 是否错误
 */
- (BOOL)alertWithError:(NSError *)error;

@end
