import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_name_fjeoifoe.dart';

abstract final class B16LastAdShowTimeStoragePqnvze {
  static int b16ReadTimeKqmwze(String b16SceneKeyQxnvza) {
    return b16GetStorage.read<int>(
          '${B16StorageNameFjeoifoe.b16LastAdShowTimeHqmwza}_$b16SceneKeyQxnvza',
        ) ??
        0;
  }

  static Future<void> b16SaveTimeVqntza({
    required String b16SceneKeyHqmwza,
    required int b16TimestampPqnvze,
  }) {
    return b16GetStorage.write(
      '${B16StorageNameFjeoifoe.b16LastAdShowTimeHqmwza}_$b16SceneKeyHqmwza',
      b16TimestampPqnvze,
    );
  }
}
