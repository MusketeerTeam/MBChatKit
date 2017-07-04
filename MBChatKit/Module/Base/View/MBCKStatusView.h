//
//  MBCKStatusView.h
//  MBChatKit-Demo
//
//  Created by billchan on 04/07/2017.
//  Copyright © 2017 billchan. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat MBCKStatusViewHight = 44;

@protocol MBCKStatusViewDelegate <NSObject>

@optional

/**
 Status View 点击响应

 @param sender senderObject
 */
- (void)statusViewClicked:(id)sender;

@end

@interface MBCKStatusView : UIView

@property (nonatomic, weak) id<MBCKStatusViewDelegate> delegate;

@end
