import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_name_fjeoifoe.dart';

abstract final class B16LocalSwitchConfigQazxsw {
  static String b16ReadConfigKqmwze() {
    return b16GetStorage.read<String>(
          B16StorageNameFjeoifoe.b16LocalSwitchConfigQazxsw,
        ) ??
        '';
  }

  static Future<void> b16SaveConfigVqntza(String b16ConfigHqmwza) {
    return b16GetStorage.write(
      B16StorageNameFjeoifoe.b16LocalSwitchConfigQazxsw,
      b16ConfigHqmwza,
    );
  }
}
