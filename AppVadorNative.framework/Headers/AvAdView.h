//
//  AvAdView.h
//
//  Created by AppVador Inc.
//  Copyright (c) 2014年 AppVador Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol AvAdViewDelegate;

/**
 * 動画再生をView
 */
@interface AvAdView : UIView

@property(nonatomic) NSString *appId;
@property(nonatomic) NSString *userId;

@property(readonly) BOOL isReady;
@property(readonly) BOOL isPlaying;

@property(readonly) NSString *message;

@property (nonatomic,weak) id<AvAdViewDelegate> delegate;

- (id)init:(int)w height:(int)h;

-(void)preload;
-(void)play;
-(void)pause;
-(void)remove;
@end


@protocol AvAdViewDelegate <NSObject>

//再生準備完了
-(void)readyToPlay:(AvAdView*)avadview;

//リプレイ
-(void)didReplay:(AvAdView*)avadview;

//広告取得失敗
-(void)didFailedToReceiveAd:(AvAdView*)avadview;

//閉じるボタン押下時
-(void)didTapCloseButton:(AvAdView*)avadview;

//フルサイズムービーのロード失敗
-(void)didFailedToPlayMovie:(AvAdView*)avadview;
//フルサイズムービー再生完了
-(void)didCompletePlayMovie:(AvAdView*)avadview;

@end