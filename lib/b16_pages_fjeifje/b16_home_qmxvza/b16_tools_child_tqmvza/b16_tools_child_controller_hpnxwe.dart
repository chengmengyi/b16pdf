import 'package:b16pdf/b16_dialog_fjifjie/b16_change_language_bottom_dialog_fjeifoef/b16_change_language_bottom_dialog_fjeifoef.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_language_hep_fjeifje/b16_language_tools_fieife.dart';
import 'package:get/get.dart';

class B16ToolsChildControllerHpnxwe extends B16RootControllerFjesak {
  String get b16CurrentLanguageNameQxmvza {
    final b16LocaleKqnvze = B16LanguageToolsFieife.b16MatchLocaleKqmwza(
      Get.locale ?? B16LanguageToolsFieife.b16InitialLocaleHqnvze(),
    );
    return B16LanguageToolsFieife.b16LanguageListRqmwza
        .firstWhere(
          (b16ItemVqntza) => B16LanguageToolsFieife.b16IsSameLocaleVqntza(
            b16ItemVqntza.b16LocaleVqntza,
            b16LocaleKqnvze,
          ),
        )
        .b16NameKqnvze;
  }

  Future<void> clickChangeLanguage() async {
    await B16RoutersHepFjeifjoe.b16ShowBottomSheetVxqprn(
      b16ChildQnwxza: B16ChangeLanguageBottomDialogFjeifoef(),
    );
    update();
  }
}
