import 'package:b16pdf/b16_hep_djijdow/b16_language_hep_fjeifje/b16_language_hep_kqmvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_language_hep_fjeifje/b16_language_tools_fieife.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_language_selected_fjiefjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B16ChangeLanguageBottomDialogFjeifoefController
    extends B16RootControllerFjesak {
  final ScrollController b16LanguageScrollControllerQxmvza = ScrollController();
  late B16LanguageItemQxmvza b16SelectedLanguageKqnvze;
  bool _b16HasScrolledVqntza = false;

  List<B16LanguageItemQxmvza> get b16LanguageListPqmwza =>
      B16LanguageToolsFieife.b16LanguageListRqmwza;

  @override
  void onInit() {
    super.onInit();
    final b16StoredLanguageHqmwza =
        B16LanguageSelectedFjiefjoe.b16ReadLanguageVqmxpe();
    final b16InitialLocaleQxmvza = b16StoredLanguageHqmwza.isEmpty
        ? B16LanguageToolsFieife.b16InitialLocaleHqnvze()
        : B16LanguageToolsFieife.b16MatchLocaleKqmwza(
            _b16ParseLocaleVqntza(b16StoredLanguageHqmwza),
          );
    b16SelectedLanguageKqnvze = b16LanguageListPqmwza.firstWhere(
      (b16ItemKqnvze) => B16LanguageToolsFieife.b16IsSameLocaleVqntza(
        b16ItemKqnvze.b16LocaleVqntza,
        b16InitialLocaleQxmvza,
      ),
      orElse: () => b16LanguageListPqmwza.first,
    );
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => b16ScrollSelectedLanguageHqmwza(),
    );
  }

  bool b16IsSelectedVqntza(B16LanguageItemQxmvza b16ItemKqnvze) =>
      B16LanguageToolsFieife.b16IsSameLocaleVqntza(
        b16SelectedLanguageKqnvze.b16LocaleVqntza,
        b16ItemKqnvze.b16LocaleVqntza,
      );

  void b16ScrollSelectedLanguageHqmwza() {
    if (_b16HasScrolledVqntza ||
        !b16LanguageScrollControllerQxmvza.hasClients) {
      return;
    }
    _b16HasScrolledVqntza = true;
    final b16IndexQxmvza = b16LanguageListPqmwza.indexWhere(
      b16IsSelectedVqntza,
    );
    if (b16IndexQxmvza <= 0) return;
    b16LanguageScrollControllerQxmvza.animateTo(
      (b16IndexQxmvza * 56.h).clamp(
        0.0,
        b16LanguageScrollControllerQxmvza.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> b16ClickLanguagePqmwza(
    B16LanguageItemQxmvza b16ItemQxmvza,
  ) async {
    b16SelectedLanguageKqnvze = b16ItemQxmvza;
    update();
    await B16LanguageHepKqmvza.b16SelectLanguageGqmwxe(
      b16ItemQxmvza.b16LocaleVqntza,
    );
    B16RoutersHepFjeifjoe.b16BackFtynwp();
  }

  Locale _b16ParseLocaleVqntza(String b16TagQxmvza) {
    final b16PartsKqnvze = b16TagQxmvza.replaceAll('_', '-').split('-');
    return Locale(
      b16PartsKqnvze.first.toLowerCase(),
      b16PartsKqnvze.length > 1 ? b16PartsKqnvze[1].toUpperCase() : null,
    );
  }

  @override
  void onClose() {
    b16LanguageScrollControllerQxmvza.dispose();
    super.onClose();
  }
}
