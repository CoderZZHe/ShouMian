//
//  WeChatStylePlaceHolder.m
//  CYLTableViewPlaceHolder
//
//  Created by 陈宜龙 on 15/12/23.
//  Copyright © 2015年 http://weibo.com/luohanchenyilong/ ÂæÆÂçö@iOSÁ®ãÂ∫èÁä≠Ë¢Å. All rights reserved.
//

static float const kUIemptyOverlayLabelX         = 0;
static float const kUIemptyOverlayLabelY         = 0;
static float const kUIemptyOverlayLabelHeight    = 20;

#import "WeChatStylePlaceHolder.h"

@interface WeChatStylePlaceHolder (){
    UILabel *emptyOverlayLabel;
    UILabel *emptyOverlayLabelb;
    
}

@property (nonatomic, strong) UIImageView *emptyOverlayImageView;

@end

@implementation WeChatStylePlaceHolder

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}

- (instancetype)sharedInit {
    self.backgroundColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor whiteColor];
    self.contentMode =   UIViewContentModeTop;
    [self addUIemptyOverlayImageView];
    [self addUIemptyOverlayLabel];
    [self setupUIemptyOverlay];
    return self;
}

- (void)addUIemptyOverlayImageView {
    self.emptyOverlayImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    self.emptyOverlayImageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2 - 100);
    self.emptyOverlayImageView.image = [UIImage imageNamed:@"WebView_LoadFail_Refresh_Icon"];
    [self addSubview:self.emptyOverlayImageView];
}

- (void)addUIemptyOverlayLabel {
    CGRect emptyOverlayViewFrame = CGRectMake(kUIemptyOverlayLabelX, kUIemptyOverlayLabelY, CGRectGetWidth(self.frame), kUIemptyOverlayLabelHeight);
    emptyOverlayLabel = [[UILabel alloc] initWithFrame:emptyOverlayViewFrame];
    emptyOverlayLabel.textAlignment = NSTextAlignmentCenter;
    emptyOverlayLabel.numberOfLines = 0;
    emptyOverlayLabel.backgroundColor = [UIColor clearColor];
    emptyOverlayLabel.text = @"暂无数据,轻触屏幕重新加载";
    emptyOverlayLabel.font = [UIFont boldSystemFontOfSize:15];
    emptyOverlayLabel.frame = ({
        CGRect frame = emptyOverlayLabel.frame;
        frame.origin.y = CGRectGetMaxY(self.emptyOverlayImageView.frame) + 30;
        frame;
    });
    emptyOverlayLabel.textColor = [UIColor grayColor];
    [self addSubview:emptyOverlayLabel];
    
    CGRect emptyOverlayViewFrameA = CGRectMake(kUIemptyOverlayLabelX, kUIemptyOverlayLabelY, CGRectGetWidth(self.frame), kUIemptyOverlayLabelHeight);
    emptyOverlayLabelb = [[UILabel alloc] initWithFrame:emptyOverlayViewFrameA];
    emptyOverlayLabelb.textAlignment = NSTextAlignmentCenter;
    emptyOverlayLabelb.numberOfLines = 0;
    emptyOverlayLabelb.backgroundColor = [UIColor clearColor];
    emptyOverlayLabelb.text = @"";
    emptyOverlayLabelb.font = [UIFont boldSystemFontOfSize:13];
    emptyOverlayLabelb.frame = ({
        CGRect frame = emptyOverlayLabelb.frame;
        frame.origin.y = CGRectGetMaxY(emptyOverlayLabel.frame) + 10;
        frame;
    });
    emptyOverlayLabelb.textColor = [UIColor lightGrayColor];
    [self addSubview:emptyOverlayLabelb];
}
-(void)setImageName:(NSString *)imageName{
    
    self.emptyOverlayImageView.image = [UIImage imageNamed:imageName];
    
    UIImage *imageN = [UIImage imageNamed:imageName];
    NSUInteger width = imageN.size.width/2.0f;
    NSUInteger height = imageN.size.height/2.0f;
    
    self.emptyOverlayImageView.frame =CGRectMake(0, 0, width, height);
    
    self.emptyOverlayImageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2 - 100);
    
    emptyOverlayLabel.frame = ({
        CGRect frame = emptyOverlayLabel.frame;
        frame.origin.y = CGRectGetMaxY(self.emptyOverlayImageView.frame) + 30;
        frame;
    });
    
    emptyOverlayLabelb.frame = ({
        CGRect frame = emptyOverlayLabelb.frame;
        frame.origin.y = CGRectGetMaxY(emptyOverlayLabel.frame) + 10;
        frame;
    });
    
}

- (void)setTitle:(NSString *)title{
    emptyOverlayLabel.text = title;
}


-(void)setContent:(NSString *)content{
    emptyOverlayLabelb.text = content;
    
    
}



- (void)setupUIemptyOverlay {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPressUIemptyOverlay = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressUIemptyOverlay:)];
    [longPressUIemptyOverlay setMinimumPressDuration:0.001];
    [self addGestureRecognizer:longPressUIemptyOverlay];
    self.userInteractionEnabled = YES;
}

- (void)longPressUIemptyOverlay:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.emptyOverlayImageView.alpha = 0.4;
    }
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        self.emptyOverlayImageView.alpha = 1;
        if ([self.delegate respondsToSelector:@selector(emptyOverlayClicked:)]) {
            [self.delegate emptyOverlayClicked:nil];
        }
    }
}

@end
