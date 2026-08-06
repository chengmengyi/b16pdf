import 'dart:async';

import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_child_vqntza/b16_files_list_child_fejife/b16_files_list_child_controller_hqmwze.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_child_vqntza/b16_home_child_controller_rkpxwe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_child_mxkqza.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_media_padding_view_vnyqsl.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_refresh_view_dkgwta.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class B16FilesListChildPageQxmvza extends B16RootChildMxkqza {
  final B16FileTabTypeefie type;
  B16FilesListChildPageQxmvza({super.key, required this.type});

  @override
  State<B16FilesListChildPageQxmvza> createState() =>
      _B16FilesListChildStateVqnxre();
}

class _B16FilesListChildStateVqnxre
    extends
        B16RootChildStatePrvwlt<
          B16FilesListChildControllerHqmwze,
          B16FilesListChildPageQxmvza
        > {
  static const int _b16NativeAdIntervalKqmvze = 4;
  static const Duration _b16NativeAdRefreshDurationVqntza = Duration(
    seconds: 10,
  );
  static const Duration _b16ScrollIdleDurationHqmwza = Duration(
    milliseconds: 280,
  );

  final ScrollController _b16ScrollControllerPqnvze = ScrollController();
  final Map<int, GlobalKey> _b16NativeAdKeyMapQxmvza = <int, GlobalKey>{};
  final Set<int> _b16VisibleNativeAdIndexesVqmwza = <int>{};
  Timer? _b16ScrollIdleTimerKqnvze;
  Timer? _b16NativeAdRefreshTimerHqmwza;
  int? _b16ActiveNativeAdIndexPqmxza;
  int? _b16LastChanceNativeAdIndexVqntza;
  int _b16LatestListItemCountKqmwze = 0;
  int _b16NativeAdRefreshKeyQxnvza = 0;
  bool _b16IsListScrollingPqnvze = false;
  bool _b16IsRefreshingNativeAdVqmwza = false;

  @override
  void initState() {
    super.initState();
    _b16ScrollControllerPqnvze.addListener(_b16HandleScrollKqmwze);
  }

  @override
  void dispose() {
    _b16StopNativeAdRefreshTimerQxnvza();
    _b16ScrollIdleTimerKqnvze?.cancel();
    _b16ScrollControllerPqnvze.removeListener(_b16HandleScrollKqmwze);
    _b16ScrollControllerPqnvze.dispose();
    super.dispose();
  }

  @override
  String get b16ControllerTagVdsyre => 'b16_files_${widget.type.name}';

  @override
  B16FilesListChildControllerHqmwze b16CreateControllerNwztpi() {
    return B16FilesListChildControllerHqmwze(type: widget.type);
  }

  @override
  Widget b16BuildContentYksuvd(
    BuildContext b16ContextKqmwza,
    B16FilesListChildControllerHqmwze b16ControllerVqnxre,
  ) {
    return GetBuilder<B16FilesListChildControllerHqmwze>(
      init: b16ControllerVqnxre,
      global: false,
      builder: (b16ControllerQxmvza) => Column(
        children: [
          _sortWidget(b16ControllerQxmvza),
          SizedBox(height: 8.h),
          _contentWidget(b16ControllerQxmvza),
        ],
      ),
    );
  }

  _sortWidget(B16FilesListChildControllerHqmwze b16controllerVqnxre) => Row(
    children: [
      Expanded(
        child: B16LocalizedTextViewCxmpra(
          "Local Storage".tr,
          b16FontSizeRvxqle: 18.sp,
          b16ColorDtkzma: Colors.black,
          b16FontWeightHncysp: FontWeight.bold,
          b16OverflowFzrxke: TextOverflow.ellipsis,
        ),
      ),
      SizedBox(width: 8.w),
      B16TapGuardViewMfwqke(
        b16OnPressedJkcxwu: () {
          b16controllerVqnxre.clickSort();
        },
        b16ChildHnqvsa: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            B16AssetImageViewPzrxcu(
              b16controllerVqnxre.b16SortTypePqnvza.b16IconKqnvxe,
              b16WidthDtvqpl: 20.w,
              b16HeightRnxkse: 20.w,
            ),
            SizedBox(width: 4.w),
            B16LocalizedTextViewCxmpra(
              "Sort".tr,
              b16FontSizeRvxqle: 14.sp,
              b16ColorDtkzma: Color(0xff858C92),
              b16FontWeightHncysp: FontWeight.w500,
            ),
          ],
        ),
      ),
      SizedBox(width: 12.w),
      B16TapGuardViewMfwqke(
        b16OnPressedJkcxwu: () {
          b16controllerVqnxre.clickDeleteFile();
        },
        b16ChildHnqvsa: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            B16AssetImageViewPzrxcu(
              "b16_select_fjeifjie",
              b16WidthDtvqpl: 20.w,
              b16HeightRnxkse: 20.w,
            ),
            SizedBox(width: 4.w),
            B16LocalizedTextViewCxmpra(
              "Select".tr,
              b16FontSizeRvxqle: 14.sp,
              b16ColorDtkzma: Color(0xff858C92),
              b16FontWeightHncysp: FontWeight.w500,
            ),
          ],
        ),
      ),
    ],
  );

  _contentWidget(B16FilesListChildControllerHqmwze b16controllerVqnxre) =>
      Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.w),
            border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
          ),
          child: switch (b16controllerVqnxre.b16ListStatePqmxza) {
            B16FilesListStateQmvnza.noPermission => _noPermissionWidget(
              b16controllerVqnxre,
            ),
            B16FilesListStateQmvnza.loading => _loadingWidget(),
            B16FilesListStateQmvnza.loaded => _listViewWidget(
              b16controllerVqnxre,
            ),
          },
        ),
      );

  _listViewWidget(B16FilesListChildControllerHqmwze b16controllerVqnxre) =>
      B16MediaPaddingViewVnyqsl(
        b16ChildQzpmwa: B16RefreshViewDkgwta(
          b16EnableLoadMoreNpkxvu: false,
          b16ControllerXqmvta: b16controllerVqnxre.refreshController,
          b16ScrollControllerGzrqma: _b16ScrollControllerPqnvze,
          b16OnRefreshCqpydu: b16controllerVqnxre.b16RefreshFilesVqmwza,
          b16ChildJkznwe: _b16FileListWidgetKqnvze(b16controllerVqnxre),
        ),
      );

  Widget _b16FileListWidgetKqnvze(
    B16FilesListChildControllerHqmwze b16ControllerPqnvze,
  ) {
    final bool b16CanShowNativeAdQxmvza =
        B16UserCheckHepQxnvza.instance.b16IsEligibleUserVqntza &&
        b16ControllerPqnvze.b16VisibleFilesVqmwza.length >=
            _b16NativeAdIntervalKqmvze;
    final int b16NativeAdCountVqmwza = b16CanShowNativeAdQxmvza
        ? b16ControllerPqnvze.b16VisibleFilesVqmwza.length ~/
              _b16NativeAdIntervalKqmvze
        : 0;
    final int b16ItemCountHqmwza =
        b16ControllerPqnvze.b16VisibleFilesVqmwza.length +
        b16NativeAdCountVqmwza;
    _b16LatestListItemCountKqmwze = b16ItemCountHqmwza;
    _b16NativeAdKeyMapQxmvza.removeWhere(
      (b16IndexKqnvze, _) => b16IndexKqnvze >= b16ItemCountHqmwza,
    );
    _b16VisibleNativeAdIndexesVqmwza.removeWhere(
      (b16IndexKqnvze) => b16IndexKqnvze >= b16ItemCountHqmwza,
    );
    _b16SyncNativeAdStatePqnvze(b16CanShowNativeAdQxmvza, b16ItemCountHqmwza);
    return ListView.builder(
      itemCount: b16ItemCountHqmwza,
      itemBuilder: (context, index) {
        if (b16CanShowNativeAdQxmvza && _b16IsNativeAdIndexVqntza(index)) {
          return _b16NativeAdSlotWidgetHqmwza(
            b16ListIndexKqnvze: index,
            b16ShowNativeAdPqnvze: _b16ActiveNativeAdIndexPqmxza == index,
          );
        }
        final int b16FileIndexQxmvza = b16CanShowNativeAdQxmvza
            ? _b16FileIndexFromListIndexVqmwza(index)
            : index;
        final b16FileQxmvza =
            b16ControllerPqnvze.b16VisibleFilesVqmwza[b16FileIndexQxmvza];
        return Column(
          children: [
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: () {
                b16ControllerPqnvze.clickFileItem(b16FileQxmvza);
              },
              b16ChildHnqvsa: Container(
                width: double.infinity,
                height: 72.h,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Row(
                  children: [
                    B16AssetImageViewPzrxcu(
                      _b16FileIconKqnvze(b16FileQxmvza),
                      b16WidthDtvqpl: 32.w,
                      b16HeightRnxkse: 32.w,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          B16LocalizedTextViewCxmpra(
                            b16FileQxmvza.name ?? '',
                            b16FontSizeRvxqle: 14.sp,
                            b16ColorDtkzma: Colors.black,
                            b16FontWeightHncysp: FontWeight.bold,
                            b16OverflowFzrxke: TextOverflow.ellipsis,
                          ),
                          B16LocalizedTextViewCxmpra(
                            _b16FileDetailPqmwza(b16FileQxmvza),
                            b16FontSizeRvxqle: 12.sp,
                            b16ColorDtkzma: Color(0xff858C92),
                            b16FontWeightHncysp: FontWeight.w500,
                            b16OverflowFzrxke: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5.h,
              color: const Color(0xffEBEBEB),
            ),
          ],
        );
      },
    );
  }

  bool _b16IsNativeAdIndexVqntza(int b16IndexKqnvze) =>
      (b16IndexKqnvze + 1) % (_b16NativeAdIntervalKqmvze + 1) == 0;

  int _b16FileIndexFromListIndexVqmwza(int b16IndexPqnvze) =>
      b16IndexPqnvze - (b16IndexPqnvze + 1) ~/ (_b16NativeAdIntervalKqmvze + 1);

  bool _b16CanShowNativeAdHqmwza() =>
      B16UserCheckHepQxnvza.instance.b16IsEligibleUserVqntza &&
      b16ControllerLeaseFshqya
              .b16ControllerNqxrfe
              .b16VisibleFilesVqmwza
              .length >=
          _b16NativeAdIntervalKqmvze;

  void _b16SyncNativeAdStatePqnvze(bool b16CanShowQxmvza, int b16CountVqmwza) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _b16IsRefreshingNativeAdVqmwza) return;
      if (!b16CanShowQxmvza || b16CountVqmwza <= 0) {
        _b16ClearActiveNativeAdKqnvze();
      } else if (_b16ActiveNativeAdIndexPqmxza == null ||
          _b16ActiveNativeAdIndexPqmxza! >= b16CountVqmwza) {
        _b16ActivateNativeAdNearViewportQxmvza(b16CountVqmwza);
      } else {
        _b16StartNativeAdRefreshTimerVqntza();
      }
    });
  }

  void _b16HandleScrollKqmwze() {
    if (!mounted || !_b16CanShowNativeAdHqmwza()) return;
    _b16IsListScrollingPqnvze = true;
    _b16ScrollIdleTimerKqnvze?.cancel();
    _b16StopNativeAdRefreshTimerQxnvza();
    _b16ScrollIdleTimerKqnvze = Timer(_b16ScrollIdleDurationHqmwza, () {
      if (!mounted || !_b16CanShowNativeAdHqmwza()) return;
      _b16IsListScrollingPqnvze = false;
      _b16ActivateNativeAdNearViewportQxmvza(_b16LatestListItemCountKqmwze);
    });
  }

  void _b16ActivateNativeAdNearViewportQxmvza(int b16ItemCountPqnvze) {
    final int? b16IndexVqmwza = _b16FindVisibleNativeAdIndexKqnvze(
      b16ItemCountPqnvze,
    );
    if (b16IndexVqmwza == null) {
      _b16StartNativeAdRefreshTimerVqntza();
      return;
    }
    if (_b16ActiveNativeAdIndexPqmxza != b16IndexVqmwza) {
      setState(() => _b16ActiveNativeAdIndexPqmxza = b16IndexVqmwza);
    }
    _b16StartNativeAdRefreshTimerVqntza();
  }

  int? _b16FindVisibleNativeAdIndexKqnvze(int b16ItemCountPqnvze) {
    final b16VisibleIndexesQxmvza =
        _b16VisibleNativeAdIndexesVqmwza
            .where((b16IndexVqntza) => b16IndexVqntza < b16ItemCountPqnvze)
            .toList()
          ..sort();
    if (b16VisibleIndexesQxmvza.isNotEmpty) {
      return b16VisibleIndexesQxmvza.first;
    }
    final double b16ScreenCenterHqmwza = MediaQuery.of(context).size.height / 2;
    int? b16BestIndexPqnvze;
    double? b16BestDistanceVqmwza;
    for (final b16EntryKqnvze in _b16NativeAdKeyMapQxmvza.entries) {
      final b16RenderObjectQxmvza = b16EntryKqnvze.value.currentContext
          ?.findRenderObject();
      if (b16EntryKqnvze.key >= b16ItemCountPqnvze ||
          b16RenderObjectQxmvza is! RenderBox ||
          !b16RenderObjectQxmvza.attached) {
        continue;
      }
      final double b16TopVqntza = b16RenderObjectQxmvza
          .localToGlobal(Offset.zero)
          .dy;
      final double b16BottomHqmwza =
          b16TopVqntza + b16RenderObjectQxmvza.size.height;
      if (b16BottomHqmwza < 0 ||
          b16TopVqntza > MediaQuery.of(context).size.height) {
        continue;
      }
      final double b16DistancePqmxza =
          ((b16TopVqntza + b16BottomHqmwza) / 2 - b16ScreenCenterHqmwza).abs();
      if (b16BestDistanceVqmwza == null ||
          b16DistancePqmxza < b16BestDistanceVqmwza) {
        b16BestIndexPqnvze = b16EntryKqnvze.key;
        b16BestDistanceVqmwza = b16DistancePqmxza;
      }
    }
    return b16BestIndexPqnvze;
  }

  void _b16ClearActiveNativeAdKqnvze() {
    _b16StopNativeAdRefreshTimerQxnvza();
    _b16LastChanceNativeAdIndexVqntza = null;
    if (_b16ActiveNativeAdIndexPqmxza != null) {
      setState(() => _b16ActiveNativeAdIndexPqmxza = null);
    }
  }

  void _b16StartNativeAdRefreshTimerVqntza() {
    _b16NativeAdRefreshTimerHqmwza ??= Timer.periodic(
      _b16NativeAdRefreshDurationVqntza,
      (_) => unawaited(_b16RefreshActiveNativeAdPqnvze()),
    );
  }

  void _b16StopNativeAdRefreshTimerQxnvza() {
    _b16NativeAdRefreshTimerHqmwza?.cancel();
    _b16NativeAdRefreshTimerHqmwza = null;
  }

  Future<void> _b16RefreshActiveNativeAdPqnvze() async {
    if (!mounted ||
        _b16IsRefreshingNativeAdVqmwza ||
        _b16IsListScrollingPqnvze ||
        !_b16CanShowNativeAdHqmwza() ||
        _b16ActiveNativeAdIndexPqmxza == null) {
      return;
    }
    final int b16RefreshIndexKqnvze = _b16ActiveNativeAdIndexPqmxza!;
    _b16IsRefreshingNativeAdVqmwza = true;
    _b16UploadNativeAdChanceQxmvza();
    try {
      setState(() => _b16ActiveNativeAdIndexPqmxza = null);
      await WidgetsBinding.instance.endOfFrame;
      await Future<void>.delayed(Duration.zero);
      if (!mounted ||
          _b16IsListScrollingPqnvze ||
          !_b16CanShowNativeAdHqmwza()) {
        return;
      }
      final b16AdHepVqmwza = B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr;
      if (!await b16AdHepVqmwza.b16HasFilesListNativeAdPqmvzr()) {
        await b16AdHepVqmwza.b16RequestFilesListNativeAdPqmvzr();
      }
      if (!mounted ||
          _b16IsListScrollingPqnvze ||
          !_b16CanShowNativeAdHqmwza()) {
        return;
      }
      setState(() {
        _b16NativeAdRefreshKeyQxnvza++;
        _b16ActiveNativeAdIndexPqmxza = b16RefreshIndexKqnvze;
      });
    } finally {
      _b16IsRefreshingNativeAdVqmwza = false;
      if (mounted &&
          !_b16IsListScrollingPqnvze &&
          _b16CanShowNativeAdHqmwza() &&
          _b16ActiveNativeAdIndexPqmxza == null) {
        _b16ActivateNativeAdNearViewportQxmvza(_b16LatestListItemCountKqmwze);
      }
    }
  }

  Widget _b16NativeAdSlotWidgetHqmwza({
    required int b16ListIndexKqnvze,
    required bool b16ShowNativeAdPqnvze,
  }) {
    if (b16ShowNativeAdPqnvze &&
        _b16LastChanceNativeAdIndexVqntza != b16ListIndexKqnvze) {
      _b16LastChanceNativeAdIndexVqntza = b16ListIndexKqnvze;
      _b16UploadNativeAdChanceQxmvza();
    }
    return VisibilityDetector(
      key: ValueKey('b16_file_inline_ad_$b16ListIndexKqnvze'),
      onVisibilityChanged: (b16InfoVqmwza) =>
          _b16UpdateNativeAdVisibilityPqnvze(
            b16ListIndexKqnvze,
            b16InfoVqmwza.visibleFraction > 0,
          ),
      child: SizedBox(
        key: _b16NativeAdKeyMapQxmvza.putIfAbsent(
          b16ListIndexKqnvze,
          GlobalKey.new,
        ),
        width: double.infinity,
        height: 68.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          child: b16ShowNativeAdPqnvze
              ? KeyedSubtree(
                  key: ValueKey(
                    'b16_file_native_${b16ListIndexKqnvze}_$_b16NativeAdRefreshKeyQxnvza',
                  ),
                  child: const _B16FilesNativeAdContentKqnvze(),
                )
              : const B16AssetImageViewPzrxcu(
                  'b16_native_ad_cover_kqnvze',
                  b16WidthDtvqpl: double.infinity,
                ),
        ),
      ),
    );
  }

  void _b16UpdateNativeAdVisibilityPqnvze(
    int b16IndexKqnvze,
    bool b16VisibleQxmvza,
  ) {
    if (!mounted) return;
    final bool b16ChangedVqmwza = b16VisibleQxmvza
        ? _b16VisibleNativeAdIndexesVqmwza.add(b16IndexKqnvze)
        : _b16VisibleNativeAdIndexesVqmwza.remove(b16IndexKqnvze);
    if (!b16ChangedVqmwza) return;
    if (!b16VisibleQxmvza && _b16ActiveNativeAdIndexPqmxza == b16IndexKqnvze) {
      _b16ActiveNativeAdIndexPqmxza = null;
    }
    if (b16VisibleQxmvza &&
        !_b16IsListScrollingPqnvze &&
        !_b16IsRefreshingNativeAdVqmwza) {
      _b16ActivateNativeAdNearViewportQxmvza(_b16LatestListItemCountKqmwze);
    }
  }

  void _b16UploadNativeAdChanceQxmvza() {
    B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16UploadAdChanceKqnvxe(
      b16AdScenePqmvzr: B16AdSceneJdwo.pr_ban1,
      b16AdPosIdKqmvzr: B16PosidJkwkosw.pr_main_banner1,
    );
  }

  String _b16FileIconKqnvze(FileToolsFileInfo b16FileQxmvza) =>
      switch (b16FileQxmvza.type) {
        FileToolsDocumentType.pdf => 'b16_pdf_logo',
        FileToolsDocumentType.excel => 'b16_excel_logo',
        _ => 'b16_word_logo',
      };

  String _b16FileDetailPqmwza(FileToolsFileInfo b16FileVqntze) {
    final b16DateHqmwza = DateTime.fromMillisecondsSinceEpoch(
      b16FileVqntze.updateTime ?? 0,
    );
    final b16DateTextKqnvze =
        '${b16DateHqmwza.year}-${b16DateHqmwza.month.toString().padLeft(2, '0')}-${b16DateHqmwza.day.toString().padLeft(2, '0')}';
    final b16SizePqmxza = (b16FileVqntze.size ?? 0) / 1024 / 1024;
    return '$b16DateTextKqnvze | ${b16SizePqmxza.toStringAsFixed(1)}M';
  }

  _loadingWidget() => Center(child: CircularProgressIndicator());

  _noPermissionWidget(B16FilesListChildControllerHqmwze b16controllerVqnxre) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          B16AssetImageViewPzrxcu(
            "b16_lock_fjeifje",
            b16WidthDtvqpl: 80.w,
            b16HeightRnxkse: 80.w,
          ),
          SizedBox(height: 16.h),
          B16LocalizedTextViewCxmpra(
            "No permissions granted".tr,
            b16FontSizeRvxqle: 20.sp,
            b16ColorDtkzma: Colors.black,
            b16FontWeightHncysp: FontWeight.bold,
          ),
          SizedBox(height: 6.h),
          B16LocalizedTextViewCxmpra(
            "Permission is required to access all files".tr,
            b16FontSizeRvxqle: 14.sp,
            b16ColorDtkzma: Color(0xff4B5156),
          ),
          SizedBox(height: 40.h),
          B16TapGuardViewMfwqke(
            b16OnPressedJkcxwu: () {
              b16controllerVqnxre.clickRequestPermission();
            },
            b16ChildHnqvsa: Container(
              width: double.infinity,
              height: 48.h,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 24.w, right: 24.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.w),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
                ),
              ),
              child: B16LocalizedTextViewCxmpra(
                "Go to settings".tr,
                b16FontSizeRvxqle: 16.sp,
                b16ColorDtkzma: Colors.white,
                b16FontWeightHncysp: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
}

