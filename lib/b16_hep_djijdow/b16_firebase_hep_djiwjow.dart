import 'dart:convert';

import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_notification_hep_djiwdow/b16_notification_hep_jsowkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_media_unique_config_jidwjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_notification_time_fjiefjoe.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_custom_facebook/flutter_custom_facebook.dart';

class B16FirebaseHepKqmwze {
  B16FirebaseHepKqmwze._();
  static final B16FirebaseHepKqmwze instance = B16FirebaseHepKqmwze._();

  FirebaseRemoteConfig? _b16RemoteConfigQxnvza;
  FirebaseAnalytics? _b16AnalyticsVqntza;

  bool _b16FacebookInitializedHqmwza = false;

  int b16AdCooldownSecondsPqnvze = 30;
  bool b16KoreanPhoneNotificationKqmwze = false;
  bool b16SearchInterstitialEnabledQxnvza = false;
  bool b16FileInterstitialEnabledVqntza = false;
  bool b16CommentOverlayEnabledHqmwza = false;
  int b16PermissionSwitchPqnvze = 0;
  int b16FileSwitchRqmwza = 0;

  Future<void> b16InitializeFirebaseQxnvza() async {
    try {
      await Firebase.initializeApp();
      _b16AnalyticsVqntza ??= FirebaseAnalytics.instance;
      _b16RemoteConfigQxnvza = FirebaseRemoteConfig.instance;
      await _b16RemoteConfigQxnvza?.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(seconds: 1),
        ),
      );
      await _b16RemoteConfigQxnvza?.fetchAndActivate();
      b16ApplyRemoteConfigVqntza();
    } catch (b16ErrorQxnvza) {
      await Future.delayed(const Duration(milliseconds: 1000));
      return b16InitializeFirebaseQxnvza();
    }
  }

  void b16ApplyRemoteConfigVqntza() {
    final int b16OpenCooldownQxnvza =
        _b16RemoteConfigQxnvza?.getInt('new_op_cd') ?? 0;
    if (b16OpenCooldownQxnvza > 0) {}

    final String b16PdfAdConfigKqmwze =
        _b16RemoteConfigQxnvza?.getString('pdf_ad_16') ?? '';
    if (b16PdfAdConfigKqmwze.isNotEmpty) {}

    final String b16FacebookAdConfigVqntza =
        _b16RemoteConfigQxnvza?.getString('pdf_adfb') ?? '';
    if (b16FacebookAdConfigVqntza.isNotEmpty) {}

    b16ApplyAdCooldownConfigHqmwza();

    final String b16ReferrerConfigPqnvze =
        _b16RemoteConfigQxnvza?.getString('pr_refer') ?? '';
    if (b16ReferrerConfigPqnvze.isNotEmpty) {}

    final String b16RiskConfigRqmwza =
        _b16RemoteConfigQxnvza?.getString('risk_control') ?? '';
    if (b16RiskConfigRqmwza.isNotEmpty) {
      B16UserCheckHepQxnvza.instance.b16InitializeRiskControlKqmwze(
        b16RiskConfigRqmwza,
      );
    }

    final String b16PushTimeConfigQxnvza =
        _b16RemoteConfigQxnvza?.getString('push_time') ?? '';
    if (b16PushTimeConfigQxnvza.isNotEmpty) {
      B16NotificationTimeFjiefjoe.b16SaveDqnvya(b16PushTimeConfigQxnvza);
      B16NotificationHepPqnvze.instance.b16RefreshScheduleKqmwze();
    }
    final int b16MediaUniqueQxnvza =
        _b16RemoteConfigQxnvza?.getInt('pr_md_unique') ?? 0;
    if (b16MediaUniqueQxnvza > 0) {
      B16MediaUniqueConfigJidwjow.b16SaveDqnvya(b16MediaUniqueQxnvza);
      B16NotificationHepPqnvze.instance.b16InitializeMediaNotificationVqntza();
    }

    _b16InitializeFacebookPqnvze();

    final int b16KoreanPushModeKqmwze =
        _b16RemoteConfigQxnvza?.getInt('krsamsung_push_time') ?? 0;
    if (b16KoreanPushModeKqmwze > 0) {
      b16KoreanPhoneNotificationKqmwze = b16KoreanPushModeKqmwze == 1;
      B16NotificationHepPqnvze.instance.b16InitializeNotificationsQxnvza();
    }

    b16PermissionSwitchPqnvze =
        _b16RemoteConfigQxnvza?.getInt('switch_per') ?? 0;
    b16FileSwitchRqmwza = _b16RemoteConfigQxnvza?.getInt('switch_file') ?? 0;
    _b16ParseSwitchConfigRqmwza();
  }

  void _b16ParseSwitchConfigRqmwza() {
    try {
      final String b16SwitchConfigQxnvza =
          _b16RemoteConfigQxnvza?.getString('switch_config') ?? '';
      final dynamic b16SwitchJsonVqntza = jsonDecode(b16SwitchConfigQxnvza);
      b16SearchInterstitialEnabledQxnvza =
          b16SwitchJsonVqntza['search_int'] != 0;
      b16FileInterstitialEnabledVqntza = b16SwitchJsonVqntza['read_int'] != 0;
      b16CommentOverlayEnabledHqmwza = b16SwitchJsonVqntza['comment_op'] != 0;
    } catch (_) {}
  }

  void b16ApplyAdCooldownConfigHqmwza() {
    final int b16RemoteCooldownQxnvza =
        _b16RemoteConfigQxnvza?.getInt('kc_cd') ?? 0;
    if (b16RemoteCooldownQxnvza > 0) {
      b16AdCooldownSecondsPqnvze = b16RemoteCooldownQxnvza;
    }
  }

  Future<void> _b16InitializeFacebookPqnvze() async {
    if (_b16FacebookInitializedHqmwza) {
      return;
    }
    final String b16FacebookConfigQxnvza =
        _b16RemoteConfigQxnvza?.getString('pr_fb') ?? '';
    if (b16FacebookConfigQxnvza.isEmpty) {
      return;
    }
    try {
      final dynamic b16FacebookJsonVqntza = jsonDecode(b16FacebookConfigQxnvza);
      final bool b16InitializedKqmwze = await FlutterCustomFacebook.instance
          .initFaceBook(
            facebookId: b16FacebookJsonVqntza['app_id'],
            facebookToken: b16FacebookJsonVqntza['token'],
            facebookAppName: "PDF Editer",
          );
      _b16FacebookInitializedHqmwza = b16InitializedKqmwze;
    } catch (_) {}
  }

  Future<void> b16LogFacebookPurchaseKqmwze(
    double b16AmountQxnvza,
    String b16CurrencyVqntza,
  ) async {
    try {
      if (!_b16FacebookInitializedHqmwza) {
        return;
      }
      FlutterCustomFacebook.instance.logPurchase(
        amount: b16AmountQxnvza,
        currency: b16CurrencyVqntza,
      );
    } catch (_) {}
  }

  Future<void> b16LogAnalyticsEventVqntza({
    required String b16NameQxnvza,
    Map<String, Object>? b16ParametersKqmwze,
  }) async {
    try {
      if (Firebase.apps.isEmpty) {
        await b16InitializeFirebaseQxnvza();
      }
      _b16AnalyticsVqntza ??= FirebaseAnalytics.instance;
      await _b16AnalyticsVqntza?.logEvent(
        name: b16NameQxnvza,
        parameters: b16ParametersKqmwze,
      );
    } catch (_) {}
  }
}
