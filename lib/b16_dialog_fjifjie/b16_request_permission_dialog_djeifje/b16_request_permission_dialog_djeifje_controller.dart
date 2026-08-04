import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:permission_handler/permission_handler.dart';

class B16RequestPermissionDialogDjeifjeController extends B16RootControllerFjesak{
  Permission permission;
  B16RequestPermissionDialogDjeifjeController({
    required this.permission,
  });

  String permissionMessage() {
    if (permission == Permission.storage || permission == Permission.manageExternalStorage) {
      return 'Please allow storage access to continue.';
    }
    if (permission == Permission.camera) {
      return 'Please allow camera access to continue.';
    }
    return 'Please allow access to continue.';
  }

  clickLater(){
    B16RoutersHepFjeifjoe.b16BackFtynwp();
  }
}