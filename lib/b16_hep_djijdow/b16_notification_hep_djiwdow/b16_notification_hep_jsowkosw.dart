import 'dart:async';
import 'dart:convert';

import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_applife_hep_fjeifje.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_firebase_hep_djiwjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_cold_launcher_source_hep_jiwjdow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_hot_launcher_source_hep_djiwdjw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_launcher_click_gate_hep_qxnvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_notification_hep_djiwdow/b16_broadcast_list_infi_dwiow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_notification_hep_djiwdow/b16_notification_list_info_djiwjdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_media_unique_config_jidwjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_notification_time_fjiefjoe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_point_type_jdwijdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_tba_hep_djiwjidw.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:permission_handler/permission_handler.dart';

class B16NotificationHepPqnvze {
  B16NotificationHepPqnvze._();
  static final B16NotificationHepPqnvze instance = B16NotificationHepPqnvze._();

  bool _b16InitializedQxnvza = false;

  Future<void> b16InitializeNotificationsQxnvza({
    bool b16RequestPermissionKqmwze = false,
  }) async {
    if (_b16InitializedQxnvza) {
      return;
    }
    final bool b16CanInitializeVqntza = await _b16CanInitializeHqmwza();
    if (!b16CanInitializeVqntza) {
      return;
    }
    _b16InitializeListenersKqmwze();
    await _b16InitializeLocalInfoVqntza();
    await _b16InitializeTbaInfoPqnvze();
    b16UpdateNewFileTextPqnvze();
    _b16ScheduleLocalNotificationsRqmwza();
    _b16InitializeFcmQxnvza();
    _b16InitializeBroadcastsVqntza();
    b16InitializeMediaNotificationVqntza();
    _b16InitializeShortcutNotificationHqmwza();
    _b16InitializedQxnvza = true;
    if (b16RequestPermissionKqmwze) {
      Permission.notification.request();
    }
  }

  Future<bool> hasNotificationPermission()async{
    var permissionStatus = await Permission.notification.status;
    var isGranted = permissionStatus.isGranted || permissionStatus.isLimited;
    return isGranted;
  }

  Future<void> _b16InitializeTbaInfoPqnvze() async {
    final Map<String, String> b16HeaderMapQxnvza = Map<String, String>.from(
      await B16TbaHepDjiwjidw.instance.b16CreateHeadersKqnvxe(),
    );
    final String b16RequestUrlKqmwze = await B16TbaHepDjiwjidw.instance
        .b16CreateUrlVqntza();
    final Map<String, dynamic> b16PushPayloadVqntza = await B16TbaHepDjiwjidw
        .instance
        .getPushPointBody();
    FlutterLocalNotificationPlugins.instance.configureNativePushReporting(
      enabled: true,
      url: b16RequestUrlKqmwze,
      headers: b16HeaderMapQxnvza,
      payloadTemplate: b16PushPayloadVqntza,
      distinctIdKey: "secular",
      logIdKey: "sorority",
      clientTsKey: "germinal",
      notificationSourceKey: "vaccine~sourse",
      packageKey: "baggage",
    );
  }

  void _b16InitializeShortcutNotificationHqmwza() {
    FlutterLocalNotificationPlugins.instance.showPersistentShortcutNotification(
      homeText: 'Home'.tr,
      mergeText: 'Scan'.tr,
      importText: 'Word to PDF'.tr,
      convertText: 'Image to PDF'.tr,
      homeIcon: 'b16_func_home',
      mergeIcon: 'b16_func_scan',
      importIcon: 'b16_func_word',
      convertIcon: 'b16_func_pdf',
    );
  }

