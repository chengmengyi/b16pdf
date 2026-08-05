import 'dart:convert';

import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_firebase_hep_djiwjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_notification_hep_djiwdow/b16_broadcast_list_infi_dwiow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_notification_hep_djiwdow/b16_notification_list_info_djiwjdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_media_unique_config_jidwjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_notification_time_fjiefjoe.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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
    b16UpdateNewFileTextPqnvze();
    _b16ScheduleLocalNotificationsRqmwza();
    _b16InitializeFcmQxnvza();
    _b16InitializeBroadcastsVqntza();
    b16InitializeMediaNotificationVqntza();
    _b16InitializeShortcutNotificationHqmwza();
    _b16InitializedQxnvza = true;
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
            "v1:nn0tXc5Od+hS/sWf:XEH2J5lXzlMMVQwY2GYIAXW6KaASNBc6kc4RpSPbW0d1xsnJG5lpFdr72ojBPM2m3I8Pzh3Ig7cjVnZ+9cpAvZclJA==",
        mediaSessionTokenClass:
            "v1:Z+yZd7FPZBKWWZGp:6am9hSogEmh7X8E3JcGNnMZJogkT12MN9079l6kbiTS0lbT8ov40Yn0+dU/gSDPqHbL+fkthDE2sFqWo2xrdOylD6eZYcBRUzg==",
        mediaSessionTag:
            "v1:I5j4fIatkJ/CM+ue:Lz39fiIH/DviIX4iFnA5r8smV7HvUaEoruGWs1RXEg==",
        playbackStateClass:
            "v1:W6YEE9LT5eIIaixt:zQihY/HQQjYz+Wk2v+7xmG5M02eKdMo1hjIoBo+3OaJLVdk+G01IohgPO4S01Jy+s12ZWA68dC6gUdljurdT8JWmRTE=",
        playbackStateBuilderClass:
            "v1:LJKUbATmdF6ndJIf:vAWhAXAXltCewPxN6ZNix4IeuuRscY0NuVu31+zzyxCp5LYDzGy3mCyC4egkLaLoOTmsMffbDKiwz07RcZW75BbmdF+qURjOzuHkWw==",
        mediaStyleClass:
            "v1:XQP+xaZArZLqfJ0R:CvzQc2XXVhEIb1gdnxyQU3bhuqTjgM+RnD3NGuSsmxNGCbFAXmUVSUSGIaPSdcyONyBxxds1ilFANgkFVWYZfQ==",
        setFlagsMethod: "v1:AGvsRtWFJR7HeDW1:3tsj70Sq8urwiyj6hf5GlkE8sx54ACSV",
        setActiveMethod:
            "v1:oXdZaE86p3B5Oe/E:RMFosa4/sk2IdRNx2YD+AFnDT4FYAVOeww==",
        setPlaybackStateMethod:
            "v1:T6QfG+YLxmqymOK2:ZYJkonBQNr2hD8W+1MPt+vkiwCDbWAj+EsFuqJrGDQg=",
        getSessionTokenMethod:
            "v1:yhSfQ74v5+//ZZxi:gDgtH9bzZMjcJVqJokXZLVPllzsuToeUm4ghqe+4vw==",
        setStateMethod: "v1:y3MiY/EVHC8QRm6A:G/aW3nMa/H0V8DdaBHwhEc27yNrzNiVs",
        buildMethod: "v1:vCSLtXLMGyWLnoRn:sBF+POEAlZWqvrNzF6FJfsQEB0+1",
        setMediaSessionMethod:
            "v1:2eXoGmd1RI6ehXmX:vM9VTwUP3Gx1kppQ9p+ICMjrgkPizsUxTOgyrkn6PA==",
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
      icon: 'b16_notification_logo_hwdiw',
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
