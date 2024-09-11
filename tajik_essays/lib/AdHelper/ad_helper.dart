import 'dart:developer';
import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:tajik_essays/main.dart';
import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get nativeAdUnitId {
    return Platform.isAndroid
        ? "ca-app-pub-3940256099942544/2247696110" // Replace with your interstitial ad unit ID
        : "ca-app-pub-3940256099942544/2247696110"; // Replace with your interstitial ad unit ID
  }

  static InterstitialAd? backButtonImageInterstitialAd;
  static bool isInterstitialAdOpened = false;
  static interstitialBackButtonImageAds() {
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback:
            InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
          backButtonImageInterstitialAd = ad;

          backButtonImageInterstitialAd?.fullScreenContentCallback =
              FullScreenContentCallback(
                  onAdFailedToShowFullScreenContent: (ad, error) {
            log("Fail To Show On Full Screen Ad Content===");
            // Navigator.pop(context);
            backButtonImageInterstitialAd = null;
          }, onAdShowedFullScreenContent: (ad) {
            log("Full Screen Content");
          }, onAdDismissedFullScreenContent: (ad) {
            log("On Add Dismissed = = 012345 ");
            interstitialBackButtonImageAds();
            Get.back();
          }, onAdWillDismissFullScreenContent: (ad) {
            log("message 00000000");
          });
        }, onAdFailedToLoad: (LoadAdError error) {
          backButtonImageInterstitialAd = null;
          // Get.back();
          log("Error While showing==");
          // InterstitialAdOpened.isInterstitialAdOpened.value = true;

          // interstitialBackButtonImageAds();
        }));
  }

  static showBackButtonInter() {
    if (backButtonImageInterstitialAd != null) {
      backButtonImageInterstitialAd!.show();
    } else {
      interstitialBackButtonImageAds();
    }
  }
}
