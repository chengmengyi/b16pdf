import 'package:b16pdf/b16_dialog_fjifjie/b16_update_dialog_fowjidwj/b16_update_dialog_fowjidwj.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_new_user_hep_jfiejfo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_controller_hqvwze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class B16UnstallControllerVqntza extends B16RootControllerFjesak {
  static const String b16ReasonBuilderIdQxnvza =
      'b16_unstall_reason_builder_qxnvza';

  TextEditingController textEditingController = TextEditingController();
  int b16SelectedReasonIndexKqmwze = -1;
  final List<String> reasonList = <String>[
    'Hard to use',
    'Frequent ad interference',
    'Poor PDF reading experience',
    'Too many notifications',
    "Editing features don't meet needs",
    'Phone has built-in PDF tools',
    'Other (Please specify)',
  ];

  @override
  void onInit() {
    super.onInit();
    if (B16UserCheckHepQxnvza.instance.b16IsEligibleUserVqntza) {
      B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16UploadAdChanceKqnvxe(
        b16AdScenePqmvzr: B16AdSceneJdwo.pr_ban1,
        b16AdPosIdKqmvzr: B16PosidJkwkosw.unload_nat1,
      );
    }
  }

  void clickUninstall() {
    B16RoutersHepFjeifjoe.b16ShowDialogCtmxqe(
      b16ChildWvprka: const B16UpdateDialogFowjidwj(),
    );
  }

  void b16ClickReasonVqntza(int b16IndexPqnvze) {
    b16SelectedReasonIndexKqmwze = b16IndexPqnvze;
    update(<Object>[b16ReasonBuilderIdQxnvza]);
  }

  void b16ClickNoUninstallHqmwza() {
    if (Get.isRegistered<B16HomeControllerHqvwze>()) {
      B16RoutersHepFjeifjoe.b16PopUntilNameWvxhqt(
        B16RoutersAddressFjeifjeo.b16HomeRouteVqmxza,
      );
      B16RoutersHepFjeifjoe.b16ShowExitAdIfNeededVqntza();
      return;
    }
    B16NewUserHepJfiejfo.instance.toPageChooseLanguage();
    B16RoutersHepFjeifjoe.b16ShowExitAdIfNeededVqntza();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
