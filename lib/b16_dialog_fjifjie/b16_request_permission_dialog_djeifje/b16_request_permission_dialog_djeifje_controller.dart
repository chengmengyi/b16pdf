import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class B16RequestPermissionDialogDjeifjeController
    extends B16RootControllerFjesak {
  final Permission permission;
  B16RequestPermissionDialogDjeifjeController({required this.permission});

  String permissionMessage() {
    if (permission == Permission.storage ||
        permission == Permission.manageExternalStorage) {
      return 'Please allow storage access to continue.'.tr;
    }
    if (permission == Permission.camera) {
      return 'Please allow camera access to continue.'.tr;
    }
    return 'Please allow access to continue.'.tr;
  }

  void clickAllow() =>
      B16RoutersHepFjeifjoe.b16BackFtynwp<bool>(b16ResultNcgkqe: true);

  void clickLater() {
    B16RoutersHepFjeifjoe.b16BackFtynwp<bool>(b16ResultNcgkqe: false);
  }
}
