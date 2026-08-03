import 'dart:ui';

import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_language_selected_fjiefjoe.dart';
import 'package:get/get.dart';

final class B16LanguageOptionQxnvra {
  const B16LanguageOptionQxnvra({
    required this.b16LocaleKpwmze,
    required this.b16NativeNameVqtxla,
  });

  final Locale b16LocaleKpwmze;
  final String b16NativeNameVqtxla;
}

final class B16LanguageHepKqmvza extends Translations {
  B16LanguageHepKqmvza();

  static const Locale b16FallbackLocaleCqnxwa = Locale('en');

  static const List<B16LanguageOptionQxnvra> b16LanguageOptionsVqmpze = [
    B16LanguageOptionQxnvra(
      b16LocaleKpwmze: Locale('en'),
      b16NativeNameVqtxla: 'English',
    ),
    B16LanguageOptionQxnvra(
      b16LocaleKpwmze: Locale('fr'),
      b16NativeNameVqtxla: 'Français',
    ),
    B16LanguageOptionQxnvra(
      b16LocaleKpwmze: Locale('ja'),
      b16NativeNameVqtxla: '日本語',
    ),
    B16LanguageOptionQxnvra(
      b16LocaleKpwmze: Locale('ko'),
      b16NativeNameVqtxla: '한국어',
    ),
    B16LanguageOptionQxnvra(
      b16LocaleKpwmze: Locale('de'),
      b16NativeNameVqtxla: 'Deutsch',
    ),
    B16LanguageOptionQxnvra(
      b16LocaleKpwmze: Locale('es'),
      b16NativeNameVqtxla: 'Español',
    ),
    B16LanguageOptionQxnvra(
      b16LocaleKpwmze: Locale('it'),
      b16NativeNameVqtxla: 'Italiano',
    ),
    B16LanguageOptionQxnvra(
      b16LocaleKpwmze: Locale('pt'),
      b16NativeNameVqtxla: 'Português',
    ),
    B16LanguageOptionQxnvra(
      b16LocaleKpwmze: Locale('ru'),
      b16NativeNameVqtxla: 'Русский',
    ),
    B16LanguageOptionQxnvra(
      b16LocaleKpwmze: Locale('zh', 'TW'),
      b16NativeNameVqtxla: '繁體中文',
    ),
    B16LanguageOptionQxnvra(
      b16LocaleKpwmze: Locale('zh', 'CN'),
      b16NativeNameVqtxla: '简体中文',
    ),
    B16LanguageOptionQxnvra(
      b16LocaleKpwmze: Locale('ar'),
      b16NativeNameVqtxla: 'العربية',
    ),
  ];

  static List<Locale> get b16SupportedLocalesJxqvte => b16LanguageOptionsVqmpze
      .map((B16LanguageOptionQxnvra b16OptionTzpwka) {
        return b16OptionTzpwka.b16LocaleKpwmze;
      })
      .toList(growable: false);

  static Locale b16ResolveInitialLocaleRmqxve() {
    final String b16StoredLanguagePqtwza =
        B16LanguageSelectedFjiefjoe.b16ReadLanguageVqmxpe();
    if (b16StoredLanguagePqtwza.isNotEmpty) {
      return b16NormalizeLocaleHqvzsa(b16StoredLanguagePqtwza);
    }
    return b16NormalizeLocaleHqvzsa(
      PlatformDispatcher.instance.locale.toLanguageTag(),
    );
  }

  static Future<void> b16SelectLanguageGqmwxe(Locale b16LocaleVxqpta) async {
    final Locale b16NormalizedLocaleKzmrwe = b16NormalizeLocaleHqvzsa(
      b16LocaleVxqpta.toLanguageTag(),
    );
    await B16LanguageSelectedFjiefjoe.b16SaveLanguageDqnvya(
      b16NormalizedLocaleKzmrwe.toLanguageTag(),
    );
    await Get.updateLocale(b16NormalizedLocaleKzmrwe);
  }

  static Locale b16NormalizeLocaleHqvzsa(String b16LanguageTagCqmwpe) {
    final String b16NormalizedTagJxrvta = b16LanguageTagCqmwpe
        .trim()
        .replaceAll('_', '-')
        .toLowerCase();
    final List<String> b16TagPartsNqvzke = b16NormalizedTagJxrvta.split('-');
    final String b16LanguageCodeTpmxwa = b16TagPartsNqvzke.first;

    if (b16LanguageCodeTpmxwa == 'zh') {
      final bool b16UseTraditionalHqnvze = b16TagPartsNqvzke.any(
        (String b16PartVqmxra) =>
            const {'tw', 'hk', 'mo', 'hant'}.contains(b16PartVqmxra),
      );
      return Locale('zh', b16UseTraditionalHqnvze ? 'TW' : 'CN');
    }

    const Set<String> b16SupportedCodesRkqvma = {
      'en',
      'fr',
      'ja',
      'ko',
      'de',
      'es',
      'it',
      'pt',
      'ru',
      'ar',
    };
    return b16SupportedCodesRkqvma.contains(b16LanguageCodeTpmxwa)
        ? Locale(b16LanguageCodeTpmxwa)
        : b16FallbackLocaleCqnxwa;
  }

  @override
  Map<String, Map<String, String>> get keys => const {
    'en': {'PDF': 'PDF', 'Your pocket file pro': 'Your pocket file pro'},
    'fr': {
      'PDF': 'PDF',
      'Your pocket file pro': 'Vos fichiers toujours à portée de main',
    },
    'ja': {'PDF': 'PDF', 'Your pocket file pro': 'ポケットの中のファイル管理'},
    'ko': {'PDF': 'PDF', 'Your pocket file pro': '주머니 속 파일 전문가'},
    'de': {
      'PDF': 'PDF',
      'Your pocket file pro': 'Ihre Dateien immer griffbereit',
    },
    'es': {'PDF': 'PDF', 'Your pocket file pro': 'Tus archivos siempre a mano'},
    'it': {
      'PDF': 'PDF',
      'Your pocket file pro': 'I tuoi file sempre a portata di mano',
    },
    'pt': {'PDF': 'PDF', 'Your pocket file pro': 'Seus arquivos sempre à mão'},
    'ru': {'PDF': 'PDF', 'Your pocket file pro': 'Ваши файлы всегда под рукой'},
    'zh_TW': {'PDF': 'PDF', 'Your pocket file pro': '隨身檔案專家'},
    'zh_CN': {'PDF': 'PDF', 'Your pocket file pro': '随身文件专家'},
    'ar': {'PDF': 'PDF', 'Your pocket file pro': 'خبير ملفاتك في جيبك'},
  };
}
