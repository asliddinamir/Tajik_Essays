// import 'dart:io';

// class AdHelper {
//   static String get bannerAdUnitId {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-3040413046352040/6444720585'; // Replace with your Banner Ad Unit ID for Android
//     } else if (Platform.isIOS) {
//       return 'ca-app-pub-3040413046352040/8579123436'; // Replace with your Banner Ad Unit ID for iOS
//     } else {
//       throw UnsupportedError('Unsupported platform');
//     }
//   }

//   static String get interstitialAdUnitId {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-3040413046352040/5952960093'; // Replace with your Interstitial Ad Unit ID for Android
//     } else if (Platform.isIOS) {
//       return 'ca-app-pub-3040413046352040/9334607801'; // Replace with your Interstitial Ad Unit ID for iOS
//     } else {
//       throw UnsupportedError('Unsupported platform');
//     }
//   }

//   static String get nativeAdUnitId {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-3040413046352040/6181830856'; // Replace with your Native Ad Unit ID for Android
//     } else if (Platform.isIOS) {
//       return 'ca-app-pub-3040413046352040/9333801909'; // Replace with your Native Ad Unit ID for iOS
//     } else {
//       throw UnsupportedError('Unsupported platform');
//     }
//   }
// }

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class AdHelper {
  static BannerAd? _bannerAd;
  // static bool _isBannerAdLoaded = false;
  static InterstitialAd? _interstitialAd;
  static RewardedAd? _rewardedAd;

  // Banner Ad
  static BannerAd? get bannerAd {
    if (_bannerAd == null) {
      _bannerAd = BannerAd(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/6300978111'
            : 'ca-app-pub-3940256099942544/2934735716',
        request: const AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            print('BannerAd loaded.');
            _isBannerAdLoaded = true;
          },
          onAdFailedToLoad: (ad, err) {
            print('BannerAd failed to load: $err');
            ad.dispose();
          },
        ),
      )..load();
    }
    return _bannerAd;
  }

  // Interstitial Ad
  static void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          print('InterstitialAd loaded.');
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  static void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null; // Dispose of the ad after showing
    } else {
      print('InterstitialAd is not loaded yet.');
    }
  }

  // Rewarded Ad
  static void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/5224354917'
          : 'ca-app-pub-3940256099942544/1712485313',
      request: const AdRequest(),
      adLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          print('RewardedAd loaded.');
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {
          print('RewardedAd failed to load: $error');
        },
      ),
    );
  }

  static void showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.show(onUserEarnedReward: (ad, reward) {
        print('User earned reward: $reward');
      });
      _rewardedAd = null; // Dispose of the ad after showing
    } else {
      print('RewardedAd is not loaded yet.');
    }
  }
}
