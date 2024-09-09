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
