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

import 'dart:io';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String get bannerAdUnitId {
    return Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/6300978111' // Replace with your banner ad unit ID
        : 'ca-app-pub-3940256099942544/2934735716'; // Replace with your banner ad unit ID
  }

  static String get interstitialAdUnitId {
    return Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/1033173712' // Replace with your interstitial ad unit ID
        : 'ca-app-pub-3940256099942544/4411468910'; // Replace with your interstitial ad unit ID
  }
}
