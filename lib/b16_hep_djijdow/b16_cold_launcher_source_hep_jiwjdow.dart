import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';

class B16ColdLauncherSourceHepJiwjdow {
  static final B16ColdLauncherSourceHepJiwjdow _b16launcherSourceHepJiwjdow =
      B16ColdLauncherSourceHepJiwjdow();
  static B16ColdLauncherSourceHepJiwjdow get instance =>
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
    print("kk==localNotificationAppLaunchDetails===${localNotificationAppLaunchDetails.didNotificationLaunchApp}==${localNotificationAppLaunchDetails.notificationResponse?.payload}");
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
