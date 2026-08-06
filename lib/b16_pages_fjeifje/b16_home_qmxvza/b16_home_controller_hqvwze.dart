import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_dialog_fjifjie/b16_comment_dialog_jiwjdiw/b16_comment_dialog_jiwjdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_notification_hep_djiwdow/b16_notification_hep_jsowkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_child_vqntza/b16_home_child_page_cqmwze.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_tools_child_tqmvza/b16_tools_child_page_vqkrze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/cupertino.dart';

enum B16HomeBottomTabType {
  files('Files', 'b16_home_sel_icon_dfeife', 'b16_home_uns_icon_dhwidiw'),
  tools('Tools', 'b16_tool_sel_icon_djwijow', 'b16_tool_uns_icon_djwijow');

  const B16HomeBottomTabType(
    this.b16TextKqmvza,
    this.b16IconSelectedHqmwze,
    this.b16IconUnselectedVqnxra,
  );

  final String b16TextKqmvza;
  final String b16IconSelectedHqmwze;
  final String b16IconUnselectedVqnxra;
}

class B16HomeControllerHqvwze extends B16RootControllerFjesak {
  static const String b16TabUpdateIdPqmxve = 'b16_home_tab';

  int b16TabIndexKqmwza = 0;
  bool _b16CanExitAfterCommentQxnvza = false;

  final List<Widget> b16PagesVqnxre = const [
    B16HomeChildPageCqmwze(),
    B16ToolsChildPageVqkrze(),
  ];

  @override
  void onInit() {
    super.onInit();
    B16NotificationHepPqnvze.instance.b16InitializeNotificationsQxnvza(b16RequestPermissionKqmwze: true);
  }

  Future<bool> b16HandleBackPressedPqnvze() async {
    if (_b16CanExitAfterCommentQxnvza) {
      return true;
    }
    final bool? b16CanExitNextTimeVqmwza =
        await B16RoutersHepFjeifjoe.b16ShowBottomSheetVxqprn<bool>(
          b16ChildQnwxza: const B16CommentDialogJiwjdiwe(),
          b16DismissibleMkrvte: false,
        );
    if (b16CanExitNextTimeVqmwza == true) {
      _b16CanExitAfterCommentQxnvza = true;
    }
    return false;
  }

  void b16SelectTabHqmvze(
    B16HomeBottomTabType b16TabVqnxra,
    BuildContext b16contextVqmwza,
  ) {
    if (b16TabIndexKqmwza == b16TabVqnxra.index) {
      return;
    }
    b16TabIndexKqmwza = b16TabVqnxra.index;
    update([b16TabUpdateIdPqmxve]);
    B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16ShowCachedSceneAdPqmvzr(
      b16AdScenePqmvzr: B16AdSceneJdwo.pr_user_use,
      b16AdPosIdKqmvzr: B16PosidJkwkosw.pr_down_int,
      b16AdHostContextVmqxtr: b16contextVqmwza,
    );
  }
}
