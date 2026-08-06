import 'package:app_settings/app_settings.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_new_user_hep_jfiejfo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_controller_hqvwze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:get/get.dart';

class B16UpdateDialogFowjidwjController extends B16RootControllerFjesak {
  void b16ClickContinueUsingKqnvze() {
    _b16ReturnToAppQxmvza();
  }

  Future<void> b16ClickLeaveAnywayVqntza() async {
    if (B16UserCheckHepQxnvza.instance.b16IsEligibleUserVqntza) {
      await B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16ShowCachedSceneAdPqmvzr(
        b16AdScenePqmvzr: B16AdSceneJdwo.pr_exit,
        b16AdPosIdKqmvzr: B16PosidJkwkosw.unload_2,
        b16AdHostContextVmqxtr: Get.context,
      );
    }
    _b16ReturnToAppQxmvza();
    await AppSettings.openAppSettings();
  }

  void _b16ReturnToAppQxmvza() {
    if (Get.isRegistered<B16HomeControllerHqvwze>()) {
      B16RoutersHepFjeifjoe.b16PopUntilNameWvxhqt(
        B16RoutersAddressFjeifjeo.b16HomeRouteVqmxza,
      );
      return;
    }
    B16NewUserHepJfiejfo.instance.toPageChooseLanguage();
  }
}
