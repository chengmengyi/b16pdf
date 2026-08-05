import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_name_fjeoifoe.dart';

class B16MediaUniqueConfigJidwjow {
  const B16MediaUniqueConfigJidwjow._();

  static Future<void> b16SaveDqnvya(int config) async {
    await b16GetStorage.write(
      B16StorageNameFjeoifoe.b16MediaUniqueConfig,
      config,
    );
  }

  static int b16ReadVqmxpe() {
    return b16GetStorage.read<int>(
          B16StorageNameFjeoifoe.b16MediaUniqueConfig,
        ) ??
        1;
  }
}
