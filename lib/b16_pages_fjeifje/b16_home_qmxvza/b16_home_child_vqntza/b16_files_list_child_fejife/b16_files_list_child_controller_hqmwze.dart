import 'dart:io';

import 'package:b16pdf/b16_dialog_fjifjie/b16_sort_bottom_dialog_fjiewfjoe/b16_sort_bottom_dialog_fjiewfjoe.dart';
import 'package:b16pdf/b16_dialog_fjifjie/b16_sort_bottom_dialog_fjiewfjoe/b16_sort_bottom_dialog_fjiewfjoe_controller.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_permission_hep_qzmxva/b16_permission_hep_kqnvze.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_file_sort_storage_mqnvza.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_child_vqntza/b16_home_child_controller_rkpxwe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:device_info_plus/device_info_plus.dart';

enum B16FilesListStateQmvnza { noPermission, loading, loaded }

class B16FilesListChildControllerHqmwze extends B16RootControllerFjesak {
  final B16FileTabTypeefie type;
  final RefreshController refreshController = RefreshController();
  B16FilesListStateQmvnza b16ListStatePqmxza = B16FilesListStateQmvnza.loading;
  List<FileToolsFileInfo> b16AllFilesKqnvze = [];
  List<FileToolsFileInfo> b16VisibleFilesVqmwza = [];
  String b16SearchTextHqmxze = '';
  late B16SortType b16SortTypePqnvza;

  B16FilesListChildControllerHqmwze({required this.type});

  Future<Permission> _b16StoragePermissionQxmvza() async {
    if (!Platform.isAndroid) return Permission.storage;
    final b16AndroidInfoKqnvze = await DeviceInfoPlugin().androidInfo;
    return b16AndroidInfoKqnvze.version.sdkInt >= 30
        ? Permission.manageExternalStorage
        : Permission.storage;
  }

  @override
  void onInit() {
    b16SortTypePqnvza = B16SortType.values.firstWhere(
      (b16ItemVqmxza) =>
          b16ItemVqmxza.name ==
          B16FileSortStorageMqnvza.b16ReadSortNameHqmwze(type.name),
      orElse: () => B16SortType.dateNew,
    );
    super.onInit();
    _b16CheckInitialPermissionKqmwza();
  }

  Future<void> _b16CheckInitialPermissionKqmwza() async {
    final b16PermissionVqmxza = await _b16StoragePermissionQxmvza();
    b16ListStatePqmxza = await b16PermissionVqmxza.isGranted
        ? B16FilesListStateQmvnza.loading
        : B16FilesListStateQmvnza.noPermission;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    b16LoadFilesPqnvze();
  }

  Future<void> b16LoadFilesPqnvze({bool b16ShowLoadingQxmvza = true}) async {
    final b16PermissionHqmwza = await _b16StoragePermissionQxmvza();
    final b16ResultKqmwza = await B16PermissionHepKqnvze.instance
        .requestPermission(b16PermissionQxmvza: b16PermissionHqmwza);
    if (!b16ResultKqmwza.b16IsGrantedHqmwza) {
      b16ListStatePqmxza = B16FilesListStateQmvnza.noPermission;
      refreshController.refreshCompleted();
      update();
      return;
    }
    if (b16ShowLoadingQxmvza) {
      b16ListStatePqmxza = B16FilesListStateQmvnza.loading;
      update();
    }
    b16AllFilesKqnvze = await FlutterPreviewFile.queryFileList(
      FileToolsDocumentType.values[type.index],
    );
    _b16SortFilesHqmwza();
    _b16ApplySearchVqmxze();
    b16ListStatePqmxza = B16FilesListStateQmvnza.loaded;
    refreshController.refreshCompleted();
    update();
  }

  void b16RefreshFilesVqmwza() {
    b16LoadFilesPqnvze(b16ShowLoadingQxmvza: false);
  }

  void _b16SortFilesHqmwza() {
    b16AllFilesKqnvze.sort((b16LeftQxmvza, b16RightPqnvze) {
      switch (b16SortTypePqnvza) {
        case B16SortType.dateNew:
          return (b16RightPqnvze.updateTime ?? 0).compareTo(
            b16LeftQxmvza.updateTime ?? 0,
          );
        case B16SortType.dateOld:
          return (b16LeftQxmvza.updateTime ?? 0).compareTo(
            b16RightPqnvze.updateTime ?? 0,
          );
        case B16SortType.nameAZ:
          return (b16LeftQxmvza.name ?? '').toLowerCase().compareTo(
            (b16RightPqnvze.name ?? '').toLowerCase(),
          );
        case B16SortType.nameZA:
          return (b16RightPqnvze.name ?? '').toLowerCase().compareTo(
            (b16LeftQxmvza.name ?? '').toLowerCase(),
          );
      }
    });
  }

