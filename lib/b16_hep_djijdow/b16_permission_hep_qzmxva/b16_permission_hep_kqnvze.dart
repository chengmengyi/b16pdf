import 'package:b16pdf/b16_dialog_fjifjie/b16_request_permission_dialog_djeifje/b16_request_permission_dialog_djeifje.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_applife_hep_fjeifje.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:permission_handler/permission_handler.dart';

class B16PermissionResultVqmxze {
  final bool b16IsGrantedHqmwza;
  final bool b16IsShowPermissionAdPqnvxe;
  const B16PermissionResultVqmxze({
    required this.b16IsGrantedHqmwza,
    required this.b16IsShowPermissionAdPqnvxe,
  });
}

class B16PermissionHepKqnvze {
  B16PermissionHepKqnvze._();
  static final B16PermissionHepKqnvze instance = B16PermissionHepKqnvze._();

  Future<B16PermissionResultVqmxze> requestPermission({
    required Permission b16PermissionQxmvza,
  }) async {
    if (await b16PermissionQxmvza.isGranted) {
      return const B16PermissionResultVqmxze(
        b16IsGrantedHqmwza: true,
        b16IsShowPermissionAdPqnvxe: false,
      );
    }
    final b16ShouldRequestVqntza =
        await B16RoutersHepFjeifjoe.b16ShowDialogCtmxqe<bool>(
          b16ChildWvprka: B16RequestPermissionDialogDjeifje(
            permission: b16PermissionQxmvza,
          ),
        ) ??
        false;
    if (!b16ShouldRequestVqntza) {
      return const B16PermissionResultVqmxze(
        b16IsGrantedHqmwza: false,
        b16IsShowPermissionAdPqnvxe: true,
      );
    }
    B16ApplifeHepFjeifje.instance.b16SuppressNextHotLaunchQxnvza();
    final b16StatusKpnyra = await b16PermissionQxmvza.request();
    return B16PermissionResultVqmxze(
      b16IsGrantedHqmwza: b16StatusKpnyra.isGranted,
      b16IsShowPermissionAdPqnvxe: true,
    );
  }
}
