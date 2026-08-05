import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_name_fjeoifoe.dart';

class B16ReferrerConfigJdiwiw {
  const B16ReferrerConfigJdiwiw._();

  static Future<void> b16SaveDqnvya(String config) async {
    await b16GetStorage.write(
      B16StorageNameFjeoifoe.b16ReferrerConfig,
      config,
    );
  }

  static String b16ReadVqmxpe() {
    return b16GetStorage.read<String>(
          B16StorageNameFjeoifoe.b16ReferrerConfig,
        ) ??
        '';
  }
}
