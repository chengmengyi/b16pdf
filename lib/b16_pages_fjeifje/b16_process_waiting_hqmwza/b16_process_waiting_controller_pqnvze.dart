import 'dart:io';

import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:get/get.dart';

class B16ProcessWaitingControllerPqnvze extends B16RootControllerFjesak {
  final List<String> b16ImagePathsQxnvza = List<String>.from(
    (Get.arguments?['b16ImagePaths'] as List?)?.whereType<String>() ??
        const <String>[],
  );
  double b16ProgressVqntza = 0;
  bool b16GeneratingHqmwza = false;

  int get b16ProcessedCountKqmwze {
    if (b16ImagePathsQxnvza.isEmpty) return 0;
    return (b16ProgressVqntza * b16ImagePathsQxnvza.length).ceil().clamp(
      0,
      b16ImagePathsQxnvza.length,
    );
  }

  int get b16ProgressPercentPqnvze => (b16ProgressVqntza * 100).round();

  void clickBack() => B16RoutersHepFjeifjoe.b16BackFtynwp();

  @override
  void onReady() {
    super.onReady();
    _b16GeneratePdfKqmwze();
  }

  Future<void> _b16GeneratePdfKqmwze() async {
    if (b16GeneratingHqmwza || b16ImagePathsQxnvza.isEmpty) return;
    b16GeneratingHqmwza = true;
    try {
      final List<FileToolsFileInfo> b16ImagesVqntza = <FileToolsFileInfo>[];
      for (final String b16PathQxnvza in b16ImagePathsQxnvza) {
        final File b16FileHqmwza = File(b16PathQxnvza);
        final FileStat b16StatKqmwze = await b16FileHqmwza.stat();
        b16ImagesVqntza.add(
          FileToolsFileInfo(
            name: b16PathQxnvza.split(Platform.pathSeparator).last,
            path: b16PathQxnvza,
            size: b16StatKqmwze.size,
            updateTime: b16StatKqmwze.modified.millisecondsSinceEpoch,
          ),
        );
      }
      final FileToolsFileInfo b16ResultPqnvze =
          await FlutterPreviewFile.generatePdfFromImages(
            imageList: b16ImagesVqntza,
            onProgress: (double b16ValueKqmwze) {
              if (isClosed) return;
              b16ProgressVqntza = b16ValueKqmwze.clamp(0, 1);
              update();
            },
          );
      if (isClosed) return;
      b16ProgressVqntza = 1;
      update();
      B16RoutersHepFjeifjoe.b16ReplaceNamedZxplrt<void>(
        b16RouteNameYweqpn:
            B16RoutersAddressFjeifjeo.b16ProcessResultRoutePqnvze,
        b16ArgumentsKstjva: <String, dynamic>{'b16FileInfo': b16ResultPqnvze},
      );
    } catch (b16ErrorKqmwze) {
      if (isClosed ||
          b16ErrorKqmwze.toString().contains('generate_pdf_replaced')) {
        return;
      }
      rethrow;
    } finally {
      if (!isClosed) {
        b16GeneratingHqmwza = false;
      }
    }
  }
}
