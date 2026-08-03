import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_open_overlay_permission_page_kxmqva/b16_open_overlay_permission_controller_hvxpra.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_pulse_view_hqvzna.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_switch_view_feifjie.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16OpenOverlayPermissionPageZqtwne
    extends B16RootPageQazmtr<B16OpenOverlayPermissionControllerHvxpra> {
  const B16OpenOverlayPermissionPageZqtwne({super.key});

  @override
  B16OpenOverlayPermissionControllerHvxpra b16CreateControllerAhdwks() {
    return B16OpenOverlayPermissionControllerHvxpra();
  }

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextHqmxva,
    B16OpenOverlayPermissionControllerHvxpra b16ControllerKqvwze,
  ) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        B16AssetImageViewPzrxcu(
          'b16_overlay_permission_top_bg_fjeifje',
          b16WidthDtvqpl: double.infinity,
          b16HeightRnxkse: 180.h,
        ),
        Column(
          children: [
            SafeArea(
              top: true,
              bottom: false,
              child: B16AssetImageViewPzrxcu(
                'b16_overlay_permission_top_images_fhuefjie',
                b16WidthDtvqpl: double.infinity,
                b16HeightRnxkse: 272.h,
              ),
            ),
            SizedBox(height: 24.h),
            B16LocalizedTextViewCxmpra(
              'Unlock Full PDF Potential'.tr,
              b16FontSizeRvxqle: 24.sp,
              b16ColorDtkzma: Colors.black,
              b16FontWeightHncysp: FontWeight.bold,
            ),
            SizedBox(height: 24.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                B16LocalizedTextViewCxmpra(
                  'Step 1: find PDF flow in the list below.'.tr,
                  b16FontSizeRvxqle: 14.sp,
                  b16ColorDtkzma: const Color(0xff4b5156),
                  b16FontWeightHncysp: FontWeight.w500,
                ),
                B16LocalizedTextViewCxmpra(
                  'Step 2: toggle the switch to ON.'.tr,
                  b16FontSizeRvxqle: 14.sp,
                  b16ColorDtkzma: const Color(0xff4b5156),
                  b16FontWeightHncysp: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: 56.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              margin: EdgeInsets.symmetric(horizontal: 40.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(
                  width: 0.5.w,
                  color: const Color(0xff000000).withValues(alpha: 0.1),
                ),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  B16AssetImageViewPzrxcu(
                    'b16_logo_fhuefhie',
                    b16WidthDtvqpl: 48.w,
                    b16HeightRnxkse: 48.w,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: B16LocalizedTextViewCxmpra(
                      B16LocalInfoFjeifjioe.appName.tr,
                      b16FontSizeRvxqle: 16.sp,
                      b16ColorDtkzma: Colors.black,
                      b16FontWeightHncysp: FontWeight.bold,
                      b16OverflowFzrxke: TextOverflow.ellipsis,
                    ),
                  ),
                  const B16SwitchViewFeifjie(),
                ],
              ),
            ),
            const Spacer(),
            B16PulseViewHqvzna(
              b16ChildPxnvta: B16TapGuardViewMfwqke(
                b16OnPressedJkcxwu: b16ControllerKqvwze.b16ClickContinueHqmwze,
                b16ChildHnqvsa: Container(
                  width: double.infinity,
                  height: 48.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xff067bf2),
                    borderRadius: BorderRadius.circular(24.w),
                  ),
                  child: B16LocalizedTextViewCxmpra(
                    'Continue'.tr,
                    b16FontSizeRvxqle: 18.sp,
                    b16ColorDtkzma: Colors.white,
                    b16FontWeightHncysp: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: b16ControllerKqvwze.b16ClickLaterVqmxze,
              b16ChildHnqvsa: B16LocalizedTextViewCxmpra(
                'Later'.tr,
                b16FontSizeRvxqle: 16.sp,
                b16ColorDtkzma: const Color(0xff4b5156),
                b16Decorationfefjie: TextDecoration.underline,
                b16FontWeightHncysp: FontWeight.bold,
              ),
            ),
            SizedBox(height: 36.h),
          ],
        ),
      ],
    );
  }
}
