import 'package:b16pdf/b16_dialog_fjifjie/b16_sort_bottom_dialog_fjiewfjoe/b16_sort_bottom_dialog_fjiewfjoe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_child_vqntza/b16_home_child_controller_rkpxwe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class B16FilesListChildControllerHqmwze extends B16RootControllerFjesak {
  B16FileTabTypeefie type;
  RefreshController refreshController=RefreshController();
  B16FilesListChildControllerHqmwze({
    required this.type,
  });

  clickSort(){
    B16RoutersHepFjeifjoe.b16ShowBottomSheetVxqprn(
      b16ChildQnwxza: B16SortBottomDialogFjiewfjoe(),
    );
  }

  clickDeleteFile(){
    B16RoutersHepFjeifjoe.b16PushNamedHkqvpa(b16RouteNameMcfzsq: B16RoutersAddressFjeifjeo.b16DeleteFileRouteKqnvze);
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }
}
