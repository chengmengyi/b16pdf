import 'dart:ui';

import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_language_selected_fjiefjoe.dart';

class B16LanguageItemQxmvza {
  const B16LanguageItemQxmvza({
    required this.b16NameKqnvze,
    required this.b16IconHqmwza,
    required this.b16LocaleVqntza,
  });

  final String b16NameKqnvze;
  final String b16IconHqmwza;
  final Locale b16LocaleVqntza;
}

abstract final class B16LanguageToolsFieife {
  static const Locale b16FallbackLocalePqmxze = Locale('en');

  static const List<B16LanguageItemQxmvza> b16LanguageListRqmwza = [
    B16LanguageItemQxmvza(
      b16NameKqnvze: 'English',
      b16IconHqmwza: 'b16_flag_english_qxmvza',
      b16LocaleVqntza: Locale('en'),
    ),
    B16LanguageItemQxmvza(
      b16NameKqnvze: 'Français',
      b16IconHqmwza: 'b16_flag_french_kqnvze',
      b16LocaleVqntza: Locale('fr'),
    ),
    B16LanguageItemQxmvza(
      b16NameKqnvze: '日本語',
      b16IconHqmwza: 'b16_flag_japanese_hqmwza',
      b16LocaleVqntza: Locale('ja'),
    ),
    B16LanguageItemQxmvza(
      b16NameKqnvze: '한국어',
      b16IconHqmwza: 'b16_flag_korean_vqntza',
      b16LocaleVqntza: Locale('ko'),
    ),
    B16LanguageItemQxmvza(
      b16NameKqnvze: 'Deutsch',
      b16IconHqmwza: 'b16_flag_german_pqmxze',
      b16LocaleVqntza: Locale('de'),
    ),
    B16LanguageItemQxmvza(
      b16NameKqnvze: 'Español',
      b16IconHqmwza: 'b16_flag_spanish_cqnvra',
      b16LocaleVqntza: Locale('es'),
    ),
    B16LanguageItemQxmvza(
      b16NameKqnvze: 'Italiano',
      b16IconHqmwza: 'b16_flag_italian_rqmwza',
      b16LocaleVqntza: Locale('it'),
    ),
    B16LanguageItemQxmvza(
      b16NameKqnvze: 'Português',
      b16IconHqmwza: 'b16_flag_portuguese_xqnvze',
      b16LocaleVqntza: Locale('pt'),
    ),
    B16LanguageItemQxmvza(
      b16NameKqnvze: 'Русский',
      b16IconHqmwza: 'b16_flag_russian_zqmwva',
      b16LocaleVqntza: Locale('ru'),
    ),
    B16LanguageItemQxmvza(
      b16NameKqnvze: '繁體中文',
      b16IconHqmwza: 'b16_flag_traditional_mqptza',
      b16LocaleVqntza: Locale('zh', 'TW'),
    ),
    B16LanguageItemQxmvza(
      b16NameKqnvze: '简体中文',
      b16IconHqmwza: 'b16_flag_simplified_tqnvza',
      b16LocaleVqntza: Locale('zh', 'CN'),
    ),
    B16LanguageItemQxmvza(
      b16NameKqnvze: 'العربية',
      b16IconHqmwza: 'b16_flag_arabic_wqmxza',
      b16LocaleVqntza: Locale('ar'),
    ),
  ];

  static Locale b16InitialLocaleHqnvze() {
    final b16SavedTagQxmvza =
        B16LanguageSelectedFjiefjoe.b16ReadLanguageVqmxpe();
    if (b16SavedTagQxmvza.isNotEmpty) {
      return b16MatchLocaleKqmwza(_b16ParseLocaleVqntza(b16SavedTagQxmvza));
    }
    return b16MatchLocaleKqmwza(PlatformDispatcher.instance.locale);
  }

  static Locale b16MatchLocaleKqmwza(Locale b16LocaleQxmvza) {
    for (final b16ItemKqnvze in b16LanguageListRqmwza) {
      if (b16IsSameLocaleVqntza(
        b16ItemKqnvze.b16LocaleVqntza,
        b16LocaleQxmvza,
      )) {
        return b16ItemKqnvze.b16LocaleVqntza;
      }
    }
    if (b16LocaleQxmvza.languageCode == 'zh') {
      final b16UseTraditionalHqmwza =
          const {'TW', 'HK', 'MO'}.contains(b16LocaleQxmvza.countryCode) ||
          b16LocaleQxmvza.scriptCode == 'Hant';
      return Locale('zh', b16UseTraditionalHqmwza ? 'TW' : 'CN');
    }
    for (final b16ItemHqmwza in b16LanguageListRqmwza) {
      if (b16ItemHqmwza.b16LocaleVqntza.languageCode ==
          b16LocaleQxmvza.languageCode) {
        return b16ItemHqmwza.b16LocaleVqntza;
      }
    }
    return b16FallbackLocalePqmxze;
  }

  static bool b16IsSameLocaleVqntza(
    Locale? b16LeftQxmvza,
    Locale b16RightKqnvze,
  ) =>
      b16LeftQxmvza?.languageCode == b16RightKqnvze.languageCode &&
      b16LeftQxmvza?.countryCode == b16RightKqnvze.countryCode;

  static String b16LocaleTagPqmwza(Locale b16LocaleQxmvza) =>
      b16LocaleQxmvza.toLanguageTag();

  static Locale _b16ParseLocaleVqntza(String b16TagQxmvza) {
    final b16PartsKqnvze = b16TagQxmvza.replaceAll('_', '-').split('-');
    return Locale(
      b16PartsKqnvze.first.toLowerCase(),
      b16PartsKqnvze.length > 1 ? b16PartsKqnvze[1].toUpperCase() : null,
    );
  }
}
