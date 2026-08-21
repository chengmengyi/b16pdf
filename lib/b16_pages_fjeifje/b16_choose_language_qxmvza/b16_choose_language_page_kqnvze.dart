import 'dart:async';

import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_switch_utils_vqntza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_language_hep_fjeifje/b16_language_tools_fieife.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_choose_language_qxmvza/b16_choose_language_controller_hqmwza.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_media_padding_view_vnyqsl.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16ChooseLanguagePageKqnvze
    extends B16RootPageQazmtr<B16ChooseLanguageControllerHqmwza> {
  const B16ChooseLanguagePageKqnvze({super.key});
  @override
  B16ChooseLanguageControllerHqmwza b16CreateControllerAhdwks() =>
      B16ChooseLanguageControllerHqmwza();

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextQxmvza,
    B16ChooseLanguageControllerHqmwza b16ControllerKqnvze,
  ) => GetBuilder<B16ChooseLanguageControllerHqmwza>(
    init: b16ControllerKqnvze,
    global: false,
    builder: (b16ControllerQxmvza) => Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            _nativeAdWidget(),
            SizedBox(height: 16.h),
            _b16TopWidgetHqmwza(),
            SizedBox(height: 40.h),
            _b16ListWidgetKqnvze(b16ControllerQxmvza),
            SizedBox(height: 40.h),
            _b16BottomWidgetVqntza(b16ControllerQxmvza),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    ),
  );

  Widget _b16ListWidgetKqnvze(
    B16ChooseLanguageControllerHqmwza b16ControllerQxmvza,
  ) => Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(width: 0.5.w, color: const Color(0xffE0E3EA)),
      ),
      child: B16MediaPaddingViewVnyqsl(
        b16ChildQzpmwa: ListView.builder(
          controller: b16ControllerQxmvza.b16LanguageScrollControllerQxmvza,
          itemCount: b16ControllerQxmvza.b16LanguageListPqmwza.length,
          itemBuilder: (b16ContextKqnvze, b16IndexVqntza) {
            final B16LanguageItemQxmvza b16ItemPqmwza =
                b16ControllerQxmvza.b16LanguageListPqmwza[b16IndexVqntza];
            final b16SelectedHqmwza = b16ControllerQxmvza.b16IsSelectedPqmxza(
              b16ItemPqmwza,
            );
            return B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: () =>
                  b16ControllerQxmvza.b16ClickLanguageHqmwza(b16ItemPqmwza),
              b16ChildHnqvsa: SizedBox(
                height: 56.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      B16AssetImageViewPzrxcu(
                        b16ItemPqmwza.b16IconHqmwza,
                        b16WidthDtvqpl: 32.w,
                        b16HeightRnxkse: 32.w,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: B16LocalizedTextViewCxmpra(
                          b16ItemPqmwza.b16NameKqnvze,
                          b16FontSizeRvxqle: 14.sp,
                          b16ColorDtkzma: const Color(0xff060E23),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      B16AssetImageViewPzrxcu(
                        b16SelectedHqmwza ? 'b16_sel_icon' : 'b16_uns_icon',
                        b16WidthDtvqpl: 24.w,
                        b16HeightRnxkse: 24.w,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );

  Widget _b16BottomWidgetVqntza(
    B16ChooseLanguageControllerHqmwza b16ControllerQxmvza,
  ) => B16TapGuardViewMfwqke(
    b16OnPressedJkcxwu: b16ControllerQxmvza.clickOk,
    b16ChildHnqvsa: Container(
      width: double.infinity,
      height: 48.h,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.w),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff06B3F2), Color(0xff002DF6)],
        ),
      ),
      child: B16LocalizedTextViewCxmpra(
        'OK'.tr,
        b16FontSizeRvxqle: 18.sp,
        b16ColorDtkzma: Colors.white,
        b16FontWeightHncysp: FontWeight.bold,
      ),
    ),
  );

  Widget _b16TopWidgetHqmwza() => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      B16AssetImageViewPzrxcu(
        'b16_language_top_image_nqmvza',
        b16WidthDtvqpl: 72.w,
        b16HeightRnxkse: 72.w,
      ),
      SizedBox(height: 12.h),
      B16LocalizedTextViewCxmpra(
        'Welcome'.tr,
        b16FontSizeRvxqle: 32.sp,
        b16ColorDtkzma: Colors.black,
        b16FontWeightHncysp: FontWeight.bold,
      ),
      B16LocalizedTextViewCxmpra(
        'Choose your preferred language to get started.'.tr,
        b16FontSizeRvxqle: 16.sp,
        b16ColorDtkzma: const Color(0xff858C92),
        b16FontWeightHncysp: FontWeight.w500,
      ),
    ],
  );

  Widget _nativeAdWidget() => const _B16ChooseLanguageNativeAdVqntza();
}

