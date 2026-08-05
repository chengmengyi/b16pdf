import 'package:b16pdf/b16_hep_djijdow/b16_permission_hep_qzmxva/b16_permission_hep_kqnvze.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:doc_scan_flutter/doc_scan.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

final class B16ImagesHepKqmwze {
  B16ImagesHepKqmwze._();

  static final B16ImagesHepKqmwze instance = B16ImagesHepKqmwze._();

  Future<void> toScan() async {
    if (!await Permission.camera.isGranted) {
      final B16PermissionResultVqmxze b16PermissionResultQxnvza =
          await B16PermissionHepKqnvze.instance.requestPermission(
            b16PermissionQxmvza: Permission.camera,
          );
      if (!b16PermissionResultQxnvza.b16IsGrantedHqmwza) return;
    }

    final List<String>? b16ScanPathListPqmvzr = await DocumentScanner.scan(
      format: DocScanFormat.jpeg,
    );
    _b16OpenImagesResultVqntza(b16ScanPathListPqmvzr);
  }

  Future<void> chooseImages() async {
    final List<XFile> b16ImageListKqmvzr = await ImagePicker().pickMultiImage();
    _b16OpenImagesResultVqntza(
      b16ImageListKqmvzr.map((XFile b16ImageQxnvza) => b16ImageQxnvza.path),
    );
  }

  void _b16OpenImagesResultVqntza(Iterable<String>? b16ImagePathsHqmwza) {
    final List<String> b16ValidPathsPqnvze =
        b16ImagePathsHqmwza
            ?.where((String b16PathKqmwze) => b16PathKqmwze.isNotEmpty)
            .toList(growable: false) ??
        const <String>[];
    if (b16ValidPathsPqnvze.isEmpty) return;

    B16RoutersHepFjeifjoe.b16PushNamedHkqvpa<void>(
      b16RouteNameMcfzsq: B16RoutersAddressFjeifjeo.b16ImagesResultRouteVqntza,
      b16ArgumentsXvedlu: <String, dynamic>{
        'b16ImagePaths': b16ValidPathsPqnvze,
      },
    );
  }
}