  Future<void> b16InitializeMediaNotificationVqntza() async {
    final bool b16CanInitializeQxnvza = await _b16CanInitializeHqmwza();
    if (!b16CanInitializeQxnvza) {
      return;
    }
    FlutterLocalNotificationPlugins.instance.updateShowMediaTag(
      showMedia: true,
    );
    final bool b16ReplaceExistingKqmwze =
        B16MediaUniqueConfigJidwjow.b16ReadVqmxpe() == 1;
    FlutterLocalNotificationPlugins.instance.periodicallyShowMediaWithDuration(
      id: 9010,
      repeatDurationInterval: _b16NotificationIntervalPqnvze(),
      title: 'PDF Edit',
      body: 'PDF Edit Body',
      reflectionConfig: MediaReflectionConfig(
        secret: B16LocalInfoFjeifjioe.secretKey,
        mediaSessionClass:
            "v1:oU8ZqyeQlnoNde34:0orxX/bgQC9XO9PLtV+SsmNZPpAHpLbV3SfBxRK0gresMuUGBV/H+x3W7fjhvMVYOvdSRKpduxZQOaH52kC0kB2ptw==",
        mediaSessionTokenClass:
            "v1:1ghYSzOmYdMjCqgW:IzaL6++IQ+j6Qv3F5Q7cTzqxGJyowFcWKrr1b1KQoGd68Tq04KprbBbtI6SnlPNlPiokPXKNk+kXswY/IU3KLwhNMhKJgfi8SQ==",
        mediaSessionTag:
            "v1:eCw+dvOZO3AnU7Hs:vB7TpcWkeiwUJrklfdFpdKslMa305hbPGdAhmiAREg==",
        playbackStateClass:
            "v1:N2EiKtH+/7Vfw+dU:LZw4h8ZDnNTSYm2HhdkR3+82C7qyp0xtV2V0TyWIM7ToHGlGm5kVSzPG6BTnlvsrxPkioksaDwMKDBZsLgVZ/2/MmD4=",
        playbackStateBuilderClass:
            "v1:OZP9NZV/bvAjDUxQ:dp8cRwnwhXF7wWYStIwzQDw7POT3aDpYMKH7ervpftCtk1xjebSlXsqbT5k5XLscGhvK6qhYgUoIKoQvIPFcyECFbF99SZZm0dWVjQ==",
        mediaStyleClass:
            "v1:eKeEeYrn6bwoVMhh:hzDhXiNH1gUUa02DEo8meZJqWICBT7GWxVpL6hY0CT7Zzt3vWjDR4wpc/4ewR3Vx/OIMOPyuXfiLhqhDWqpK4g==",
        setFlagsMethod: "v1:zsrp2wU/tzBJv8L/:YKdCJc6mq/+QpoSxfEYURNf1+sW2njhv",
        setActiveMethod:
            "v1:Ns4ghyUZXwlYd9HG:RO921bMjgHtWcsn1VjP1pqNjQtIl41r0OA==",
        setPlaybackStateMethod:
            "v1:DDvP5FNkzrWPPUHD:8NAVyHpvU9YHu5Ot5BeRAqiQdfBdb9CQVCq/qWTgQks=",
        getSessionTokenMethod:
            "v1:Pf7BiVid24uXO3vP:eF/zluv29iz2g+xZaL/i6KtV518JLZ7Ii+OYnKVCqw==",
        setStateMethod: "v1:WQOswodvCO2a4Ksw:1mn9vyjOaMHzjjRG231DiglOJY/kJfoN",
        buildMethod: "v1:G10W4iOCbPb5/O7B:xTZYgq7NeXRInXHoRuZ8qrDOqHyQ",
        setMediaSessionMethod:
            "v1:/TS8GKpyYq0gTAfZ:YBb0GAO+JRvzHcB/AwNsdtT232ovuAC0A0HJhblmAw==",
      ),
      notificationDetails: AndroidNotificationDetails(
        'pdf_media_notification_channel',
        'pdf_media_notification_channel_name',
        channelDescription: 'pdf media notification desc',
        priority: Priority.high,
        importance: Importance.high,
        replaceExisting: b16ReplaceExistingKqmwze,
        styleInformation: const MediaStyleInformation(
          image: 'b16_notification_logo_hwdiw',
        ),
      ),
      notificationList:
          B16NotificationContentHepHqmwza.b16BuildContentsKqmwze(),
      mediaBackgroundImageName: 'b16_large_notification_image_djiwjdw',
    );
  }

