//
//  ViewController.h
//  AppVadorSample
//
//  Created by Hirohide Sano on 2014/10/29.
//  Copyright (c) 2014年 AppVador Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AppVadorNative/AvAdView.h>

@interface ViewController : UIViewController<AvAdViewDelegate> {
    AvAdView *adView;
}
@end

