import 'dart:io';

import 'package:b16pdf/b16_dialog_fjifjie/b16_comment_dialog_jiwjdiw/b16_comment_dialog_jiwjdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_point_type_jdwijdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_tba_hep_djiwjidw.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_code_qxmvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_hep_fjiejizx.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_permission_hep_qzmxva/b16_permission_hep_kqnvze.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_add_widget_storage_qxnvza.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:permission_handler/permission_handler.dart';

enum B16FileTabTypeefie {
  all("All", "b16_all_tab_sel_icon_ifjefefe", "b16_all_tab_uns_icon_fjifoe"),
  pdf("PDF", "b16_pdf_tab_sel_icon_wifjiw", "b16_pdf_tab_sel_icon_wifjiw"),
  word(
    "Word",
    "b16_word_tab_sel_icon_fhifjie",
    "b16_word_tab_sel_icon_fhifjie",
  ),
  excel(
    "Excel",
    "b16_excel_tab_sel_icon_fjiwjie",
    "b16_excel_tab_sel_icon_fjiwjie",
  );

  final String name;
  final String iconSel;
  final String iconUns;
  const B16FileTabTypeefie(this.name, this.iconSel, this.iconUns);
}

class B16HomeChildControllerRkpxwe extends B16RootControllerFjesak {
  TextEditingController textEditingController = TextEditingController();
  PageController pageController = PageController();
  int b16SelectedTabIndexQmvnza = 0;
  bool b16ShowAddWidgetQxnvza = !B16AddWidgetStorageQxnvza.b16ReadAddedKqmwze();
  bool b16RequestingStoragePermissionVqntza = false;

  @override
  void onReady() {
    super.onReady();
    b16RequestStoragePermissionHqmwza();
  }

  clickTabItem(B16FileTabTypeefie type){
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(b16PointTypeQxnvza: B16PointTypeJdwijdiw.file_filter_click);
    pageController.animateToPage(
      type.index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  void b16PageChangedHqmwza(int b16IndexKqnvze,BuildContext b16ContextHqmwza) {
    b16SelectedTabIndexQmvnza = b16IndexKqnvze;
    update();
    B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16ShowCachedSceneAdPqmvzr(
      b16AdScenePqmvzr: B16AdSceneJdwo.pr_user_use,
      b16AdPosIdKqmvzr: B16PosidJkwkosw.pr_up_int,
      b16AdHostContextVmqxtr: b16ContextHqmwza,
    );
  }

  void b16SearchFilesPqmxza(String b16KeywordVqntze) =>
      B16EventHepFjiejizx.instance.b16SendMsgFjijeio(
        B16EventBeanFhifeode(
          b16EventCodeFhfemie: B16EventCodeQxmvza.b16FileSearchVqntza,
          b16StringValueDjijie: b16KeywordVqntze,
        ),
      );

  @override
  bool b16RegisterEventfeijif() => true;

  @override
  void b16HandleEventhrifjei(B16EventBeanFhifeode b16EventQzmxva) {
    if (b16EventQzmxva.b16EventCodeFhfemie ==
        B16EventCodeQxmvza.b16WidgetAddedPqnvze) {
      b16ShowAddWidgetQxnvza = false;
      update();
    } else if (b16EventQzmxva.b16EventCodeFhfemie ==
        B16EventCodeQxmvza.b16StoragePermissionRequestRqmwza) {
      b16RequestStoragePermissionHqmwza();
    }
  }

  Future<void> b16RequestStoragePermissionHqmwza() async {
    if (b16RequestingStoragePermissionVqntza) return;
    b16RequestingStoragePermissionVqntza = true;
    try {
      final Permission b16PermissionQxnvza =
          await _b16StoragePermissionKqmwze();
      final B16PermissionResultVqmxze b16ResultVqntza =
          await B16PermissionHepKqnvze.instance.requestPermission(
            b16PermissionQxmvza: b16PermissionQxnvza,
          );
      if(b16ResultVqntza.b16IsShowPermissionAdPqnvxe){
        B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(b16PointTypeQxnvza: B16PointTypeJdwijdiw.storage_auth_click);
        B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16ShowCachedSceneAdPqmvzr(b16AdScenePqmvzr: B16AdSceneJdwo.pr_launch, b16AdPosIdKqmvzr: B16PosidJkwkosw.pr_permission_open);
      }
      if (!b16ResultVqntza.b16IsGrantedHqmwza) return;
      B16EventHepFjiejizx.instance.b16SendMsgFjijeio(
        B16EventBeanFhifeode(
          b16EventCodeFhfemie:
              B16EventCodeQxmvza.b16StoragePermissionGrantedTqnvze,
        ),
      );
    } finally {
      b16RequestingStoragePermissionVqntza = false;
    }
  }

  Future<Permission> _b16StoragePermissionKqmwze() async {
    if (!Platform.isAndroid) return Permission.storage;
    final b16AndroidInfoQxnvza = await DeviceInfoPlugin().androidInfo;
    return b16AndroidInfoQxnvza.version.sdkInt >= 30
        ? Permission.manageExternalStorage
        : Permission.storage;
  }

  void test() async{
    if (!kDebugMode) {
      return;
    }
    B16RoutersHepFjeifjoe.b16ShowBottomSheetVxqprn(b16ChildQnwxza: B16CommentDialogJiwjdiwe());
  }

  @override
  void onClose() {
    textEditingController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
