import 'dart:async';
import 'dart:io';

import 'package:b16pdf/b16_dialog_fjifjie/b16_sort_bottom_dialog_fjiewfjoe/b16_sort_bottom_dialog_fjiewfjoe.dart';
import 'package:b16pdf/b16_dialog_fjifjie/b16_sort_bottom_dialog_fjiewfjoe/b16_sort_bottom_dialog_fjiewfjoe_controller.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_code_qxmvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_hep_fjiejizx.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_demo_file_hep_qxnvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_permission_hep_qzmxva/b16_permission_hep_kqnvze.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_file_sort_storage_mqnvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_point_type_jdwijdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_tba_hep_djiwjidw.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_child_vqntza/b16_home_child_controller_rkpxwe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:device_info_plus/device_info_plus.dart';

enum B16FilesListStateQmvnza { noPermission, loading, loaded }

class B16FilesListChildControllerHqmwze extends B16RootControllerFjesak {
  static const int b16NativeAdIntervalKqmvze = 4;
  static const Duration _b16NativeAdRefreshDurationVqntza = Duration(
    seconds: 10,
  );
  static const Duration _b16ScrollIdleDurationHqmwza = Duration(
    milliseconds: 280,
  );

  final B16FileTabTypeefie type;
  final RefreshController refreshController = RefreshController();
  final ScrollController b16ScrollControllerPqnvze = ScrollController();
  final Set<int> _b16VisibleNativeAdIndexesVqmwza = <int>{};
  Timer? _b16ScrollIdleTimerKqnvze;
  Timer? _b16NativeAdRefreshTimerHqmwza;
  B16FilesListStateQmvnza b16ListStatePqmxza = B16FilesListStateQmvnza.loading;
  List<FileToolsFileInfo> b16AllFilesKqnvze = [];
  List<FileToolsFileInfo> b16VisibleFilesVqmwza = [];
  FileToolsFileInfo? b16DemoFileInfoQxnvza;
  String b16SearchTextHqmxze = '';
  bool b16LoadingFilesVqntza = false;
  bool b16HasLoadedFilesKqmwze = false;
  bool b16AppInForegroundQxnvza = true;
  int? b16ActiveNativeAdIndexPqmxza;
  int? _b16LastChanceNativeAdIndexVqntza;
  int b16NativeAdRefreshKeyQxnvza = 0;
  int _b16LatestListItemCountKqmwze = 0;
  bool _b16IsListScrollingPqnvze = false;
  bool _b16IsRefreshingNativeAdVqmwza = false;
  bool _b16NativeAdSwitchEnabledQxnvza = false;
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
    b16ScrollControllerPqnvze.addListener(_b16HandleScrollKqmwze);
    unawaited(_b16InitializeNativeAdSwitchPqnvze());
  }

  Future<void> _b16InitializeNativeAdSwitchPqnvze() async {
    _b16NativeAdSwitchEnabledQxnvza = await B16AdHepJiwdjow
        .b16AdUtilsInstanceKqmvzr
        .b16CanShowAdBySwitchVqntza(B16PosidJkwkosw.pr_main_banner1);
    if (isClosed) return;
    if (!_b16NativeAdSwitchEnabledQxnvza) {
      _b16ClearActiveNativeAdKqnvze();
    }
    update();
  }

  bool get b16CanShowNativeAdHqmwza =>
      _b16NativeAdSwitchEnabledQxnvza &&
      B16UserCheckHepQxnvza.instance.b16IsEligibleUserVqntza &&
      b16VisibleFilesVqmwza.length >= b16NativeAdIntervalKqmvze;

  bool b16IsNativeAdIndexVqntza(int b16IndexKqnvze) =>
      (b16IndexKqnvze + 1) % (b16NativeAdIntervalKqmvze + 1) == 0;

  int b16FileIndexFromListIndexVqmwza(int b16IndexPqnvze) =>
      b16IndexPqnvze - (b16IndexPqnvze + 1) ~/ (b16NativeAdIntervalKqmvze + 1);

  void b16SyncNativeAdListStatePqnvze(int b16ItemCountVqmwza) {
    _b16LatestListItemCountKqmwze = b16ItemCountVqmwza;
    _b16VisibleNativeAdIndexesVqmwza.removeWhere(
      (b16IndexKqnvze) => b16IndexKqnvze >= b16ItemCountVqmwza,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isClosed || _b16IsRefreshingNativeAdVqmwza) return;
      if (!b16CanShowNativeAdHqmwza || b16ItemCountVqmwza <= 0) {
        _b16ClearActiveNativeAdKqnvze();
      } else if (b16ActiveNativeAdIndexPqmxza == null ||
          b16ActiveNativeAdIndexPqmxza! >= b16ItemCountVqmwza) {
        _b16ActivateNativeAdQxmvza();
      } else {
        _b16StartNativeAdRefreshTimerVqntza();
      }
    });
  }

  void b16PrepareNativeAdSlotHqmwza(int b16ListIndexKqnvze) {
    if (b16CanShowNativeAdHqmwza &&
        b16ActiveNativeAdIndexPqmxza == b16ListIndexKqnvze &&
        _b16LastChanceNativeAdIndexVqntza != b16ListIndexKqnvze) {
      _b16LastChanceNativeAdIndexVqntza = b16ListIndexKqnvze;
      _b16UploadNativeAdChanceQxmvza();
    }
  }

  void b16UpdateNativeAdVisibilityPqnvze(
    int b16IndexKqnvze,
    bool b16VisibleQxmvza,
  ) {
    if (isClosed) return;
    final bool b16ChangedVqmwza = b16VisibleQxmvza
        ? _b16VisibleNativeAdIndexesVqmwza.add(b16IndexKqnvze)
        : _b16VisibleNativeAdIndexesVqmwza.remove(b16IndexKqnvze);
    if (!b16ChangedVqmwza) return;
    if (!b16VisibleQxmvza && b16ActiveNativeAdIndexPqmxza == b16IndexKqnvze) {
      b16ActiveNativeAdIndexPqmxza = null;
      if (_b16LastChanceNativeAdIndexVqntza == b16IndexKqnvze) {
        _b16LastChanceNativeAdIndexVqntza = null;
      }
      _b16StopNativeAdRefreshTimerQxnvza();
      update();
    }
    if (b16VisibleQxmvza &&
        b16AppInForegroundQxnvza &&
        !_b16IsListScrollingPqnvze &&
        !_b16IsRefreshingNativeAdVqmwza) {
      _b16ActivateNativeAdQxmvza();
    }
  }

  void _b16HandleScrollKqmwze() {
    if (isClosed || !b16CanShowNativeAdHqmwza) return;
    _b16IsListScrollingPqnvze = true;
    _b16ScrollIdleTimerKqnvze?.cancel();
    _b16StopNativeAdRefreshTimerQxnvza();
    _b16ScrollIdleTimerKqnvze = Timer(_b16ScrollIdleDurationHqmwza, () {
      if (isClosed || !b16CanShowNativeAdHqmwza) return;
      _b16IsListScrollingPqnvze = false;
      _b16ActivateNativeAdQxmvza();
    });
  }

  void _b16ActivateNativeAdQxmvza() {
    if (!b16AppInForegroundQxnvza || _b16VisibleNativeAdIndexesVqmwza.isEmpty) {
      _b16StopNativeAdRefreshTimerQxnvza();
      return;
    }
    final List<int> b16VisibleIndexesQxmvza =
        _b16VisibleNativeAdIndexesVqmwza
            .where(
              (b16IndexVqntza) =>
                  b16IndexVqntza < _b16LatestListItemCountKqmwze,
            )
            .toList()
          ..sort();
    if (b16VisibleIndexesQxmvza.isEmpty) return;
    final int b16IndexVqmwza = b16VisibleIndexesQxmvza.first;
    if (b16ActiveNativeAdIndexPqmxza != b16IndexVqmwza) {
      b16ActiveNativeAdIndexPqmxza = b16IndexVqmwza;
      update();
    }
    _b16StartNativeAdRefreshTimerVqntza();
  }

  bool _b16CanRefreshNativeAdKqnvze() {
    final int? b16ActiveIndexQxmvza = b16ActiveNativeAdIndexPqmxza;
    return !isClosed &&
        b16AppInForegroundQxnvza &&
        !_b16IsRefreshingNativeAdVqmwza &&
        !_b16IsListScrollingPqnvze &&
        b16ActiveIndexQxmvza != null &&
        _b16VisibleNativeAdIndexesVqmwza.contains(b16ActiveIndexQxmvza) &&
        b16CanShowNativeAdHqmwza;
  }

  bool _b16CanContinueNativeAdRefreshRqmwza(int b16IndexKqnvze) =>
      !isClosed &&
      b16AppInForegroundQxnvza &&
      !_b16IsListScrollingPqnvze &&
      _b16VisibleNativeAdIndexesVqmwza.contains(b16IndexKqnvze) &&
      b16CanShowNativeAdHqmwza;

  void _b16StartNativeAdRefreshTimerVqntza() {
    if (!_b16CanRefreshNativeAdKqnvze()) return;
    _b16NativeAdRefreshTimerHqmwza ??= Timer.periodic(
      _b16NativeAdRefreshDurationVqntza,
      (_) => unawaited(_b16RefreshActiveNativeAdPqnvze()),
    );
  }

  void _b16StopNativeAdRefreshTimerQxnvza() {
    _b16NativeAdRefreshTimerHqmwza?.cancel();
    _b16NativeAdRefreshTimerHqmwza = null;
  }

  void _b16ClearActiveNativeAdKqnvze() {
    _b16StopNativeAdRefreshTimerQxnvza();
    _b16LastChanceNativeAdIndexVqntza = null;
    if (b16ActiveNativeAdIndexPqmxza != null) {
      b16ActiveNativeAdIndexPqmxza = null;
      update();
    }
  }

  Future<void> _b16RefreshActiveNativeAdPqnvze() async {
    if (!_b16CanRefreshNativeAdKqnvze()) return;
    final int b16RefreshIndexKqnvze = b16ActiveNativeAdIndexPqmxza!;
    _b16IsRefreshingNativeAdVqmwza = true;
    _b16UploadNativeAdChanceQxmvza();
    try {
      b16ActiveNativeAdIndexPqmxza = null;
      update();
      await WidgetsBinding.instance.endOfFrame;
      await Future<void>.delayed(Duration.zero);
      if (!_b16CanContinueNativeAdRefreshRqmwza(b16RefreshIndexKqnvze)) return;
      final B16AdHepJiwdjow b16AdHepVqmwza =
          B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr;
      if (!await b16AdHepVqmwza.b16HasFilesListNativeAdPqmvzr()) {
        await b16AdHepVqmwza.b16RequestFilesListNativeAdPqmvzr();
      }
      if (!_b16CanContinueNativeAdRefreshRqmwza(b16RefreshIndexKqnvze)) return;
      b16NativeAdRefreshKeyQxnvza++;
      b16ActiveNativeAdIndexPqmxza = b16RefreshIndexKqnvze;
      update();
    } finally {
      _b16IsRefreshingNativeAdVqmwza = false;
      if (b16AppInForegroundQxnvza &&
          !_b16IsListScrollingPqnvze &&
          b16CanShowNativeAdHqmwza &&
          b16ActiveNativeAdIndexPqmxza == null) {
        _b16ActivateNativeAdQxmvza();
      }
    }
  }

  void _b16UploadNativeAdChanceQxmvza() {
    if (!_b16NativeAdSwitchEnabledQxnvza) return;
    B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16UploadAdChanceKqnvxe(
      b16AdScenePqmvzr: B16AdSceneJdwo.pr_ban1,
      b16AdPosIdKqmvzr: B16PosidJkwkosw.pr_main_banner1,
    );
  }

  @override
  void onReady() {
    super.onReady();
    b16LoadFilesPqnvze();
  }

  Future<void> b16LoadFilesPqnvze({
    bool b16ShowLoadingQxmvza = true,
    bool b16ForceReloadVqntza = false,
  }) async {
    if (b16LoadingFilesVqntza ||
        (b16HasLoadedFilesKqmwze && !b16ForceReloadVqntza)) {
      refreshController.refreshCompleted();
      return;
    }
    final b16PermissionHqmwza = await _b16StoragePermissionQxmvza();
    if (!await b16PermissionHqmwza.isGranted) {
      await _b16PrepareDemoFileVqntza();
      b16ListStatePqmxza = B16FilesListStateQmvnza.noPermission;
      refreshController.refreshCompleted();
      update();
      return;
    }
    b16LoadingFilesVqntza = true;
    if (b16ShowLoadingQxmvza) {
      b16ListStatePqmxza = B16FilesListStateQmvnza.loading;
      update();
    }
    try {
      b16AllFilesKqnvze = await FlutterPreviewFile.queryFileList(
        FileToolsDocumentType.values[type.index],
      );
      _b16SortFilesHqmwza();
      _b16ApplySearchVqmxze();
      if (b16VisibleFilesVqmwza.isEmpty) {
        await _b16PrepareDemoFileVqntza();
      }
      b16HasLoadedFilesKqmwze = true;
      b16ListStatePqmxza = B16FilesListStateQmvnza.loaded;
    } finally {
      b16LoadingFilesVqntza = false;
      refreshController.refreshCompleted();
      update();
    }
  }

  void b16RefreshFilesVqmwza() {
    b16LoadFilesPqnvze(b16ShowLoadingQxmvza: false, b16ForceReloadVqntza: true);
  }

  void clickRequestPermission() {
    B16EventHepFjiejizx.instance.b16SendMsgFjijeio(
      B16EventBeanFhifeode(
        b16EventCodeFhfemie:
            B16EventCodeQxmvza.b16StoragePermissionRequestRqmwza,
      ),
    );
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

  Future<void> _b16PrepareDemoFileVqntza() async {
    b16DemoFileInfoQxnvza = await B16DemoFileHepQxnvza.instance
        .b16GetDemoPdfInfoKqnvxe();
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
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.editor_entry,
    );
    B16RoutersHepFjeifjoe.b16PushNamedHkqvpa(
      b16RouteNameMcfzsq: b16RouteNameKqnvze,
      b16ArgumentsXvedlu: {'file': b16FileInfoQxmvza},
    );
  }

  @override
  bool b16RegisterEventfeijif() => true;

  @override
  void b16HandleEventhrifjei(B16EventBeanFhifeode b16EventQzmxva) async {
    if (b16EventQzmxva.b16EventCodeFhfemie ==
        B16EventCodeQxmvza.b16AppLifecycleKqmwze) {
      b16AppInForegroundQxnvza = b16EventQzmxva.b16IntValueDjijie != 1;
      if (b16AppInForegroundQxnvza) {
        _b16ActivateNativeAdQxmvza();
      } else {
        _b16StopNativeAdRefreshTimerQxnvza();
      }
    } else if (b16EventQzmxva.b16EventCodeFhfemie ==
        B16EventCodeQxmvza.b16FileSearchVqntza) {
      final b16PermissionKqnvze = await _b16StoragePermissionQxmvza();
      if (!await b16PermissionKqnvze.isGranted) return;
      b16SearchTextHqmxze = b16EventQzmxva.b16StringValueDjijie ?? '';
      _b16ApplySearchVqmxze();
      update();
    } else if (b16EventQzmxva.b16EventCodeFhfemie ==
        B16EventCodeQxmvza.b16FileListRefreshHqmwza) {
      b16LoadFilesPqnvze(b16ForceReloadVqntza: true);
    } else if (b16EventQzmxva.b16EventCodeFhfemie ==
        B16EventCodeQxmvza.b16StoragePermissionGrantedTqnvze) {
      b16LoadFilesPqnvze();
    } else if (b16EventQzmxva.b16EventCodeFhfemie ==
        B16EventCodeQxmvza.b16RefreshBUserStatePqmvzr) {
      update();
    }
  }

  @override
  void onClose() {
    _b16StopNativeAdRefreshTimerQxnvza();
    _b16ScrollIdleTimerKqnvze?.cancel();
    _b16ScrollIdleTimerKqnvze = null;
    b16ScrollControllerPqnvze.removeListener(_b16HandleScrollKqmwze);
    b16ScrollControllerPqnvze.dispose();
    refreshController.dispose();
    super.onClose();
  }
}
