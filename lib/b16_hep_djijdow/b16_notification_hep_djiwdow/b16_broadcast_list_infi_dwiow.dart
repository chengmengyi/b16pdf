import 'dart:convert';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_notification_time_fjiefjoe.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';

class B16BroadcastConfigHepVqntza {
  const B16BroadcastConfigHepVqntza._();

  static List<BroadcastNotificationConfig> b16BuildConfigsKqmwze() {
    int b16ActionIntervalQxnvza = 30;
    int b16BatteryIntervalVqntza = 600;
    try {
      final String b16ConfigTextQxnvza =
          B16NotificationTimeFjiefjoe.b16ReadVqmxpe();
      final dynamic b16ConfigJsonKqmwze = jsonDecode(b16ConfigTextQxnvza);
      final int b16ActionSecondsVqntza =
          b16ConfigJsonKqmwze['action_interval'] as int;
      if (b16ActionSecondsVqntza > 0) {
        b16ActionIntervalQxnvza = b16ActionSecondsVqntza;
      }
      final int b16BatterySecondsPqnvze =
          b16ConfigJsonKqmwze['battery_changed'] as int;
      if (b16BatterySecondsPqnvze > 0) {
        b16BatteryIntervalVqntza = b16BatterySecondsPqnvze;
      }
    } catch (_) {}
    return <BroadcastNotificationConfig>[
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.userPresent,
        interval: Duration(seconds: 1),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.actionPowerConnected,
        interval: Duration(seconds: b16ActionIntervalQxnvza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.actionPowerDisconnected,
        interval: Duration(seconds: b16ActionIntervalQxnvza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.batteryChanged,
        interval: Duration(seconds: b16BatteryIntervalVqntza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.screenOn,
        interval: Duration(seconds: b16ActionIntervalQxnvza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.screenOff,
        interval: Duration(seconds: b16ActionIntervalQxnvza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.packageAdded,
        interval: Duration(seconds: b16ActionIntervalQxnvza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.packageRemoved,
        interval: Duration(seconds: b16ActionIntervalQxnvza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.packageReplaced,
        interval: Duration(seconds: b16ActionIntervalQxnvza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.closeSystemDialogs,
        interval: Duration(seconds: b16ActionIntervalQxnvza),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.configurationChanged,
        interval: Duration(seconds: b16ActionIntervalQxnvza),
      ),
    ];
  }
}
