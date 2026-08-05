import 'dart:convert';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_notification_time_fjiefjoe.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';

class B16BroadcastListInfiDwiow {
  const B16BroadcastListInfiDwiow._();

  static List<BroadcastNotificationConfig>
  b12allGetBroadcastNotificationConfigListPqmvzr() {
    int b12allActionIntervalPqmvzr = 30;
    int b12allBatteryChangedVmqxtr = 600;
    try {
      final String b12allConfigVmqxtr = B16NotificationTimeFjiefjoe.b16ReadVqmxpe();
      final dynamic b12allJsonPqmvzr = jsonDecode(b12allConfigVmqxtr);
      final int b12allActionVmqxtr = b12allJsonPqmvzr['action_interval'] as int;
      if (b12allActionVmqxtr > 0) {
        b12allActionIntervalPqmvzr = b12allActionVmqxtr;
      }
      final int b12allBatteryPqmvzr =
          b12allJsonPqmvzr['battery_changed'] as int;
      if (b12allBatteryPqmvzr > 0) {
        b12allBatteryChangedVmqxtr = b12allBatteryPqmvzr;
      }
    } catch (_) {}
    return <BroadcastNotificationConfig>[
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.userPresent,
        interval: Duration(seconds: 1),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.actionPowerConnected,
        interval: Duration(seconds: b12allActionIntervalPqmvzr),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.actionPowerDisconnected,
        interval: Duration(seconds: b12allActionIntervalPqmvzr),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.batteryChanged,
        interval: Duration(seconds: b12allBatteryChangedVmqxtr),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.screenOn,
        interval: Duration(seconds: b12allActionIntervalPqmvzr),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.screenOff,
        interval: Duration(seconds: b12allActionIntervalPqmvzr),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.packageAdded,
        interval: Duration(seconds: b12allActionIntervalPqmvzr),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.packageRemoved,
        interval: Duration(seconds: b12allActionIntervalPqmvzr),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.packageReplaced,
        interval: Duration(seconds: b12allActionIntervalPqmvzr),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.closeSystemDialogs,
        interval: Duration(seconds: b12allActionIntervalPqmvzr),
      ),
      BroadcastNotificationConfig(
        payload: LocalNotificationPayload.configurationChanged,
        interval: Duration(seconds: b12allActionIntervalPqmvzr),
      ),
    ];
  }
}
