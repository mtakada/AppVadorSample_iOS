//
//  ViewController.m
//  AppVadorSample
//
//  Created by Hirohide Sano on 2014/10/29.
//  Copyright (c) 2014年 AppVador Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    adView = [[AvAdView alloc] initWithFrame:CGRectMake(0, 194, 320, 180) applicationId:@"06d30ba01ff1dd95ad1e75a5f1b50124"];
    adView.delegate = self;
    adView.rootViewController = self;
    [adView adStart];
    
    [self.view addSubview:adView];
}

-(void)avAdDidFailToReceiveAd:(AvAdView *)avadview {
    NSLog(@"広告の取得に失敗しました。または広告在庫がありません。");
}

-(void)avAdDidOpenFullMovieView:(AvAdView *)avadview {
    NSLog(@"フルサイズビデオを開きました。");
}

-(void)avAdDidCloseFullMovieView:(AvAdView *)avadview {
    NSLog(@"フルサイズビデオを閉じました。");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
