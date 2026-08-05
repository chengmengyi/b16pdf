import 'package:b16pdf/b16_dialog_fjifjie/b16_request_permission_dialog_djeifje/b16_request_permission_dialog_djeifje.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_code_qxmvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_hep_fjiejizx.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_add_widget_storage_qxnvza.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  Future<void> clickTabItem(B16FileTabTypeefie type) =>
      pageController.animateToPage(
        type.index,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );

  void b16PageChangedHqmwza(int b16IndexKqnvze) {
    b16SelectedTabIndexQmvnza = b16IndexKqnvze;
    update();
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
    if (b16EventQzmxva.b16EventCodeFhfemie !=
        B16EventCodeQxmvza.b16WidgetAddedPqnvze) {
      return;
    }
    b16ShowAddWidgetQxnvza = false;
    update();
  }

  void test() {
    if (!kDebugMode) {
      return;
    }
    B16RoutersHepFjeifjoe.b16PushNamedHkqvpa(b16RouteNameMcfzsq: B16RoutersAddressFjeifjeo.b16UnstallRouteKqmwze);
  }

  @override
  void onClose() {
    textEditingController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
