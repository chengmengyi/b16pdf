import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_name_fjeoifoe.dart';

class B16NotificationTimeFjiefjoe {
  const B16NotificationTimeFjiefjoe._();

  static Future<void> b16SaveDqnvya(String config) async {
    await b16GetStorage.write(
      B16StorageNameFjeoifoe.b16NotificationTime,
      config,
    );
  }

  static String b16ReadVqmxpe() {
    return b16GetStorage.read<String>(
          B16StorageNameFjeoifoe.b16NotificationTime,
        ) ??
        '{"local_interval":1800,"action_interval":30,"battery_changed":600}';
  }
}
