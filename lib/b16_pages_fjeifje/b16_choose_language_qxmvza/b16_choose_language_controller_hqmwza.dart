import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_language_hep_fjeifje/b16_language_hep_kqmvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_language_hep_fjeifje/b16_language_tools_fieife.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_new_user_hep_jfiejfo.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B16ChooseLanguageControllerHqmwza extends B16RootControllerFjesak {
  final ScrollController b16LanguageScrollControllerQxmvza = ScrollController();
  late B16LanguageItemQxmvza b16SelectedLanguageKqnvze;
  bool _b16HasScrolledVqntza = false;

  List<B16LanguageItemQxmvza> get b16LanguageListPqmwza =>
      B16LanguageToolsFieife.b16LanguageListRqmwza;

  @override
  void onInit() {
    super.onInit();
    B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16UploadAdChanceKqnvxe(
      b16AdScenePqmvzr: B16AdSceneJdwo.pr_ban1,
      b16AdPosIdKqmvzr: B16PosidJkwkosw.pr_new_lan_nat,
    );
    final b16InitialLocaleHqmwza =
        B16LanguageToolsFieife.b16InitialLocaleHqnvze();
    b16SelectedLanguageKqnvze = b16LanguageListPqmwza.firstWhere(
      (b16ItemQxmvza) => B16LanguageToolsFieife.b16IsSameLocaleVqntza(
        b16ItemQxmvza.b16LocaleVqntza,
        b16InitialLocaleHqmwza,
      ),
      orElse: () => b16LanguageListPqmwza.first,
    );
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => b16ScrollSelectedLanguageVqntza(),
    );
  }

  bool b16IsSelectedPqmxza(B16LanguageItemQxmvza b16ItemKqnvze) =>
      B16LanguageToolsFieife.b16IsSameLocaleVqntza(
        b16SelectedLanguageKqnvze.b16LocaleVqntza,
        b16ItemKqnvze.b16LocaleVqntza,
      );

  void b16ClickLanguageHqmwza(B16LanguageItemQxmvza b16ItemQxmvza) {
    b16SelectedLanguageKqnvze = b16ItemQxmvza;
    update();
  }

  void b16ScrollSelectedLanguageVqntza() {
    if (_b16HasScrolledVqntza ||
        !b16LanguageScrollControllerQxmvza.hasClients) {
      return;
    }
    final b16IndexKqnvze = b16LanguageListPqmwza.indexWhere(
      b16IsSelectedPqmxza,
    );
    _b16HasScrolledVqntza = true;
    if (b16IndexKqnvze <= 0) return;
    final b16TargetOffsetQxmvza = b16IndexKqnvze * 56.h;
    b16LanguageScrollControllerQxmvza.animateTo(
      b16TargetOffsetQxmvza.clamp(
        0.0,
        b16LanguageScrollControllerQxmvza.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> clickOk() async {
    await B16LanguageHepKqmvza.b16SelectLanguageGqmwxe(
      b16SelectedLanguageKqnvze.b16LocaleVqntza,
    );
    B16NewUserHepJfiejfo.instance.toPageOpenNotificationPermission();
  }

  @override
  void onClose() {
    b16LanguageScrollControllerQxmvza.dispose();
    super.onClose();
  }
}
