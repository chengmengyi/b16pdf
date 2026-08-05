import 'dart:convert';

import 'package:b16pdf/b16_hep_djijdow/b16_notification_hep_djiwdow/b16_notification_hep_jsowkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_media_unique_config_jidwjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_notification_time_fjiefjoe.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_custom_facebook/flutter_custom_facebook.dart';

class B16FirebaseHepDjiwjow{
  static final B16FirebaseHepDjiwjow _b16firebaseHepDjiwjow=B16FirebaseHepDjiwjow();
  static B16FirebaseHepDjiwjow get instance => _b16firebaseHepDjiwjow;

  FirebaseRemoteConfig? _b12allRemoteConfigVmqxtr;
  FirebaseAnalytics? _b12allFirebaseAnalyticsPqmvzr;

  bool _apex09HasInitFacebook = false;

  int b12allAdCooldownSecondsKqmvzr = 30;
  bool krPhoneShowNotification=false,clickSearchShowAd=false,clickFileShowAd=false,commentOpShow=false;
  int switch_per=0,switch_file=0;

  Future<void> b12allInitFirebaseXmqvtr() async {
    try {
      await Firebase.initializeApp();
      _b12allFirebaseAnalyticsPqmvzr ??= FirebaseAnalytics.instance;
      _b12allRemoteConfigVmqxtr = FirebaseRemoteConfig.instance;
      await _b12allRemoteConfigVmqxtr?.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(seconds: 1),
        ),
      );
      await _b12allRemoteConfigVmqxtr?.fetchAndActivate();
      b12allGetRemoteConfigVmqxtr();
    } catch (b12allErrorPqmvzr) {
      await Future.delayed(const Duration(milliseconds: 1000));
      return b12allInitFirebaseXmqvtr();
    }
  }

  void b12allGetRemoteConfigVmqxtr() {
    final int b12allNewOpenDurationSecondsKqmvzr =
        _b12allRemoteConfigVmqxtr?.getInt('new_op_cd') ?? 0;
    if (b12allNewOpenDurationSecondsKqmvzr > 0) {

    }

    final String b12allPdfAdConfigVmqxtr =
        _b12allRemoteConfigVmqxtr?.getString('pdf_ad_16') ?? '';
    if (b12allPdfAdConfigVmqxtr.isNotEmpty) {
      // B12allFirebaseAdConfigXmqvtr.b12allSaveConfigPqmvzr(
      //   b12allPdfAdConfigVmqxtr,
      // );
      // B12allAdUtilsFjiefje.b12allAdUtilsInstanceKqmvzr
      //     .b12allRefreshRemoteAdConfigKqmvzr();
    }

    var pdf_adfb = _b12allRemoteConfigVmqxtr?.getString("pdf_adfb")??"";
    if(pdf_adfb.isNotEmpty){
      // B12allAdUtilsFjiefje.b12allAdUtilsInstanceKqmvzr.updateFacebookAdConfig(pdf_adfb);
    }

    b12allGetAdCooldownConfigVmqxtr();

    final String b12allPrReferKqmvzr =
        _b12allRemoteConfigVmqxtr?.getString('pr_refer') ?? '';
    if (b12allPrReferKqmvzr.isNotEmpty) {
      // B12allReferrferConfigXmqvtr.b12allSaveConfigPqmvzr(b12allPrReferKqmvzr);
      // B12allUserUtilsFeojdd.b12allInstanceVmqxtr
      //     .b12allSetReferrerConfigVmqxtr();
    }

    final String b12allRiskControlVmqxtr =
        _b12allRemoteConfigVmqxtr?.getString('risk_control') ?? '';
    if (b12allRiskControlVmqxtr.isNotEmpty) {
      // B12allUserUtilsFeojdd.b12allInstanceVmqxtr.b12allInitRiskVmqxtr(
      //   b12allRiskControlVmqxtr,
      // );
    }

    final String b12allPushTimePqmvzr =
        _b12allRemoteConfigVmqxtr?.getString('push_time') ?? '';
    if (b12allPushTimePqmvzr.isNotEmpty) {
      B16NotificationTimeFjiefjoe.b16SaveDqnvya(b12allPushTimePqmvzr);
      B16NotificationHepJsowkosw.instance.b12allRefreshIntervalTimeChangeNotificationPqmvzr();
    }
    final int b12allMediaUniquePqmvzr =
        _b12allRemoteConfigVmqxtr?.getInt('pr_md_unique') ?? 0;
    if (b12allMediaUniquePqmvzr > 0) {
      B16MediaUniqueConfigJidwjow.b16SaveDqnvya(b12allMediaUniquePqmvzr);
      B16NotificationHepJsowkosw.instance.b12allInitMediaNotificationPqmvzr();
    }

    _apex09InitFacebook();

    var krsamsung_push_time = _b12allRemoteConfigVmqxtr?.getInt("krsamsung_push_time")??0;
    if(krsamsung_push_time>0){
      krPhoneShowNotification=krsamsung_push_time==1;
      B16NotificationHepJsowkosw.instance.initNotification();
    }

    switch_per=_b12allRemoteConfigVmqxtr?.getInt("switch_per")??0;
    switch_file=_b12allRemoteConfigVmqxtr?.getInt("switch_file")??0;
    _parseSwitchConfig();
  }

  _parseSwitchConfig(){
    try{
      var switch_config = _b12allRemoteConfigVmqxtr?.getString("switch_config")??"";
      var json = jsonDecode(switch_config);
      clickSearchShowAd=json["search_int"]!=0;
      clickFileShowAd=json["read_int"]!=0;
      commentOpShow=json["comment_op"]!=0;
    }catch(_){

    }
  }

  void b12allGetAdCooldownConfigVmqxtr() {
    final int b12allRemoteCooldownSecondsPqmvzr =
        _b12allRemoteConfigVmqxtr?.getInt('kc_cd') ?? 0;
    if (b12allRemoteCooldownSecondsPqmvzr > 0) {
      b12allAdCooldownSecondsKqmvzr = b12allRemoteCooldownSecondsPqmvzr;
    }
  }

  Future<void> _apex09InitFacebook() async {
    if (_apex09HasInitFacebook) {
      return;
    }
    final String apex09FacebookConfig = _b12allRemoteConfigVmqxtr?.getString("pr_fb") ?? "";
    if (apex09FacebookConfig.isEmpty) {
      return;
    }
    try {
      final dynamic apex09FacebookJson = jsonDecode(apex09FacebookConfig);
      final bool apex09Result = await FlutterCustomFacebook.instance
          .initFaceBook(
        facebookId: apex09FacebookJson["app_id"],
        facebookToken: apex09FacebookJson["token"],
        facebookAppName: "PDF Editer",
      );
      _apex09HasInitFacebook = apex09Result;
    } catch (_) {

    }
  }

  Future<void> apex09LogFacebookEvent(
      double apex09Amount,
      String apex09Currency,
      ) async {
    try {
      if (!_apex09HasInitFacebook) {
        return;
      }
      FlutterCustomFacebook.instance.logPurchase(
        amount: apex09Amount,
        currency: apex09Currency,
      );
    } catch (_) {

    }
  }


  Future<void> logFirebaseEvent({
    required String name,
    Map<String, Object>? params,
  }) async {
    try {
      if (Firebase.apps.isEmpty) {
        await b12allInitFirebaseXmqvtr();
      }
      _b12allFirebaseAnalyticsPqmvzr ??= FirebaseAnalytics.instance;
      await _b12allFirebaseAnalyticsPqmvzr?.logEvent(
        name: name,
        parameters: params,
      );
    } catch (_) {

    }
  }
}