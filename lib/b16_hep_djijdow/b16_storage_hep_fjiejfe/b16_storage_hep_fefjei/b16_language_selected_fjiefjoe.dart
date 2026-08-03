import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_name_fjeoifoe.dart';

class B16LanguageSelectedFjiefjoe {
  const B16LanguageSelectedFjiefjoe._();

  static Future<void> b16SaveConfig(String config) async {
    await b16GetStorage.write(
      B16StorageNameFjeoifoe.b16LanguageSelectedfjifdjie,
      config,
    );
  }

  static String b16GetConfig() {
    return b16GetStorage.read<String>(B16StorageNameFjeoifoe.b16LanguageSelectedfjifdjie,) ?? '';
  }
}
