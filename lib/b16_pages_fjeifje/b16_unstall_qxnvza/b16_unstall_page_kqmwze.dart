import 'dart:async';

import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_switch_utils_vqntza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_unstall_qxnvza/b16_unstall_controller_vqntza.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_media_padding_view_vnyqsl.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16UnstallPageKqmwze
    extends B16RootPageQazmtr<B16UnstallControllerVqntza> {
  const B16UnstallPageKqmwze({super.key});

  @override
  B16UnstallControllerVqntza b16CreateControllerAhdwks() {
    return B16UnstallControllerVqntza();
  }

  @override
  Color get b16NavigationBarColorLxqvbi => Colors.white;

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextVqmwza,
    B16UnstallControllerVqntza b16ControllerKqmxve,
  ) {
    return Column(
      children: [
        _titleWidget(b16ControllerKqmxve),
        SizedBox(height: 8.h),
        _contentWidget(b16ControllerKqmxve),
        _bottomWidget(b16ControllerKqmxve),
        _b16NativeAdWidgetPqnvze(),
      ],
    );
  }

  Widget _b16NativeAdWidgetPqnvze() {
    if (!B16UserCheckHepQxnvza.instance.b16IsEligibleUserVqntza) {
      return const SizedBox.shrink();
    }
    if (!B16AdSwitchUtilsVqntza.instance.b16CanShowAdPqnvze(
      B16PosidJkwkosw.unload_nat1,
    )) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 14.h),
      child: const _B16UnstallNativeAdVqmwza(),
    );
  }

  Widget _contentWidget(B16UnstallControllerVqntza b16controllerKqmxve) =>
      Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GetBuilder<B16UnstallControllerVqntza>(
                  id: B16UnstallControllerVqntza.b16ReasonBuilderIdQxnvza,
                  builder: (b16BuilderQxmvza) => B16MediaPaddingViewVnyqsl(
                    b16ChildQzpmwa: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: b16BuilderQxmvza.reasonList.length,
                      itemBuilder: (context, index) {
                        final bool b16SelectedVqntza =
                            b16BuilderQxmvza.b16SelectedReasonIndexKqmwze ==
                            index;
                        return B16TapGuardViewMfwqke(
                          b16OnPressedJkcxwu: () {
                            b16BuilderQxmvza.b16ClickReasonVqntza(index);
                          },
                          b16ChildHnqvsa: Container(
                            width: double.infinity,
                            height: 48.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 16.w, right: 16.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: B16LocalizedTextViewCxmpra(
                                    b16BuilderQxmvza.reasonList[index].tr,
                                    b16FontSizeRvxqle: 14.sp,
                                    b16ColorDtkzma: Colors.black,
                                    b16FontWeightHncysp: FontWeight.bold,
                                    b16OverflowFzrxke: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                B16AssetImageViewPzrxcu(
                                  b16SelectedVqntza
                                      ? "b16_sel_icon"
                                      : "b16_uns_icon",
                                  b16WidthDtvqpl: 24.w,
                                  b16HeightRnxkse: 24.w,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(
                            width: double.infinity,
                            height: 0.5.h,
                            color: Color(0xffEBEBEB),
                          ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 120.h,
                  padding: EdgeInsets.all(16.w),
                  margin: EdgeInsets.only(left: 16.w, right: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    enabled: true,
                    controller: b16controllerKqmxve.textEditingController,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF1A1D22),
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      isCollapsed: true,
                      hintText:
                          'Please enter the reason for uninstalling All PDF'.tr,
                      hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFFB2B2B2),
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _bottomWidget(B16UnstallControllerVqntza b16controllerKqmxve) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          B16TapGuardViewMfwqke(
            b16OnPressedJkcxwu: b16controllerKqmxve.b16ClickNoUninstallHqmwza,
            b16ChildHnqvsa: Container(
              width: double.infinity,
              height: 50.h,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 34.w, right: 34.w),
              decoration: BoxDecoration(
                color: Color(0xffDF2019),
                borderRadius: BorderRadius.circular(22.w),
              ),
              child: B16LocalizedTextViewCxmpra(
                "Don't uninstall for now".tr,
                b16FontSizeRvxqle: 16.sp,
                b16ColorDtkzma: Colors.white,
                b16FontWeightHncysp: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 14.h),
          B16TapGuardViewMfwqke(
            b16OnPressedJkcxwu: () {
              b16controllerKqmxve.clickUninstall();
            },
            b16ChildHnqvsa: B16LocalizedTextViewCxmpra(
              "Uninstall".tr,
              b16FontSizeRvxqle: 16.sp,
              b16ColorDtkzma: Color(0xff8C8E9C),
              b16FontWeightHncysp: FontWeight.bold,
            ),
          ),
        ],
      );

  Widget _titleWidget(B16UnstallControllerVqntza b16ControllerQxmvza) =>
      Container(
        width: double.infinity,
        color: Colors.white,
        child: SafeArea(
          top: true,
          bottom: false,
          child: SizedBox(
            width: double.infinity,
            height: 44.h,
            child: Stack(
              children: [
                B16TapGuardViewMfwqke(
                  b16OnPressedJkcxwu:
                      b16ControllerQxmvza.b16ClickNoUninstallHqmwza,
                  b16ChildHnqvsa: Container(
                    width: 44.w,
                    height: 44.h,
                    alignment: Alignment.center,
                    child: B16AssetImageViewPzrxcu(
                      "b16_close_icon",
                      b16WidthDtvqpl: 24.w,
                      b16HeightRnxkse: 24.w,
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    margin: EdgeInsets.only(left: 44.w, right: 44.w),
                    child: B16LocalizedTextViewCxmpra(
                      "Uninstall reason".tr,
                      b16FontSizeRvxqle: 18.sp,
                      b16ColorDtkzma: Colors.black,
                      b16FontWeightHncysp: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _B16UnstallNativeAdVqmwza extends StatefulWidget {
  const _B16UnstallNativeAdVqmwza();

  @override
  State<_B16UnstallNativeAdVqmwza> createState() =>
      _B16UnstallNativeAdStateKqnvze();
}

class _B16UnstallNativeAdStateKqnvze extends State<_B16UnstallNativeAdVqmwza> {
  static const Duration _b16RetryDurationQxmvza = Duration(milliseconds: 500);

  Timer? _b16RetryTimerPqnvze;
  Widget? _b16AdWidgetVqntza;
  bool _b16CheckingAdHqmwza = false;
  bool _b16CanShowAdVqntza = false;

  @override
  void initState() {
    super.initState();
    unawaited(_b16InitializeNativeAdQxmvza());
  }

  Future<void> _b16InitializeNativeAdQxmvza() async {
    final B16AdHepJiwdjow b16AdHepKqmwze =
        B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr;
    final bool b16CanShowAdPqnvze = B16AdSwitchUtilsVqntza.instance
        .b16CanShowAdPqnvze(B16PosidJkwkosw.unload_nat1);
    if (!mounted || !b16CanShowAdPqnvze) return;
    setState(() => _b16CanShowAdVqntza = true);
    b16AdHepKqmwze.b16UploadAdChanceKqnvxe(
      b16AdScenePqmvzr: B16AdSceneJdwo.pr_ban2,
      b16AdPosIdKqmvzr: B16PosidJkwkosw.unload_nat1,
    );
    unawaited(_b16TryBuildAdWidgetKqmwze());
    _b16RetryTimerPqnvze = Timer.periodic(
      _b16RetryDurationQxmvza,
      (_) => unawaited(_b16TryBuildAdWidgetKqmwze()),
    );
  }

  Future<void> _b16TryBuildAdWidgetKqmwze() async {
    if (_b16AdWidgetVqntza != null || _b16CheckingAdHqmwza) {
      return;
    }
    _b16CheckingAdHqmwza = true;
    try {
      final Widget? b16AdWidgetPqmxza = await B16AdHepJiwdjow
          .b16AdUtilsInstanceKqmvzr
          .b16BuildCachedNativeAdWidgetPqmvzr(
            b16AdScenePqmvzr: B16AdSceneJdwo.pr_ban2,
            b16AdPosIdKqmvzr: B16PosidJkwkosw.unload_nat1,
          );
      if (!mounted || b16AdWidgetPqmxza == null) {
        return;
      }
      _b16RetryTimerPqnvze?.cancel();
      _b16RetryTimerPqnvze = null;
      setState(() => _b16AdWidgetVqntza = b16AdWidgetPqmxza);
    } finally {
      _b16CheckingAdHqmwza = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_b16CanShowAdVqntza) return const SizedBox.shrink();
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child:
          _b16AdWidgetVqntza ??
          const B16AssetImageViewPzrxcu(
            'b16_native_ad_cover_kqnvze',
            b16WidthDtvqpl: double.infinity,
          ),
    );
  }

  @override
  void dispose() {
    _b16RetryTimerPqnvze?.cancel();
    _b16RetryTimerPqnvze = null;
    super.dispose();
  }
}