class _B16FilesNativeAdContentKqnvze extends StatefulWidget {
  const _B16FilesNativeAdContentKqnvze();

  @override
  State<_B16FilesNativeAdContentKqnvze> createState() =>
      _B16FilesNativeAdContentStateVqmwza();
}

class _B16FilesNativeAdContentStateVqmwza
    extends State<_B16FilesNativeAdContentKqnvze> {
  Widget? _b16NativeAdWidgetPqnvze;

  @override
  void initState() {
    super.initState();
    unawaited(_b16LoadNativeAdWidgetKqnvze());
  }

  Future<void> _b16LoadNativeAdWidgetKqnvze() async {
    final Widget? b16AdWidgetQxmvza = await B16AdHepJiwdjow
        .b16AdUtilsInstanceKqmvzr
        .b16TakeFilesListNativeAdWidgetPqmvzr(
          b16LoadIfNeededPqmvzr: true,
          b16ReloadAfterTakePqmvzr: true,
          b16DisposeDelayPqmvzr: Duration.zero,
        );
    if (!mounted || b16AdWidgetQxmvza == null) return;
    setState(() => _b16NativeAdWidgetPqnvze = b16AdWidgetQxmvza);
  }

  @override
  Widget build(BuildContext context) =>
      _b16NativeAdWidgetPqnvze ??
      const B16AssetImageViewPzrxcu(
        'b16_native_ad_cover_kqnvze',
        b16WidthDtvqpl: double.infinity,
      );
}
