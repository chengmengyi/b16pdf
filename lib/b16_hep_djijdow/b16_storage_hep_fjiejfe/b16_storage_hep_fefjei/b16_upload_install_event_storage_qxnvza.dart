import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_name_fjeoifoe.dart';

abstract final class B16UploadInstallEventStorageQxnvza {
  static bool b16ReadEnabledKqmwze() {
    return b16GetStorage.read<bool>(
          B16StorageNameFjeoifoe.b16UploadInstallEventQxnvza,
        ) ??
        true;
  }

  static Future<void> b16SaveEnabledVqntza(bool b16EnabledHqmwza) {
    return b16GetStorage.write(
      B16StorageNameFjeoifoe.b16UploadInstallEventQxnvza,
      b16EnabledHqmwza,
    );
  }
}