  void _b16InitializeBroadcastsVqntza() {
    FlutterLocalNotificationPlugins.instance.registerBroadcastNotifications(
      notificationList:
          B16NotificationContentHepHqmwza.b16BuildContentsKqmwze(),
      configList: B16BroadcastConfigHepVqntza.b16BuildConfigsKqmwze(),
    );
  }

  void _b16InitializeFcmQxnvza() {
    for (final String b16TopicKqmwze in <String>[
      'B16_pdf_fcm',
      'B16_pdf_fcm02',
    ]) {
      FlutterLocalNotificationPlugins.instance.subscribeToTopic(
        b16TopicKqmwze,
        channelId: 'editer_pdf_fcm_channel',
        channelName: 'editer_pdf_fcm_channel_name',
        priority: Priority.max,
        importance: Importance.max,
        style: 'beauty',
        beautyButton: 'Claim',
      );
    }
  }

  void _b16ScheduleLocalNotificationsRqmwza() {
    FlutterLocalNotificationPlugins.instance.periodicallyShowLocalWithDuration(
      id: 9009,
      repeatDurationInterval: _b16NotificationIntervalPqnvze(),
      notificationDetails: AndroidNotificationDetails(
        'editer_pdf_local_channel',
        'editer_pdf_local_channel_name',
        channelDescription: 'Editer PDF local notifications',
        priority: Priority.max,
        importance: Importance.max,
      ),
      notificationList:
          B16NotificationContentHepHqmwza.b16BuildContentsKqmwze(),
    );
  }

  Duration _b16NotificationIntervalPqnvze() {
    try {
      final String b16ConfigTextQxnvza =
          B16NotificationTimeFjiefjoe.b16ReadVqmxpe();
      final dynamic b16ConfigJsonVqntza = jsonDecode(b16ConfigTextQxnvza);
      final int b16IntervalSecondsKqmwze =
          b16ConfigJsonVqntza['local_interval'] as int;
      if (b16IntervalSecondsKqmwze > 0) {
        return Duration(seconds: b16IntervalSecondsKqmwze);
      }
    } catch (_) {}
    return Duration(minutes: 30);
  }

  void b16UpdateNewFileTextPqnvze() {
    FlutterLocalNotificationPlugins.instance.setGalleryImageNotificationInfo(
      title: 'You have a new file.'.tr,
    );
  }

  Future<void> _b16InitializeLocalInfoVqntza() async {
    await FlutterLocalNotificationPlugins.instance.initNotification(
      icon: 'b16_small_logo_jieoef',
      channelId: 'editer_pdf_channel',
      channelName: 'editer_pdf_channel_name',
      channelDescription: 'Editer PDF notifications',
      customLayout: AndroidCustomNotificationLayout(
        smallLayoutName: 'b16_small_notification_layout',
        bigLayoutName: 'b16_large_notification_layout',
        actionText: 'Check'.tr,
      ),
      showMedia: true,
    );
  }

  void _b16InitializeListenersKqmwze() {
    FlutterLocalNotificationPlugins.instance.setListeners(
      onNotificationClicked: (LocalNotificationEvent b16EventQxnvza) {
        if (!B16LauncherClickGateHepQxnvza
            .instance
            .b16CanHandleNotificationClickKqnvxe) {
          return;
        }
        final String b16PayloadVqntza =
            b16EventQxnvza.payload ?? b16EventQxnvza.payloadType?.name ?? '';
        B16HotLauncherSourceHepDjiwdjw.instance
            .b16RecordNotificationSourcePqnvze(b16PayloadVqntza);
        _b16UploadClickEventKqmwze(b16PayloadVqntza);
        unawaited(
          B16ApplifeHepFjeifje.instance.showAd(
            B16AdSceneJdwo.pr_launch,
            b16PayloadVqntza == 'media'
                ? B16PosidJkwkosw.pr_open_mediapop
                : B16PosidJkwkosw.pr_open_noti,
          ),
        );
      },
      onNotificationDisplayed: (LocalNotificationEvent b16EventVqntza) {
        _b16UploadShowEventHqmwza(
          b16EventVqntza.payload ?? b16EventVqntza.payloadType?.name ?? '',
        );
      },
      onTimerOverlayClicked: (TimerOverlayClickEvent b16EventPqnvze) {},
      onProcessingOverlayClicked: () {},
    );
  }

