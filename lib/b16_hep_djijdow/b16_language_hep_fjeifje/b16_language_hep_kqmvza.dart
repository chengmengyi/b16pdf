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
    'en': {
      'PDF': 'PDF',
      'Your pocket file pro': 'Your pocket file pro',
      'Unlock Full PDF Potential': 'Unlock Full PDF Potential',
      'Step 1: find PDF flow in the list below.':
          'Step 1: find PDF flow in the list below.',
      'Step 2: toggle the switch to ON.': 'Step 2: toggle the switch to ON.',
      'Continue': 'Continue',
      'Later': 'Later',
      'Almost there! Unlock your full potential':
          'Almost there! Unlock your full potential',
      'Find {n} below and toggle the switch to ON.':
          'Find {n} below and toggle the switch to ON.',
    },
    'fr': {
      'PDF': 'PDF',
      'Your pocket file pro': 'Vos fichiers toujours à portée de main',
      'Unlock Full PDF Potential': 'Libérez tout le potentiel de PDF',
      'Step 1: find PDF flow in the list below.':
          'Étape 1 : trouvez PDF flow dans la liste ci-dessous.',
      'Step 2: toggle the switch to ON.': 'Étape 2 : activez l’interrupteur.',
      'Continue': 'Continuer',
      'Later': 'Plus tard',
      'Almost there! Unlock your full potential':
          'Vous y êtes presque ! Libérez tout votre potentiel',
      'Find {n} below and toggle the switch to ON.':
          'Trouvez {n} ci-dessous et activez l’interrupteur.',
    },
    'ja': {
      'PDF': 'PDF',
      'Your pocket file pro': 'ポケットの中のファイル管理',
      'Unlock Full PDF Potential': 'PDFの可能性を最大限に引き出す',
      'Step 1: find PDF flow in the list below.':
          'ステップ1：下のリストからPDF flowを見つけます。',
      'Step 2: toggle the switch to ON.': 'ステップ2：スイッチをオンにします。',
      'Continue': '続ける',
      'Later': '後で',
      'Almost there! Unlock your full potential': 'あと少しです！すべての機能を有効にしましょう',
      'Find {n} below and toggle the switch to ON.':
          '下から{n}を見つけて、スイッチをオンにしてください。',
    },
    'ko': {
      'PDF': 'PDF',
      'Your pocket file pro': '주머니 속 파일 전문가',
      'Unlock Full PDF Potential': 'PDF의 모든 기능을 활용하세요',
      'Step 1: find PDF flow in the list below.':
          '1단계: 아래 목록에서 PDF flow를 찾으세요.',
      'Step 2: toggle the switch to ON.': '2단계: 스위치를 켜세요.',
      'Continue': '계속',
      'Later': '나중에',
      'Almost there! Unlock your full potential': '거의 다 됐어요! 모든 기능을 활성화하세요',
      'Find {n} below and toggle the switch to ON.': '아래에서 {n}을 찾아 스위치를 켜세요.',
    },
    'de': {
      'PDF': 'PDF',
      'Your pocket file pro': 'Ihre Dateien immer griffbereit',
      'Unlock Full PDF Potential': 'Das volle PDF-Potenzial ausschöpfen',
      'Step 1: find PDF flow in the list below.':
          'Schritt 1: Suchen Sie PDF flow in der Liste unten.',
      'Step 2: toggle the switch to ON.':
          'Schritt 2: Schalten Sie den Schalter ein.',
      'Continue': 'Weiter',
      'Later': 'Später',
      'Almost there! Unlock your full potential':
          'Fast geschafft! Nutzen Sie das volle Potenzial',
      'Find {n} below and toggle the switch to ON.':
          'Suchen Sie unten nach {n} und schalten Sie den Schalter ein.',
    },
    'es': {
      'PDF': 'PDF',
      'Your pocket file pro': 'Tus archivos siempre a mano',
      'Unlock Full PDF Potential': 'Desbloquea todo el potencial de PDF',
      'Step 1: find PDF flow in the list below.':
          'Paso 1: busca PDF flow en la lista de abajo.',
      'Step 2: toggle the switch to ON.': 'Paso 2: activa el interruptor.',
      'Continue': 'Continuar',
      'Later': 'Más tarde',
      'Almost there! Unlock your full potential':
          '¡Ya casi está! Desbloquea todo tu potencial',
      'Find {n} below and toggle the switch to ON.':
          'Busca {n} abajo y activa el interruptor.',
    },
    'it': {
      'PDF': 'PDF',
      'Your pocket file pro': 'I tuoi file sempre a portata di mano',
      'Unlock Full PDF Potential': 'Sblocca tutto il potenziale di PDF',
      'Step 1: find PDF flow in the list below.':
          'Passaggio 1: trova PDF flow nell’elenco qui sotto.',
      'Step 2: toggle the switch to ON.': 'Passaggio 2: attiva l’interruttore.',
      'Continue': 'Continua',
      'Later': 'Più tardi',
      'Almost there! Unlock your full potential':
          'Ci siamo quasi! Sblocca tutto il tuo potenziale',
      'Find {n} below and toggle the switch to ON.':
          'Trova {n} qui sotto e attiva l’interruttore.',
    },
    'pt': {
      'PDF': 'PDF',
      'Your pocket file pro': 'Seus arquivos sempre à mão',
      'Unlock Full PDF Potential': 'Libere todo o potencial do PDF',
      'Step 1: find PDF flow in the list below.':
          'Etapa 1: encontre PDF flow na lista abaixo.',
      'Step 2: toggle the switch to ON.': 'Etapa 2: ative o interruptor.',
      'Continue': 'Continuar',
      'Later': 'Mais tarde',
      'Almost there! Unlock your full potential':
          'Quase lá! Libere todo o seu potencial',
      'Find {n} below and toggle the switch to ON.':
          'Encontre {n} abaixo e ative o interruptor.',
    },
    'ru': {
      'PDF': 'PDF',
      'Your pocket file pro': 'Ваши файлы всегда под рукой',
      'Unlock Full PDF Potential': 'Раскройте весь потенциал PDF',
      'Step 1: find PDF flow in the list below.':
          'Шаг 1: найдите PDF flow в списке ниже.',
      'Step 2: toggle the switch to ON.': 'Шаг 2: включите переключатель.',
      'Continue': 'Продолжить',
      'Later': 'Позже',
      'Almost there! Unlock your full potential':
          'Почти готово! Раскройте весь потенциал',
      'Find {n} below and toggle the switch to ON.':
          'Найдите {n} ниже и включите переключатель.',
    },
    'zh_TW': {
      'PDF': 'PDF',
      'Your pocket file pro': '隨身檔案專家',
      'Unlock Full PDF Potential': '解鎖 PDF 的完整潛力',
      'Step 1: find PDF flow in the list below.': '步驟 1：在下方清單中找到 PDF flow。',
      'Step 2: toggle the switch to ON.': '步驟 2：將開關切換為開啟。',
      'Continue': '繼續',
      'Later': '稍後',
      'Almost there! Unlock your full potential': '快完成了！解鎖完整功能',
      'Find {n} below and toggle the switch to ON.': '在下方找到 {n}，並將開關切換為開啟。',
    },
    'zh_CN': {
      'PDF': 'PDF',
      'Your pocket file pro': '随身文件专家',
      'Unlock Full PDF Potential': '解锁 PDF 的全部潜力',
      'Step 1: find PDF flow in the list below.': '步骤 1：在下方列表中找到 PDF flow。',
      'Step 2: toggle the switch to ON.': '步骤 2：将开关切换为开启。',
      'Continue': '继续',
      'Later': '稍后',
      'Almost there! Unlock your full potential': '即将完成！解锁全部功能',
      'Find {n} below and toggle the switch to ON.': '在下方找到 {n}，并将开关切换为开启。',
    },
    'ar': {
      'PDF': 'PDF',
      'Your pocket file pro': 'خبير ملفاتك في جيبك',
      'Unlock Full PDF Potential': 'أطلق العنان لإمكانات PDF الكاملة',
      'Step 1: find PDF flow in the list below.':
          'الخطوة 1: ابحث عن PDF flow في القائمة أدناه.',
      'Step 2: toggle the switch to ON.': 'الخطوة 2: فعّل مفتاح التبديل.',
      'Continue': 'متابعة',
      'Later': 'لاحقًا',
      'Almost there! Unlock your full potential':
          'أوشكت على الانتهاء! أطلق العنان لإمكاناتك الكاملة',
      'Find {n} below and toggle the switch to ON.':
          'ابحث عن {n} أدناه وفعّل مفتاح التبديل.',
    },
  };
}
