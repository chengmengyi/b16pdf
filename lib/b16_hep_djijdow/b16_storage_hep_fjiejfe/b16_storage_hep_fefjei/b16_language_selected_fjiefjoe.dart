import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_name_fjeoifoe.dart';

class B16LanguageSelectedFjiefjoe {
  const B16LanguageSelectedFjiefjoe._();

  static Future<void> b16SaveLanguageDqnvya(String b16LanguageTagKqmwze) async {
    await b16GetStorage.write(
      B16StorageNameFjeoifoe.b16LanguageSelectedfjifdjie,
      b16LanguageTagKqmwze,
    );
  }

  static String b16ReadLanguageVqmxpe() {
    return b16GetStorage.read<String>(
          B16StorageNameFjeoifoe.b16LanguageSelectedfjifdjie,
        ) ??
        '';
  }
}
