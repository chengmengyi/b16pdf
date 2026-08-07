import 'dart:io';

import 'package:b16pdf/b16_hep_djijdow/b16_images_hep_qxmvza/b16_images_hep_kqmwze.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_permission_hep_qzmxva/b16_permission_hep_kqnvze.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

enum B16ImagesResultSource { scan, choose }

class B16ImagesResultControllerKqmwze extends B16RootControllerFjesak {
  final List<String> b16ImagePathsQxnvza = List<String>.from(
    (Get.arguments?['b16ImagePaths'] as List?)?.whereType<String>() ??
        const <String>[],
  );
  final B16ImagesResultSource b16SourceVqntza =
      Get.arguments?['b16Source'] as B16ImagesResultSource? ??
      B16ImagesResultSource.choose;
  final PageController b16PageControllerHqmwza = PageController();
  final ScrollController b16ThumbnailControllerPqnvze = ScrollController();
  int b16SelectedIndexKqmwze = 0;

  void clickBack() => B16RoutersHepFjeifjoe.b16BackWithExitAdPqnvze<void>();

  void b16SelectImageVqntza(int b16IndexQxnvza) {
    if (b16IndexQxnvza < 0 || b16IndexQxnvza >= b16ImagePathsQxnvza.length) {
      return;
    }
    b16SelectedIndexKqmwze = b16IndexQxnvza;
    b16PageControllerHqmwza.animateToPage(
      b16IndexQxnvza,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeInOut,
    );
    _b16ScrollThumbnailKqmwze();
    update();
  }

  void b16PageChangedHqmwza(int b16IndexQxnvza) {
    b16SelectedIndexKqmwze = b16IndexQxnvza;
    _b16ScrollThumbnailKqmwze();
    update();
  }

  Future<void> clickReplace() async {
    final List<String> b16NewPathsVqntza = await _b16PickImagesQxnvza();
    if (b16NewPathsVqntza.isEmpty || b16ImagePathsQxnvza.isEmpty) return;
    b16ImagePathsQxnvza[b16SelectedIndexKqmwze] = b16NewPathsVqntza.first;
    update();
  }

  Future<void> clickAdd() async {
    final List<String> b16NewPathsVqntza = await _b16PickImagesQxnvza();
    if (b16NewPathsVqntza.isEmpty) return;
    b16ImagePathsQxnvza.addAll(b16NewPathsVqntza);
    update();
  }

  Future<List<String>> _b16PickImagesQxnvza() {
    return switch (b16SourceVqntza) {
      B16ImagesResultSource.scan => B16ImagesHepKqmwze.instance.toScan(
        b16OpenResultQxnvza: false,
      ),
      B16ImagesResultSource.choose => B16ImagesHepKqmwze.instance.chooseImages(
        b16OpenResultQxnvza: false,
      ),
    };
  }

  Future<void> clickSave() async {
    if (b16ImagePathsQxnvza.isEmpty) return;
    if(b16ImagePathsQxnvza.length>100){
      Fluttertoast.showToast(msg: 'Max 100 images allowed'.tr);
      return;
    }
    final Permission b16PermissionQxnvza = await _b16StoragePermissionVqntza();
    final B16PermissionResultVqmxze b16ResultHqmwza =
        await B16PermissionHepKqnvze.instance.requestPermission(
          b16PermissionQxmvza: b16PermissionQxnvza,
        );
    if (!b16ResultHqmwza.b16IsGrantedHqmwza) return;
    B16RoutersHepFjeifjoe.b16PushNamedHkqvpa<void>(
      b16RouteNameMcfzsq:
          B16RoutersAddressFjeifjeo.b16ProcessWaitingRouteHqmwza,
      b16ArgumentsXvedlu: <String, dynamic>{
        'b16ImagePaths': List<String>.from(b16ImagePathsQxnvza),
        'b16Source': b16SourceVqntza,
      },
    );
  }

  Future<Permission> _b16StoragePermissionVqntza() async {
    if (!Platform.isAndroid) return Permission.storage;
    final b16AndroidInfoQxnvza = await DeviceInfoPlugin().androidInfo;
    return b16AndroidInfoQxnvza.version.sdkInt >= 30
        ? Permission.manageExternalStorage
        : Permission.storage;
  }

  void _b16ScrollThumbnailKqmwze() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!b16ThumbnailControllerPqnvze.hasClients) return;
      final double b16TargetQxnvza = (b16SelectedIndexKqmwze * 80.0).clamp(
        0,
        b16ThumbnailControllerPqnvze.position.maxScrollExtent,
      );
      b16ThumbnailControllerPqnvze.animateTo(
        b16TargetQxnvza,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void onClose() {
    b16PageControllerHqmwza.dispose();
    b16ThumbnailControllerPqnvze.dispose();
    super.onClose();
  }
}
