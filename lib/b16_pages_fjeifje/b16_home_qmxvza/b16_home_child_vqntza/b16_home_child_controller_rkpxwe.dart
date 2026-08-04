import 'package:b16pdf/b16_dialog_fjifjie/b16_request_permission_dialog_djeifje/b16_request_permission_dialog_djeifje.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

enum B16FileTabTypeefie{
  all("All","b16_all_tab_sel_icon_ifjefefe","b16_all_tab_sel_icon_ifjefefe"),
  pdf("PDF","b16_pdf_tab_sel_icon_wifjiw","b16_pdf_tab_sel_icon_wifjiw"),
  word("Word","b16_word_tab_sel_icon_fhifjie","b16_word_tab_sel_icon_fhifjie"),
  excel("Excel","b16_excel_tab_sel_icon_fjiwjie","b16_excel_tab_sel_icon_fjiwjie");

  final String name;
  final String iconSel;
  final String iconUns;
  const B16FileTabTypeefie(this.name,this.iconSel,this.iconUns);
}
class B16HomeChildControllerRkpxwe extends B16RootControllerFjesak {
  TextEditingController textEditingController=TextEditingController();
  PageController pageController=PageController();


  test(){
    if(!kDebugMode){
      return;
    }
    B16RoutersHepFjeifjoe.b16ShowDialogCtmxqe(b16ChildWvprka: B16RequestPermissionDialogDjeifje(permission: Permission.manageExternalStorage));
  }

  @override
  void onClose() {
    textEditingController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
