import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_new_user_hep_jfiejfo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:get/get.dart';

class B16OpenOverlayPermissionControllerHvxpra extends B16RootControllerFjesak {
  bool b16PermissionRequestRunningKqmvza = false;

  Future<void> b16ClickContinueHqmwze() async {
    if (b16PermissionRequestRunningKqmvza) {
      return;
    }
    b16PermissionRequestRunningKqmvza = true;
    try {
      final bool b16HasPermissionVqmxra = await FlutterLocalNotificationPlugins
          .instance
          .checkOverlayPermission();
      if (b16HasPermissionVqmxra) {
        b16OpenNotificationPagePqnvxe();
        return;
      }
      final bool b16PermissionGrantedKqvxne =
          await FlutterLocalNotificationPlugins.instance
              .requestOverlayPermission(
                title: 'Almost there! Unlock your full potential'.tr,
                desc: 'Find {n} below and toggle the switch to ON.'.tr,
                overlayPermissionGuideLayout: '',
              );
      if (b16PermissionGrantedKqvxne) {
        b16OpenNotificationPagePqnvxe();
      }
    } finally {
      b16PermissionRequestRunningKqmvza = false;
    }
  }

  void b16ClickLaterVqmxze() {
    b16OpenNotificationPagePqnvxe();
  }

  void b16OpenNotificationPagePqnvxe() {
    B16NewUserHepJfiejfo.instance.toPageAfterOverlay();
  }
}
