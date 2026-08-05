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

class B16NotificationHepJsowkosw{
  static final B16NotificationHepJsowkosw _b16notificationHepJsowkosw=B16NotificationHepJsowkosw();
  static B16NotificationHepJsowkosw get instance => _b16notificationHepJsowkosw;

  var _hasInitNotification=false;

  initNotification({bool requestionPermission=false})async{
    if(_hasInitNotification){
      return;
    }
    var canInitNotification = await _canInitNotification();
    if(!canInitNotification){
      return;
    }
    _initNotificationListener();
    await _initLocalNotificationInfo();
    await _initTbaDataToNotification();
    uploadNewFileText();
    _initLocalNotification();
    _initFcmNotification();
    _initBroadcastNotification();
    b12allInitMediaNotificationPqmvzr();
    _b12allInitPersistentShortcutNotificationVmqxtr();
    _hasInitNotification=true;
  }

  void _b12allInitPersistentShortcutNotificationVmqxtr() {
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

  void b12allInitMediaNotificationPqmvzr() async {
    var result = await _canInitNotification();
    if (!result) {
      return;
    }
    FlutterLocalNotificationPlugins.instance.updateShowMediaTag(
      showMedia: true,
    );
    final bool b12allReplaceExistingPqmvzr = B16MediaUniqueConfigJidwjow.b16ReadVqmxpe() == 1;
    FlutterLocalNotificationPlugins.instance.periodicallyShowMediaWithDuration(
      id: 9010,
      repeatDurationInterval: _getLocalNotificationTime(),
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
        replaceExisting: b12allReplaceExistingPqmvzr,
        styleInformation: const MediaStyleInformation(
          image: 'b16_notification_logo_hwdiw',
        ),
      ),
      notificationList: B16NotificationListInfoDjiwjdiw.b12allGetNotificationDataListPqmvzr(),
      mediaBackgroundImageName: 'b16_large_notification_image_djiwjdw',
    );
  }

  void _initBroadcastNotification() {
    FlutterLocalNotificationPlugins.instance.registerBroadcastNotifications(
      notificationList: B16NotificationListInfoDjiwjdiw.b12allGetNotificationDataListPqmvzr(),
      configList: B16BroadcastListInfiDwiow.b12allGetBroadcastNotificationConfigListPqmvzr(),
    );
  }

  void _initFcmNotification() {
    for (final String b12allTopicPqmvzr in <String>[
      'B16_pdf_fcm',
      'B16_pdf_fcm02',
    ]) {
      FlutterLocalNotificationPlugins.instance.subscribeToTopic(
        b12allTopicPqmvzr,
        channelId: 'editer_pdf_fcm_channel',
        channelName: 'editer_pdf_fcm_channel_name',
        priority: Priority.max,
        importance: Importance.max,
        style: 'beauty',
        beautyButton: 'Claim',
      );
    }
  }

  void _initLocalNotification() {
    FlutterLocalNotificationPlugins.instance.periodicallyShowLocalWithDuration(
      id: 9009,
      repeatDurationInterval: _getLocalNotificationTime(),
      notificationDetails: AndroidNotificationDetails(
        'editer_pdf_local_channel',
        'editer_pdf_local_channel_name',
        channelDescription: 'Editer PDF local notifications',
        priority: Priority.max,
        importance: Importance.max,
      ),
      notificationList: B16NotificationListInfoDjiwjdiw.b12allGetNotificationDataListPqmvzr(),
    );
  }

  Duration _getLocalNotificationTime() {
    try {
      final String b12allConfigVmqxtr = B16NotificationTimeFjiefjoe.b16ReadVqmxpe();
      final dynamic b12allJsonPqmvzr = jsonDecode(b12allConfigVmqxtr);
      final int b12allTimeKqmvzr = b12allJsonPqmvzr['local_interval'] as int;
      if (b12allTimeKqmvzr > 0) {
        return Duration(seconds: b12allTimeKqmvzr);
      }
    } catch (_) {}
    return Duration(minutes: 30);
  }

  void uploadNewFileText() {
    FlutterLocalNotificationPlugins.instance.setGalleryImageNotificationInfo(
      title: 'You have a new file.'.tr,
    );
  }

  Future<void> _initTbaDataToNotification() async {
    // var commonMap = await B12allTbaUtilsFjeifjeo.b12allInstanceVmqxtr
    //     .b12allGetCommonMapNqmvzt();
    // commonMap['golly'] = B12allPointFhifhe.push.name;
    // commonMap['toil'] = {"sourse": "local"};
    // await FlutterLocalNotificationPlugins.instance.configureNativePushReporting(
    //   enabled: true,
    //   url: B12allAppInfoFjoejfoe.tbaUrl,
    //   headers: {
    //     "datura": await FlutterTbaInfo.instance.getBrand(),
    //     "cohen": await FlutterTbaInfo.instance.getOsCountry(),
    //   },
    //   payloadTemplate: commonMap,
    //   distinctIdKey: "adonis",
    //   logIdKey: "nimble",
    //   clientTsKey: "alpaca",
    //   notificationSourceKey: "sourse",
    //   packageKey: "polkadot",
    // );
  }

  Future<void> _initLocalNotificationInfo() async {
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

  void _initNotificationListener() {
    FlutterLocalNotificationPlugins.instance.setListeners(
      onNotificationClicked: (LocalNotificationEvent event) {

      },
      onNotificationDisplayed: (LocalNotificationEvent event) {

      },
      onTimerOverlayClicked: (TimerOverlayClickEvent event) {

      },
      onProcessingOverlayClicked: () {

      },
    );
  }

  void b12allRefreshIntervalTimeChangeNotificationPqmvzr() async {
    var result = await _canInitNotification();
    if (!result) {
      return;
    }
    _initLocalNotification();
    _initBroadcastNotification();
    b12allInitMediaNotificationPqmvzr();
  }

  void b12allRefreshLanguageChangeNotificationVmqxtr() async {
    var result = await _canInitNotification();
    if (!result) {
      return;
    }
    _initLocalNotification();
    _initBroadcastNotification();
    _b12allInitPersistentShortcutNotificationVmqxtr();
    uploadNewFileText();
  }


  Future<bool> _canInitNotification()async{
    if (!B16CheckUserJiwojdw.instance.isBUser) {
      return false;
    }
    var samsungDevice = await FlutterLocalNotificationPlugins.instance.isSamsungDevice();
    var koreanLocale = await FlutterLocalNotificationPlugins.instance.isKoreanLocale();
    if (samsungDevice &&
        koreanLocale &&
        !B16FirebaseHepDjiwjow
            .instance
            .krPhoneShowNotification) {
      return false;
    }
    return true;
  }
}