AppVador Native SDK
===================

## SDKの取得

本プロジェクト内のAppVadorNative.frameworkを対象プロジェクトに追加ください。

## Frameworkのインポート

下記フレームワークを利用します。
それぞれXCodeより追加ください。

- CoreTelephony
- AdSupport
- AvFoundation
- CoreMedia

## プレミアムビデオアドの実装

### SDKのインポート

ヘッダに下記を追加ください。

#import <AppVadorNative/AvAdView.h>

また、広告の読込完了等の通知にAvAdViewDelegateを利用します。

例：テーブルビューコントローラーの場合

@interface ViewController : UITableViewController<AvAdViewDelegate> {
    AvAdView *avAdView;
}

### Viewの初期化

Viewを初期化します。
initメソッドの引数は広告枠IDとなり、本番環境と開発環境で別になります。

adView = [[AvAdView alloc] init:320 height:180];
adView.appId = @"06d30ba01ff1dd95ad1e75a5f1b50124";
adView.delegate = self;

### 動画広告の読込

初期化したAvAdViewのpreloadメソッドを実行すると動画広告が読み込まれます。

[adView preload];

読込が完了すると、delegateからapvAdDidFinishedLoadが呼ばれます。
このdelegateメソッド内でplayメソッドを実行することで動画広告の再生が始まります。

- (void) readyToPlay:(AvAdView *)adView {
    [adView play];
}

規定ではユーザーから見えている範囲内（Viewable area）での再生開始となりますが任意のタイミングで実行可能です。
再生範囲外に出た場合などは[adView pause]メソッドを実行し動画広告の再生を停止してください。

また、このタイミングで読み込みに失敗するとapvDidFailedToReceiveAdメソッドが呼ばれます。
広告表示領域の削除などにご利用ください。


## AvAdView

下記のメソッドを持ちます。

- (void)preload // 渡されたIDに該当する動画広告を読み込みます。
- (void)play // 再生を開始します。preloadの読み込みが完了していない場合何も起きません。
- (void)pause // 再生を停止します。