import 'dart:async';

import 'package:b16pdf/b16_hep_djijdow/b16_language_hep_fjeifje/b16_language_hep_kqmvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_cold_launcher_source_hep_jiwjdow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:quick_actions/quick_actions.dart';

class B16QuickActionHepFjeifjiw {
  static final B16QuickActionHepFjeifjiw _actionHepFjeifjiw =
      B16QuickActionHepFjeifjiw();
  static B16QuickActionHepFjeifjiw get instance => _actionHepFjeifjiw;

  static const String b16UninstallTypeQxnvza = 'uninstall';

  final QuickActions _quickActions = const QuickActions();
  Future<void>? _b16InitializeFutureKqmwze;
  String? _b16PendingTypeVqntza;
  bool _b16InitializedQxnvza = false;
  bool _b16LauncherFinishedHqmwza = false;

  Future<void> init() {
    _b16InitializeFutureKqmwze ??= _b16InitializeInternalPqnvze();
    return _b16InitializeFutureKqmwze!;
  }

  Future<void> _b16InitializeInternalPqnvze() async {
    if (_b16InitializedQxnvza) {
      return;
    }
    _b16InitializedQxnvza = true;
    await _quickActions.initialize((String b16ShortcutTypeKqnvxe) {
      if (!_b16LauncherFinishedHqmwza) {
        _b16PendingTypeVqntza = b16ShortcutTypeKqnvxe;
        B16ColdLauncherSourceHepJiwjdow.instance.b16RecordQuickActionSourceQxnvza(
          b16ShortcutTypeKqnvxe,
        );
        return;
      }
      unawaited(
        _b16HandleShortcutHqmwza(
          b16ShortcutTypeKqnvxe,
          b16FromColdStartPqmxza: false,
        ),
      );
    });
    await setShortcutItems();
  }

  Future<bool> b16ConsumeColdStartActionVqntza() async {
    await init();
    _b16LauncherFinishedHqmwza = true;
    final String? b16ShortcutTypeQxnvza = _b16PendingTypeVqntza;
    _b16PendingTypeVqntza = null;
    if (b16ShortcutTypeQxnvza == null || b16ShortcutTypeQxnvza.isEmpty) {
      return false;
    }
    return _b16HandleShortcutHqmwza(
      b16ShortcutTypeQxnvza,
      b16FromColdStartPqmxza: true,
    );
  }

  Future<bool> _b16HandleShortcutHqmwza(
    String b16ShortcutTypePqnvze, {
    required bool b16FromColdStartPqmxza,
  }) async {
    if (b16ShortcutTypePqnvze != b16UninstallTypeQxnvza) {
      return false;
    }
    B16ColdLauncherSourceHepJiwjdow.instance.b16RecordQuickActionSourceQxnvza(
      b16ShortcutTypePqnvze,
    );
    if (b16FromColdStartPqmxza) {
      await B16RoutersHepFjeifjoe.b16ReplaceNamedZxplrt(b16RouteNameYweqpn: B16RoutersAddressFjeifjeo.b16UnstallRouteKqmwze);
    } else {
      await B16RoutersHepFjeifjoe.b16PushNamedHkqvpa(b16RouteNameMcfzsq: B16RoutersAddressFjeifjeo.b16UnstallRouteKqmwze);
    }
    return true;
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
        type: b16UninstallTypeQxnvza,
        localizedTitle: b16UninstallTitleHqmwza,
        icon: "b16_uninstall_icon_fjieoje",
      ),
    ]);
  }
}
