import 'package:b16pdf/b16_pages_fjeifje/b16_process_waiting_hqmwza/b16_process_waiting_controller_pqnvze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_lottie_widget_ijowok.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16ProcessWaitingPageRqmxze
    extends B16RootPageQazmtr<B16ProcessWaitingControllerPqnvze> {
  const B16ProcessWaitingPageRqmxze({super.key});

  @override
  B16ProcessWaitingControllerPqnvze b16CreateControllerAhdwks() {
    return B16ProcessWaitingControllerPqnvze();
  }

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextVqmwza,
    B16ProcessWaitingControllerPqnvze b16ControllerKqmxve,
  ) {
    return GetBuilder<B16ProcessWaitingControllerPqnvze>(
      builder: (B16ProcessWaitingControllerPqnvze b16ControllerVqntza) =>
          Column(
            children: [
              _b16TitleHqmwza(b16ControllerVqntza),
              SizedBox(height: 100.h),
              B16LottieWidgetIjowok(
                name: "procss",
                width: 140.w,
                height: 140.w,
                repeat: true,
              ),
              SizedBox(height: 50.h),
              B16LocalizedTextViewCxmpra(
                'PDF Merging...'.tr,
                b16FontSizeRvxqle: 24.sp,
                b16ColorDtkzma: Colors.black,
                b16FontWeightHncysp: FontWeight.bold,
              ),
              SizedBox(height: 12.h),
              B16LocalizedTextViewCxmpra(
                'Please do not close the app.'.tr,
                b16FontSizeRvxqle: 14.sp,
                b16ColorDtkzma: Color(0xff4B5156),
                b16FontWeightHncysp: FontWeight.w500,
              ),
              B16LocalizedTextViewCxmpra(
                'Processed {current}/{total} images'.tr
                    .replaceAll(
                      '{current}',
                      '${b16ControllerVqntza.b16ProcessedCountKqmwze}',
                    )
                    .replaceAll(
                      '{total}',
                      '${b16ControllerVqntza.b16ImagePathsQxnvza.length}',
                    ),
                b16FontSizeRvxqle: 14.sp,
                b16ColorDtkzma: Color(0xff4B5156),
                b16FontWeightHncysp: FontWeight.w500,
              ),
              SizedBox(height: 50.h),
              Container(
                width: 236.w,
                height: 16.h,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: BoxDecoration(
                  color: const Color(0xffebebeb),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Container(
                  width: (232.w) * b16ControllerVqntza.b16ProgressVqntza,
                  height: 12.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    gradient: const LinearGradient(
                      colors: [Color(0xffff8e71), Color(0xffa77ff1)],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              B16LocalizedTextViewCxmpra(
                "${b16ControllerVqntza.b16ProgressPercentPqnvze}%",
                b16FontSizeRvxqle: 14.sp,
                b16ColorDtkzma: Color(0xffF4411F),
                b16FontWeightHncysp: FontWeight.w500,
              ),
            ],
          ),
    );
  }

  Widget _b16TitleHqmwza(
    B16ProcessWaitingControllerPqnvze b16controllerKqmxve,
  ) => Container(
    width: double.infinity,
    color: Colors.white,
    child: SafeArea(
      top: true,
      bottom: false,
      child: SizedBox(
        height: 44.h,
        child: Stack(
          children: [
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: b16controllerKqmxve.clickBack,
              b16ChildHnqvsa: SizedBox(
                width: 44.w,
                height: 44.h,
                child: Center(
                  child: B16AssetImageViewPzrxcu(
                    'b16_back_icon',
                    b16WidthDtvqpl: 24.w,
                    b16HeightRnxkse: 24.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
