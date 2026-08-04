import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_open_notification_page_rqmvza/b16_open_notification_controller_hqvwze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_pulse_view_hqvzna.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_switch_view_feifjie.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class B16OpenNotificationPageKqmxve
    extends B16RootPageQazmtr<B16OpenNotificationControllerHqvwze> {
  const B16OpenNotificationPageKqmxve({super.key});

  @override
  B16OpenNotificationControllerHqvwze b16CreateControllerAhdwks() {
    return B16OpenNotificationControllerHqvwze();
  }

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextVqmwza,
    B16OpenNotificationControllerHqvwze b16ControllerKqmxve,
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
            SizedBox(height: 100.h,),
            B16AssetImageViewPzrxcu("b16_notofication_top_images_fiefjoe",b16WidthDtvqpl: 145.w,b16HeightRnxkse: 150.h,),
            SizedBox(height: 60.h,),
            B16LocalizedTextViewCxmpra("This app has an update",b16FontSizeRvxqle: 24.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
            SizedBox(height: 10.h,),
            B16LocalizedTextViewCxmpra("Please upgrade to enjoy the latest functions.",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Color(0xff4B5156),b16FontWeightHncysp: FontWeight.w500,),
            SizedBox(height: 40.h,),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        B16LocalizedTextViewCxmpra(
                          B16LocalInfoFjeifjioe.appName.tr,
                          b16FontSizeRvxqle: 16.sp,
                          b16ColorDtkzma: Colors.black,
                          b16FontWeightHncysp: FontWeight.bold,
                          b16OverflowFzrxke: TextOverflow.ellipsis,
                        ),
                        B16LocalizedTextViewCxmpra("All notifications",b16FontSizeRvxqle: 12.sp,b16ColorDtkzma: Color(0xff858C92),)
                      ],
                    ),
                  ),
                  const B16SwitchViewFeifjie(),
                ],
              ),
            ),
            Spacer(),
            B16PulseViewHqvzna(
              b16ChildPxnvta: B16TapGuardViewMfwqke(
                b16OnPressedJkcxwu: (){

                },
                b16ChildHnqvsa: Container(
                  width: double.infinity,
                  height: 48.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.w),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff06B3F2),Color(0xff002DF6)]
                    ),
                  ),
                  child: B16LocalizedTextViewCxmpra(
                    'Update now',
                    b16FontSizeRvxqle: 18.sp,
                    b16ColorDtkzma: Colors.white,
                    b16FontWeightHncysp: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: b16ControllerKqmxve.clickLater,
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