  void _b16ApplySearchVqmxze() {
    final b16KeywordPqmwza = b16SearchTextHqmxze.trim().toLowerCase();
    b16VisibleFilesVqmwza = b16KeywordPqmwza.isEmpty
        ? List<FileToolsFileInfo>.from(b16AllFilesKqnvze)
        : b16AllFilesKqnvze
              .where(
                (b16FileKqnvze) => (b16FileKqnvze.name ?? '')
                    .toLowerCase()
                    .contains(b16KeywordPqmwza),
              )
              .toList();
  }

  Future<void> clickSort() async {
    final b16PermissionTypeKqnvze = await _b16StoragePermissionQxmvza();
    final b16PermissionPqmvza = await B16PermissionHepKqnvze.instance
        .requestPermission(b16PermissionQxmvza: b16PermissionTypeKqnvze);
    if (!b16PermissionPqmvza.b16IsGrantedHqmwza) return;
    final b16SelectedVqmxza =
        await B16RoutersHepFjeifjoe.b16ShowBottomSheetVxqprn<B16SortType>(
          b16ChildQnwxza: B16SortBottomDialogFjiewfjoe(
            b16SelectedTypeHqmwza: b16SortTypePqnvza,
          ),
        );
    if (b16SelectedVqmxza == null) return;
    b16SortTypePqnvza = b16SelectedVqmxza;
    await B16FileSortStorageMqnvza.b16WriteSortNamePqmxza(
      b16TabNameVqntze: type.name,
      b16SortNameHqmwza: b16SelectedVqmxza.name,
    );
    _b16SortFilesHqmwza();
    _b16ApplySearchVqmxze();
    update();
  }

  Future<void> clickDeleteFile() async {
    final b16PermissionTypePqmwza = await _b16StoragePermissionQxmvza();
    final b16PermissionVqmxza = await B16PermissionHepKqnvze.instance
        .requestPermission(b16PermissionQxmvza: b16PermissionTypePqmwza);
    if (!b16PermissionVqmxza.b16IsGrantedHqmwza) return;
    B16RoutersHepFjeifjoe.b16PushNamedHkqvpa(
      b16RouteNameMcfzsq: B16RoutersAddressFjeifjeo.b16DeleteFileRouteKqnvze,
      b16ArgumentsXvedlu: {'files': b16VisibleFilesVqmwza},
    );
  }

  void clickFileItem(FileToolsFileInfo b16FileInfoQxmvza) {
    final String? b16RouteNameKqnvze = switch (b16FileInfoQxmvza.type) {
      FileToolsDocumentType.pdf =>
        B16RoutersAddressFjeifjeo.b16PreviewPdfRouteQxmvza,
      FileToolsDocumentType.word =>
        B16RoutersAddressFjeifjeo.b16PreviewWordRouteVqntza,
      FileToolsDocumentType.excel =>
        B16RoutersAddressFjeifjeo.b16PreviewExcelRouteRqmwza,
      _ => null,
    };
    if (b16RouteNameKqnvze == null) return;
    B16RoutersHepFjeifjoe.b16PushNamedHkqvpa(
      b16RouteNameMcfzsq: b16RouteNameKqnvze,
      b16ArgumentsXvedlu: {'file': b16FileInfoQxmvza},
    );
  }

  @override
  bool b16RegisterEventfeijif() => true;

  @override
  void b16HandleEventhrifjei(B16EventBeanFhifeode b16EventQzmxva) async {
    if (b16EventQzmxva.b16EventCodeFhfemie == 160101) {
      final b16PermissionKqnvze = await _b16StoragePermissionQxmvza();
      if (!await b16PermissionKqnvze.isGranted) return;
      b16SearchTextHqmxze = b16EventQzmxva.b16StringValueDjijie ?? '';
      _b16ApplySearchVqmxze();
      update();
    } else if (b16EventQzmxva.b16EventCodeFhfemie == 160102) {
      b16LoadFilesPqnvze();
    }
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }
}
