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

    adView = [[AvAdView alloc] init:320 height:180];
    adView.appId = @"06d30ba01ff1dd95ad1e75a5f1b50124";
    adView.delegate = self;
    [adView preload];
    
    [self.view addSubview:adView];
}

- (void)readyToPlay:(AvAdView *)avadview {
    NSLog(@"ready to play ad");
    adView.frame = CGRectMake(0, 20, 160, 90);
    [avadview play];
}

- (void)didFailedToReceiveAd:(AvAdView *)avadview {
    NSLog(@"failed to receive ad");
    NSLog(@"%@", avadview.message);
}

- (void)didTapCloseButton:(AvAdView *)avadview {
    NSLog(@"tapped close button");
}

- (void)didFailedToPlayMovie:(AvAdView *)avadview {
    NSLog(@"failed to play fullsize movie when tapped adview");
}

- (void)didCompletePlayMovie:(AvAdView *)avadview {
    NSLog(@"completed fullsize movie");
}

- (void)didReplay:(AvAdView *)avadview {
    NSLog(@"did replay inline movie");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
