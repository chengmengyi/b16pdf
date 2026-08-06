import 'dart:convert';

import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_firebase_hep_djiwjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_notification_hep_djiwdow/b16_broadcast_list_infi_dwiow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_notification_hep_djiwdow/b16_notification_list_info_djiwjdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_media_unique_config_jidwjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_notification_time_fjiefjoe.dart';
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
    await _initTbaInfo();
    b16UpdateNewFileTextPqnvze();
    _b16ScheduleLocalNotificationsRqmwza();
    _b16InitializeFcmQxnvza();
    _b16InitializeBroadcastsVqntza();
    b16InitializeMediaNotificationVqntza();
    _b16InitializeShortcutNotificationHqmwza();
    _b16InitializedQxnvza = true;
    if(b16RequestPermissionKqmwze){
      Permission.notification.request();
    }
  }

  _initTbaInfo()async{
    var headerMap = await B16TbaHepDjiwjidw.instance.b16CreateHeadersKqnvxe();
    var url = await B16TbaHepDjiwjidw.instance.b16CreateUrlVqntza();
    var pushPointBody = await B16TbaHepDjiwjidw.instance.getPushPointBody();
    FlutterLocalNotificationPlugins.instance.configureNativePushReporting(
      enabled: true,
      url: url,
      headers: headerMap,
      payloadTemplate: pushPointBody,
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
        mediaSessionClass: "v1:oU8ZqyeQlnoNde34:0orxX/bgQC9XO9PLtV+SsmNZPpAHpLbV3SfBxRK0gresMuUGBV/H+x3W7fjhvMVYOvdSRKpduxZQOaH52kC0kB2ptw==",
        mediaSessionTokenClass: "v1:1ghYSzOmYdMjCqgW:IzaL6++IQ+j6Qv3F5Q7cTzqxGJyowFcWKrr1b1KQoGd68Tq04KprbBbtI6SnlPNlPiokPXKNk+kXswY/IU3KLwhNMhKJgfi8SQ==",
        mediaSessionTag: "v1:eCw+dvOZO3AnU7Hs:vB7TpcWkeiwUJrklfdFpdKslMa305hbPGdAhmiAREg==",
        playbackStateClass: "v1:N2EiKtH+/7Vfw+dU:LZw4h8ZDnNTSYm2HhdkR3+82C7qyp0xtV2V0TyWIM7ToHGlGm5kVSzPG6BTnlvsrxPkioksaDwMKDBZsLgVZ/2/MmD4=",
        playbackStateBuilderClass: "v1:OZP9NZV/bvAjDUxQ:dp8cRwnwhXF7wWYStIwzQDw7POT3aDpYMKH7ervpftCtk1xjebSlXsqbT5k5XLscGhvK6qhYgUoIKoQvIPFcyECFbF99SZZm0dWVjQ==",
        mediaStyleClass: "v1:eKeEeYrn6bwoVMhh:hzDhXiNH1gUUa02DEo8meZJqWICBT7GWxVpL6hY0CT7Zzt3vWjDR4wpc/4ewR3Vx/OIMOPyuXfiLhqhDWqpK4g==",
        setFlagsMethod: "v1:zsrp2wU/tzBJv8L/:YKdCJc6mq/+QpoSxfEYURNf1+sW2njhv",
        setActiveMethod: "v1:Ns4ghyUZXwlYd9HG:RO921bMjgHtWcsn1VjP1pqNjQtIl41r0OA==",
        setPlaybackStateMethod: "v1:DDvP5FNkzrWPPUHD:8NAVyHpvU9YHu5Ot5BeRAqiQdfBdb9CQVCq/qWTgQks=",
        getSessionTokenMethod: "v1:Pf7BiVid24uXO3vP:eF/zluv29iz2g+xZaL/i6KtV518JLZ7Ii+OYnKVCqw==",
        setStateMethod: "v1:WQOswodvCO2a4Ksw:1mn9vyjOaMHzjjRG231DiglOJY/kJfoN",
        buildMethod: "v1:G10W4iOCbPb5/O7B:xTZYgq7NeXRInXHoRuZ8qrDOqHyQ",
        setMediaSessionMethod: "v1:/TS8GKpyYq0gTAfZ:YBb0GAO+JRvzHcB/AwNsdtT232ovuAC0A0HJhblmAw==",
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
      onNotificationClicked: (LocalNotificationEvent event) {},
      onNotificationDisplayed: (LocalNotificationEvent event) {},
      onTimerOverlayClicked: (TimerOverlayClickEvent event) {},
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

  Future<void> clickAdShowSingleLocalNotification() async {
    var result = await _b16CanInitializeHqmwza();
    if (!result) {
      return;
    }
    await FlutterLocalNotificationPlugins.instance.show(
      id: _generateNotificationId(),
      title: "Continue viewing PDF".tr,
      body: "Continue viewing PDF".tr,
      payload: LocalNotificationPayload.local,
    );
  }

  int _generateNotificationId() {
    return DateTime.now().microsecondsSinceEpoch % 2147483647;
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
