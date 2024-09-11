import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'AdHelper/ad_helper.dart';
import 'controller/ads_controller.dart';
import 'theme.dart';
import 'custom_drawer.dart';
import 'essays_data.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((v) {
      if (mounted) {}
      AdHelper.interstitialBackButtonImageAds();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Essays in Tajik',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const EssaysListScreen(),
    );
  }
}

class EssaysListScreen extends StatefulWidget {
  const EssaysListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EssaysListScreenState createState() => _EssaysListScreenState();
}

class _EssaysListScreenState extends State<EssaysListScreen> {
  String searchQuery = '';
  final ScrollController _scrollController = ScrollController();
  late List<Map<String, String>> _filteredEssays;

  @override
  void initState() {
    super.initState();
    _filteredEssays = essayData;
  }

  void _filterEssays(String query) {
    setState(() {
      searchQuery = query;
      if (searchQuery.isEmpty) {
        _filteredEssays = essayData;
      } else {
        _filteredEssays = essayData
            .where((essay) => essay['title']!
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }

  BannerAd? detailImageTabBannerAdHigh;
  bool isDetailImageAdLoaded = false;

  detailImageScreenBannerAdHigh(BuildContext context) async {
    // AdsToast.showToast("Detail Image Banner High Request");
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      if (kDebugMode) {
        print('Unable to get height of anchored banner.');
      }
      return;
    }

    detailImageTabBannerAdHigh = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          // AdsToast.showToast("Detail Image Banner High ad Loaded");
          print("here ad is loaded check this==");

          print('$ad loaded: ${ad.responseInfo}');
          // _abMobState.updateIsImageBannerAdLoadedHigh(true);
          setState(() {
            detailImageTabBannerAdHigh = ad as BannerAd;
            isDetailImageAdLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          detailImageTabBannerAdHigh = null;
          // detailImageScreenBannerAdLow(context);

          // AdsToast.showToast("Detail Image Banner High ad Fail to Load");
          ad.dispose();
        },
      ),
    );
    detailImageTabBannerAdHigh!.load();
  }

  @override
  void didChangeDependencies() {
    detailImageScreenBannerAdHigh(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        },
        backgroundColor: Colors.blue,
        tooltip: 'To the Top',
        child: const Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 36, 112, 174),
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          // statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        toolbarHeight: 60.0,
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Эссе ва Иншоҳо ба тоҷикӣ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ҷустуҷӯи иншоҳо...',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.0,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onChanged: _filterEssays,
            ),
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 2,
          ),
          detailImageTabBannerAdHigh != null && isDetailImageAdLoaded
              ? SizedBox(
                  width: detailImageTabBannerAdHigh!.size.width.toDouble(),
                  height: detailImageTabBannerAdHigh!.size.height.toDouble(),
                  child: AdWidget(ad: detailImageTabBannerAdHigh!),
                )
              : Container(
                  height: MediaQuery.sizeOf(context).height * 0.09,
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.grey.withOpacity(0.5),
                  child: const Center(
                      child: Text("Loading Ad ...",
                          style: TextStyle(fontSize: 14))),
                ),
          const SizedBox(
            height: 2,
          ),
          const SizedBox(
            height: 0,
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              // Update the itemCount to account for the ads
              itemCount: _filteredEssays.length,
              itemBuilder: (context, index) {
                // Every 7th item, return an ad widget

                if ((index + 1) % 8 == 0) {
                  return AddNativeAd();
                } else {
                  // Calculate the actual index in the essays list, accounting for ads

                  int essayIndex = index;
                  // Return the regular essay list item
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 145, 145, 145)
                              .withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(6.0),
                      leading: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/logo.png',
                            height: 28,
                            width: 28,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${essayIndex + 1}. ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: const Color.fromARGB(
                                              255, 47, 46, 46),
                                          fontSize: 16.0,
                                        ),
                                  ),
                                  TextSpan(
                                    text: _filteredEssays[essayIndex]['title']!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: const Color.fromARGB(
                                              255, 47, 46, 46),
                                          fontSize: 16.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        log("message====00");
                        Navigator.of(context).push(_createPageTransition(
                          EssayDetailScreen(
                            title: _filteredEssays[essayIndex]['title'] ?? "",
                            content: _filteredEssays[essayIndex]
                                    ['full_content'] ??
                                "",
                          ),
                        ));
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  PageRouteBuilder _createPageTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}

class EssayDetailScreen extends StatefulWidget {
  final String title;
  final String content;

  const EssayDetailScreen({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  State<EssayDetailScreen> createState() => _EssayDetailScreenState();
}

class _EssayDetailScreenState extends State<EssayDetailScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((v) {
      if (AdHelper.backButtonImageInterstitialAd == null) {
        AdHelper.interstitialBackButtonImageAds();
      }
    });

    super.initState();
  }

  BackPressController backPressController = Get.put(BackPressController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (AdHelper.backButtonImageInterstitialAd != null) {
          backPressController.backPressCount++;
          if (backPressController.backPressCount.value >= 5) {
            log("Greater than 4");
            AdHelper.showBackButtonInter();
            backPressController.backPressCount.value = 0;
            return false;
          } else {
            log("Less than 4");
            return true;
          }
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Text(
              widget.content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 17.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddNativeAd extends StatefulWidget {
  const AddNativeAd({super.key});

  @override
  AddNativeAdState createState() => AddNativeAdState();
}

class AddNativeAdState extends State<AddNativeAd> {
  //ad setup

  NativeAd? nativeAd;
  bool isAdLoaded = false;
  @override
  void initState() {
    nativeAd = NativeAd(
        adUnitId: "ca-app-pub-3940256099942544/2247696110",
        //AdHelper.nativeAdUnitId,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isAdLoaded = true;
            });

            log("Ad Loaded");
          },
          onAdFailedToLoad: (ad, error) {
            log("Error == 123= ${error.toString()}");
            ad.dispose();
            setState(() {
              isAdLoaded = false;
            });
          },
        ),
        request: const AdRequest(),
        nativeTemplateStyle:
            NativeTemplateStyle(templateType: TemplateType.small));
    nativeAd!.load();
    super.initState();
  }

  @override
  void dispose() {
    nativeAd?.dispose();
    super.dispose();
  }

  @override
  //the card takes will either take editable form or view form
  Widget build(BuildContext context) {
    return isAdLoaded
        ? Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 90,
                child: AdWidget(ad: nativeAd!),
              ),
            ),
          )
        : Container(
            height: 1,
          );
  }
}