  Future<void> b16RefreshScheduleKqmwze() async {
    final bool b16CanInitializeQxnvza = await _b16CanInitializeHqmwza();
    if (!b16CanInitializeQxnvza) {
      return;
    }
    _b16ScheduleLocalNotificationsRqmwza();
    _b16InitializeBroadcastsVqntza();
    b16InitializeMediaNotificationVqntza();
  }

  Future<void> b16RefreshLanguageKqmwze() async {
    final bool b16CanInitializeQxnvza = await _b16CanInitializeHqmwza();
    if (!b16CanInitializeQxnvza) {
      return;
    }
    _b16ScheduleLocalNotificationsRqmwza();
    _b16InitializeBroadcastsVqntza();
    _b16InitializeShortcutNotificationHqmwza();
    b16UpdateNewFileTextPqnvze();
  }

  Future<void> b16ShowAdClickNotificationKqnvxe() async {
    final bool b16CanInitializePqmxza = await _b16CanInitializeHqmwza();
    if (!b16CanInitializePqmxza) {
      return;
    }
    await FlutterLocalNotificationPlugins.instance.show(
      id: _b16GenerateNotificationIdVqntze(),
      title: "Continue viewing PDF".tr,
      body: "Continue viewing PDF".tr,
      payload: LocalNotificationPayload.local,
    );
  }

  int _b16GenerateNotificationIdVqntze() {
    return DateTime.now().microsecondsSinceEpoch % 2147483647;
  }

  void b16UploadNotificationEventDataRqmwza() {
    if (B16ColdLauncherSourceHepJiwjdow.instance.notificationPayload != null) {
      _b16UploadClickEventKqmwze(
        B16ColdLauncherSourceHepJiwjdow.instance.notificationPayload ?? '',
      );
    }
    b16UploadPendingNotificationEventsTqnvze();
  }

  Future<void> b16UploadPendingNotificationEventsTqnvze() async {
    for (final LocalNotificationPayload b16PayloadQxnvza
        in LocalNotificationPayload.values) {
      final int b16DisplayedCountKqmwze = await FlutterLocalNotificationPlugins
          .instance
          .consumeDisplayedNotificationCount(payload: b16PayloadQxnvza);
      if (b16DisplayedCountKqmwze > 0) {
        for (
          int b16IndexVqntza = 0;
          b16IndexVqntza < b16DisplayedCountKqmwze;
          b16IndexVqntza++
        ) {
          _b16UploadShowEventHqmwza(b16PayloadQxnvza.value);
        }
      }
    }
  }

  void _b16UploadClickEventKqmwze(String? b16EventSourceQxnvza) {
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.inform_c,
      b16ParametersKqmwze: {'sourse': b16EventSourceQxnvza},
    );
  }

  void _b16UploadShowEventHqmwza(String b16EventSourceVqntza) {
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.push,
      b16ParametersKqmwze: {'sourse': b16EventSourceVqntza},
    );
  }

  Future<bool> _b16CanInitializeHqmwza() async {
    if (!B16UserCheckHepQxnvza.instance.b16IsEligibleUserVqntza) {
      return false;
    }
    final bool b16SamsungDeviceQxnvza = await FlutterLocalNotificationPlugins
        .instance
        .isSamsungDevice();
    final bool b16KoreanLocaleVqntza = await FlutterLocalNotificationPlugins
        .instance
        .isKoreanLocale();
    if (b16SamsungDeviceQxnvza &&
        b16KoreanLocaleVqntza &&
        !B16FirebaseHepKqmwze.instance.b16KoreanPhoneNotificationKqmwze) {
      return false;
    }
    return true;
  }
}
