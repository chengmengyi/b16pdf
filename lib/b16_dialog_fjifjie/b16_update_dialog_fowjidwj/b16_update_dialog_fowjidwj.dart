import 'package:b16pdf/b16_dialog_fjifjie/b16_update_dialog_fowjidwj/b16_update_dialog_fowjidwj_controller.dart';
import 'package:b16pdf/b16_root_fjield/b16_center_dialog_kqnvze.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16UpdateDialogFowjidwj
    extends B16CenterDialogKqnvze<B16UpdateDialogFowjidwjController> {
  const B16UpdateDialogFowjidwj({super.key});

  @override
  B16UpdateDialogFowjidwjController b16CreateControllerTqnxre() =>
      B16UpdateDialogFowjidwjController();

  @override
  Widget b16BuildDialogVqmwza(
    BuildContext b16ContextHqnvxe,
    B16UpdateDialogFowjidwjController b16ControllerKqmwza,
  ) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 28.w, right: 28.w),
      child: Stack(
        children: [
          B16AssetImageViewPzrxcu(
            "b16_update_bg_fjieie",
            b16WidthDtvqpl: double.infinity,
            b16HeightRnxkse: 120.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.w),
            margin: EdgeInsets.only(top: 100.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.w),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                B16LocalizedTextViewCxmpra(
                  "New version coming soon!".tr,
                  b16FontSizeRvxqle: 20.sp,
                  b16ColorDtkzma: Colors.black,
                  b16FontWeightHncysp: FontWeight.bold,
                ),
                SizedBox(height: 12.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Color(0xffF3F5F7),
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
                  ),
                  child: B16LocalizedTextViewCxmpra(
                    "Your feedback has been received! This information is vital to us. We are continuously optimizing the product experience, and a new version will be launched soon. Please stay with us!"
                        .tr,
                    b16FontSizeRvxqle: 14.sp,
                    b16ColorDtkzma: Color(0xff4B5156),
                  ),
                ),
                SizedBox(height: 12.h),
                Container(
                  width: double.infinity,
                  height: 48.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.w),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
                    ),
                  ),
                  child: B16LocalizedTextViewCxmpra(
                    "Continue using for free".tr,
                    b16FontSizeRvxqle: 16.sp,
                    b16ColorDtkzma: Colors.white,
                    b16FontWeightHncysp: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                B16TapGuardViewMfwqke(
                  b16ChildHnqvsa: B16LocalizedTextViewCxmpra(
                    "Leave anyway".tr,
                    b16FontSizeRvxqle: 14.sp,
                    b16ColorDtkzma: Color(0xff858C92),
                    b16FontWeightHncysp: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
