import 'package:b16pdf/b16_hep_djijdow/b16_language_hep_fjeifje/b16_language_hep_kqmvza.dart';
import 'package:quick_actions/quick_actions.dart';

class B16QuickActionHepFjeifjiw {
  static final B16QuickActionHepFjeifjiw _actionHepFjeifjiw =
      B16QuickActionHepFjeifjiw();
  static B16QuickActionHepFjeifjiw get instance => _actionHepFjeifjiw;

  final QuickActions _quickActions = const QuickActions();

  Future<void> init() async {
    await _quickActions.initialize((String shortcutType) {});
    await setShortcutItems();
  }

  Future<void> setShortcutItems() async {
    final b16LocaleQxmvza =
        B16LanguageHepKqmvza.b16ResolveInitialLocaleRmqxve();
    final b16LocaleKeyVqntza = b16LocaleQxmvza.toString();
    final b16UninstallTitleHqmwza =
        B16LanguageHepKqmvza().keys[b16LocaleKeyVqntza]?['Uninstall'] ??
        'Uninstall';
    await _quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(
        type: "uninstall",
        localizedTitle: b16UninstallTitleHqmwza,
        icon: "b16_uninstall_icon_fjieoje",
      ),
    ]);
  }
}
