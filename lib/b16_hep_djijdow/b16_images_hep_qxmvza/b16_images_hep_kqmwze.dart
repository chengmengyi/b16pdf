import 'package:b16pdf/b16_hep_djijdow/b16_permission_hep_qzmxva/b16_permission_hep_kqnvze.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_point_type_jdwijdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_tba_hep_djiwjidw.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_images_result_qxnvza/b16_images_result_controller_kqmwze.dart';
import 'package:doc_scan_flutter/doc_scan.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

final class B16ImagesHepKqmwze {
  B16ImagesHepKqmwze._();

  static final B16ImagesHepKqmwze instance = B16ImagesHepKqmwze._();

  Future<List<String>> toScan({bool b16OpenResultQxnvza = true}) async {
    if(b16OpenResultQxnvza){
      B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(b16PointTypeQxnvza: B16PointTypeJdwijdiw.tool_scan,);
    }
    if (!await Permission.camera.isGranted) {
      final B16PermissionResultVqmxze b16PermissionResultQxnvza =
          await B16PermissionHepKqnvze.instance.requestPermission(
            b16PermissionQxmvza: Permission.camera,
          );
      if (!b16PermissionResultQxnvza.b16IsGrantedHqmwza) {
        return const <String>[];
      }
    }

    final List<String>? b16ScanPathListPqmvzr = await DocumentScanner.scan(
      format: DocScanFormat.jpeg,
    );
    final List<String> b16PathsVqntza = _b16ValidPathsHqmwza(
      b16ScanPathListPqmvzr,
    );
    if (b16OpenResultQxnvza) {
      _b16OpenImagesResultVqntza(b16PathsVqntza, B16ImagesResultSource.scan);
    }
    return b16PathsVqntza;
  }

  Future<List<String>> chooseImages({bool b16OpenResultQxnvza = true}) async {
    if(b16OpenResultQxnvza){
      B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(b16PointTypeQxnvza: B16PointTypeJdwijdiw.tool_image_to_pdf);
    }
    final List<XFile> b16ImageListKqmvzr = await ImagePicker().pickMultiImage();
    final List<String> b16PathsVqntza = _b16ValidPathsHqmwza(
      b16ImageListKqmvzr.map((XFile b16ImageQxnvza) => b16ImageQxnvza.path),
    );
    if (b16OpenResultQxnvza) {
      _b16OpenImagesResultVqntza(b16PathsVqntza, B16ImagesResultSource.choose);
    }
    return b16PathsVqntza;
  }

  List<String> _b16ValidPathsHqmwza(Iterable<String>? b16ImagePathsHqmwza) {
    return b16ImagePathsHqmwza
            ?.where((String b16PathKqmwze) => b16PathKqmwze.isNotEmpty)
            .toList(growable: false) ??
        const <String>[];
  }

  void _b16OpenImagesResultVqntza(
    List<String> b16ValidPathsPqnvze,
    B16ImagesResultSource b16SourceKqmwze,
  ) {
    if (b16ValidPathsPqnvze.isEmpty) return;

    B16RoutersHepFjeifjoe.b16PushNamedHkqvpa<void>(
      b16RouteNameMcfzsq: B16RoutersAddressFjeifjeo.b16ImagesResultRouteVqntza,
      b16ArgumentsXvedlu: <String, dynamic>{
        'b16ImagePaths': b16ValidPathsPqnvze,
        'b16Source': b16SourceKqmwze,
      },
    );
  }
}