class _B16ChooseLanguageNativeAdVqntza extends StatefulWidget {
  const _B16ChooseLanguageNativeAdVqntza();

  @override
  State<_B16ChooseLanguageNativeAdVqntza> createState() =>
      _B16ChooseLanguageNativeAdStateHqmwza();
}

class _B16ChooseLanguageNativeAdStateHqmwza
    extends State<_B16ChooseLanguageNativeAdVqntza> {
  static const Duration _b16RetryDurationQxnvza = Duration(milliseconds: 500);

  Timer? _b16RetryTimerKqmwze;
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
        .b16CanShowAdPqnvze(B16PosidJkwkosw.pr_new_lan_nat);
    if (!mounted || !b16CanShowAdPqnvze) return;
    setState(() => _b16CanShowAdVqntza = true);
    b16AdHepKqmwze.b16UploadAdChanceKqnvxe(
      b16AdScenePqmvzr: B16AdSceneJdwo.pr_ban1,
      b16AdPosIdKqmvzr: B16PosidJkwkosw.pr_new_lan_nat,
    );
    unawaited(_b16TryTakeAdWidgetPqnvze());
    _b16RetryTimerKqmwze = Timer.periodic(
      _b16RetryDurationQxnvza,
      (_) => unawaited(_b16TryTakeAdWidgetPqnvze()),
    );
  }

  Future<void> _b16TryTakeAdWidgetPqnvze() async {
    if (_b16AdWidgetVqntza != null || _b16CheckingAdHqmwza) {
      return;
    }
    _b16CheckingAdHqmwza = true;
    try {
      final Widget? b16AdWidgetKqnvxe = await B16AdHepJiwdjow
          .b16AdUtilsInstanceKqmvzr
          .b16BuildCachedNativeAdWidgetPqmvzr(
            b16AdScenePqmvzr: B16AdSceneJdwo.pr_ban1,
            b16AdPosIdKqmvzr: B16PosidJkwkosw.pr_new_lan_nat,
          );
      if (!mounted || b16AdWidgetKqnvxe == null) {
        return;
      }
      _b16RetryTimerKqmwze?.cancel();
      _b16RetryTimerKqmwze = null;
      setState(() {
        _b16AdWidgetVqntza = b16AdWidgetKqnvxe;
      });
      unawaited(
        B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr
            .b16RequestFilesListNativeAdPqmvzr(),
      );
    } finally {
      _b16CheckingAdHqmwza = false;
    }
  }

  @override
  Widget build(BuildContext b16ContextQxnvza) {
    if (!_b16CanShowAdVqntza) return const SizedBox.shrink();
    return SizedBox(
      width: double.infinity,
      height: 58.h,
      child: _b16AdWidgetVqntza ?? const SizedBox.shrink(),
    );
  }

  @override
  void dispose() {
    _b16RetryTimerKqmwze?.cancel();
    _b16RetryTimerKqmwze = null;
    super.dispose();
  }
}
