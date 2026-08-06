import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';

class B16LauncherSourceHepJiwjdow {
  static final B16LauncherSourceHepJiwjdow _b16launcherSourceHepJiwjdow =
      B16LauncherSourceHepJiwjdow();
  static B16LauncherSourceHepJiwjdow get instance =>
      _b16launcherSourceHepJiwjdow;

  String? notificationPayload;
  String? b16QuickActionTypeKqmwze;

  void b16RecordQuickActionSourceQxnvza(String b16ShortcutTypeVqntza) {
    b16QuickActionTypeKqmwze = b16ShortcutTypeVqntza;
  }

  Future<void> initSource() async {
    await _b12allInitNotificationLaunchSourcePqmvzr();
  }

  Future<void> _b12allInitNotificationLaunchSourcePqmvzr() async {
    var localNotificationAppLaunchDetails =
        await FlutterLocalNotificationPlugins.instance
            .getNotificationAppLaunchDetails();
    if (localNotificationAppLaunchDetails.didNotificationLaunchApp == true) {
      notificationPayload =
          localNotificationAppLaunchDetails.notificationResponse?.payload ??
          localNotificationAppLaunchDetails
              .notificationResponse
              ?.payloadType
              ?.name;
    }
  }
}
