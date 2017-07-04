//
//  MBCKStatusView.m
//  MBChatKit-Demo
//
//  Created by billchan on 04/07/2017.
//  Copyright © 2017 billchan. All rights reserved.
//

#import "MBCKStatusView.h"

static CGFloat MBCKHorizontalSpacing = 15;

@interface MBCKStatusView ()

@property (nonatomic, strong) UILabel *statusLabel;

@end

@implementation MBCKStatusView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:199 / 255.0 blue:199 / 255.0 alpha:1];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:self.statusLabel];
}

#pragma mark - Propertys

- (UILabel *)statusLabel {
    if (_statusLabel == nil) {
        _statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(MBCKHorizontalSpacing, 0, self.frame.size.width - MBCKHorizontalSpacing, MBCKStatusViewHight)];
        _statusLabel.font = [UIFont systemFontOfSize:15.0];
        _statusLabel.textColor = [UIColor grayColor];
        _statusLabel.text = @"netDisconnected";
    }
    return _statusLabel;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.delegate respondsToSelector:@selector(statusViewClicked:)]) {
        [self.delegate statusViewClicked:self];
    }
}

@end
