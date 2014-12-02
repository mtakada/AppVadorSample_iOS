AppVador SDK
===================

## はじめに

管理画面より最新のAppVador.frameworkをダウンロードし、対象プロジェクトに追加ください。
テスト用の広告IDは下記の通りです。

    06d30ba01ff1dd95ad1e75a5f1b50124

また、本番環境用にビルドする際は必ず管理画面から取得した広告枠IDに変更ください。
*テスト用IDのまま公開された場合、収益は一切発生しません！*

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

    #import <AppVador/AvAdView.h>


実装はdidFinishLaunchingWithOptionsやviewDidLoadなどの箇所に実装してください。

    - (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
    - (void)viewDidLoad;

また、広告の読込完了等の通知にAvAdViewDelegateを利用します。

例：テーブルビューコントローラーの場合

    @interface ViewController : UITableViewController<AvAdViewDelegate> {
        AvAdView *avAdView;
    }

### Viewの初期化

Viewを初期化します。
initメソッドの第2引数は広告枠IDとなり、本番環境と開発環境で別になります。
本番リリースにあたっては*必ず見直してください*。

    //モバイルビデオアド
    AvAdView *adView = [[AvAdView alloc] initWithFrame:CGRectMake(0, 194, 320, 180)
                               applicationId:@"広告枠ID"];
    adView.delegate = self;
    adView.rootViewController = self;

広告枠のサイズはアスペクト比16:9を基準としています。
配信される動画のほとんどがこのアスペクト比で制作されているため、比率の違う広告枠の場合は上下または左右に黒い帯が付加されます。
最低サイズの縦300ピクセル x 横168ピクセルより大きければサイズは自由に設定頂いて問題ございません。

### 動画広告の読込

初期化したAvAdViewのpreloadメソッドを実行すると動画広告が読み込まれます。

    [adView adStart];

広告枠の50%がスクリーンに表示されている場合に再生が開始します。
これよりも広告枠の表示領域が小さい場合にはビデオの再生は停止します。
アプリケーションの実装方法により、この表示領域検知が誤作動する場合がございます。
その場合にはサポートまでお問い合わせください。


### 広告の読み込み失敗、成功状況の取得

AvAdViewDelegateには、広告の読込失敗などを通知する機能があります。

    @interface AppVadorSample : UIViewController <AvAdViewDelegate>

    -(void)avAdDidOpenFullMovieView:(AvAdView*)avadview {
        // 動画の全画面再生が開始した際に呼ばれます。
        // 動画の音声が流れますので、BGMのあるアプリケーションではここでBGMのストップ処理をしてください。
    }

    -(void)avAdDidCloseFullMovieView:(AvAdView*)avadview {
        // 動画の全画面再生が終了した際に呼ばれます。
        // BGMのあるアプリケーションではここでBGMの再開処理をしてください。
    }

    -(void)avAdDidFinishedLoad:(AvAdView*)avadview {
        //広告の読み込み完了時に呼ばれます。
    }

    -(void)avAdDidFailToReceiveAd:(AvAdView*)avadview {
        // 広告の読込失敗時に呼ばれます。
        // 配信サーバーの停止時や広告在庫切れの際にも呼ばれます。
        // ここで広告枠の削除処理をしてください。

        if (avadview) {
            avadview.hidden = YES;
            [avadview remove];
            avadview = nil;
        }
    }

