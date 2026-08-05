import 'dart:io';

import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:get/get.dart';

class B16ProcessResultControllerHqmwze extends B16RootControllerFjesak {
  final FileToolsFileInfo b16FileInfoQxnvza =
      Get.arguments['b16FileInfo'] as FileToolsFileInfo;

  String get b16FileNameVqntza {
    final String b16NameKqmwze = b16FileInfoQxnvza.name ?? '';
    if (b16NameKqmwze.isNotEmpty) return b16NameKqmwze;
    return (b16FileInfoQxnvza.path ?? '').split(Platform.pathSeparator).last;
  }

  String get b16FileDetailHqmwza {
    final DateTime b16DateQxnvza = DateTime.fromMillisecondsSinceEpoch(
      b16FileInfoQxnvza.updateTime ?? DateTime.now().millisecondsSinceEpoch,
    );
    final String b16DateTextKqmwze =
        '${b16DateQxnvza.year}-${b16DateQxnvza.month.toString().padLeft(2, '0')}-${b16DateQxnvza.day.toString().padLeft(2, '0')}';
    final double b16SizeVqntza = (b16FileInfoQxnvza.size ?? 0) / 1024 / 1024;
    return '$b16DateTextKqmwze | ${b16SizeVqntza.toStringAsFixed(1)}M';
  }

  void clickBack() => B16RoutersHepFjeifjoe.b16BackFtynwp();

  void clickOpen() {
    B16RoutersHepFjeifjoe.b16ReplaceNamedZxplrt<void>(
      b16RouteNameYweqpn: B16RoutersAddressFjeifjeo.b16PreviewPdfRouteQxmvza,
      b16ArgumentsKstjva: <String, dynamic>{'file': b16FileInfoQxnvza},
    );
  }
}
