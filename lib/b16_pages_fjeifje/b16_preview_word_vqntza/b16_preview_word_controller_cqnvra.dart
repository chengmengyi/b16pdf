import 'dart:io';

import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class B16PreviewWordControllerCqnvra extends B16RootControllerFjesak {
  late final WordFileController b16WordControllerKqnvze;
  FileToolsFileInfo b16FileInfoPqmxze =
      Get.arguments['file'] as FileToolsFileInfo;
  bool b16CanLoadViewerVqntza = false;

  String get b16FileNameHqmwza {
    if ((b16FileInfoPqmxze.name ?? '').isNotEmpty) {
      return b16FileInfoPqmxze.name!;
    }
    return (b16FileInfoPqmxze.path ?? '').split(Platform.pathSeparator).last;
  }

  bool get b16IsEditingQxmvza => b16WordControllerKqnvze.isEditing;
  bool get b16IsSavingRqmwza => b16WordControllerKqnvze.saving;

  @override
  void onInit() {
    super.onInit();
    b16WordControllerKqnvze = WordFileController(
      filePath: b16FileInfoPqmxze.path ?? '',
    );
    b16WordControllerKqnvze.addListener(_b16ViewerChangedVqmxza);
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future<void>.delayed(const Duration(milliseconds: 160));
      b16CanLoadViewerVqntza = true;
      update();
      await b16WordControllerKqnvze.initialize();
    });
  }

  void _b16ViewerChangedVqmxza() => update();
  Future<void> clickEdit() async {
    if (b16IsSavingRqmwza) return;
    b16IsEditingQxmvza
        ? await b16WordControllerKqnvze.cancelEditing()
        : await b16WordControllerKqnvze.enterEditMode();
  }

  Future<void> clickSave() async {
    if (!b16IsEditingQxmvza || b16IsSavingRqmwza) return;
    try {
      await b16WordControllerKqnvze.save();
      final b16PathKqnvze = b16FileInfoPqmxze.path ?? '';
      final b16StatVqmxza = await File(b16PathKqnvze).stat();
      b16FileInfoPqmxze = b16FileInfoPqmxze.copyWith(
        size: b16StatVqmxza.size,
        updateTime: b16StatVqmxza.modified.millisecondsSinceEpoch,
      );
      Fluttertoast.showToast(msg: 'Saved successfully'.tr);
    } catch (b16ErrorQxmvza) {
      Fluttertoast.showToast(msg: '$b16ErrorQxmvza');
    }
  }

  void clickBack(){
    B16RoutersHepFjeifjoe.b16BackFtynwp();
    if(B16UserCheckHepQxnvza.instance.b16IsEligibleUserVqntza){
      B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16ShowCachedSceneAdPqmvzr(
        b16AdScenePqmvzr: B16AdSceneJdwo.pr_exit,
        b16AdPosIdKqmvzr: B16PosidJkwkosw.pr_readback,
      );
    }
  }

  @override
  void onClose() {
    b16WordControllerKqnvze.removeListener(_b16ViewerChangedVqmxza);
    b16WordControllerKqnvze.dispose();
    super.onClose();
  }
}
