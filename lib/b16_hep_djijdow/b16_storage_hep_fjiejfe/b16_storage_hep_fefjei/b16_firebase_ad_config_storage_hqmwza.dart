import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_name_fjeoifoe.dart';

abstract final class B16FirebaseAdConfigStorageHqmwza {
  static String b16ReadConfigKqnvxe() {
    return b16GetStorage.read<String>(
          B16StorageNameFjeoifoe.b16FirebaseAdConfigVqntza,
        ) ??
        '';
  }

  static Future<void> b16SaveConfigPqmxza(String b16ConfigVqntze) {
    return b16GetStorage.write(
      B16StorageNameFjeoifoe.b16FirebaseAdConfigVqntza,
      b16ConfigVqntze,
    );
  }
}
