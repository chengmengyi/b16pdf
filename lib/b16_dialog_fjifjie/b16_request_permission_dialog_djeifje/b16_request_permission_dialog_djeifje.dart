import 'package:b16pdf/b16_dialog_fjifjie/b16_request_permission_dialog_djeifje/b16_request_permission_dialog_djeifje_controller.dart';
import 'package:b16pdf/b16_root_fjield/b16_center_dialog_kqnvze.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:permission_handler/permission_handler.dart';

class B16RequestPermissionDialogDjeifje
    extends B16CenterDialogKqnvze<B16RequestPermissionDialogDjeifjeController> {
  final Permission permission;
  B16RequestPermissionDialogDjeifje({required this.permission});

  @override
  B16RequestPermissionDialogDjeifjeController b16CreateControllerTqnxre() =>
      B16RequestPermissionDialogDjeifjeController(permission: permission);

  @override
  Widget b16BuildDialogVqmwza(
    BuildContext b16ContextHqnvxe,
    B16RequestPermissionDialogDjeifjeController b16ControllerKqmwza,
  ) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 28.w, right: 28.w),
      padding: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        top: 16.h,
        bottom: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          B16LocalizedTextViewCxmpra(
            "Permission Required".tr,
            b16FontSizeRvxqle: 20.sp,
            b16ColorDtkzma: Colors.black,
            b16FontWeightHncysp: FontWeight.bold,
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Color(0xffF3F5F7),
              borderRadius: BorderRadius.circular(8.w),
              border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
            ),
            child: B16LocalizedTextViewCxmpra(
              b16ControllerKqmwza.permissionMessage(),
              b16FontSizeRvxqle: 14.sp,
              b16ColorDtkzma: Color(0xff4B4D56),
            ),
          ),
          SizedBox(height: 20.h),
          B16TapGuardViewMfwqke(
            b16OnPressedJkcxwu: b16ControllerKqmwza.clickAllow,
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
                "Allow".tr,
                b16FontSizeRvxqle: 16.sp,
                b16ColorDtkzma: Colors.white,
                b16FontWeightHncysp: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          B16TapGuardViewMfwqke(
            b16OnPressedJkcxwu: () {
              b16ControllerKqmwza.clickLater();
            },
            b16ChildHnqvsa: B16LocalizedTextViewCxmpra(
              'Later'.tr,
              b16FontSizeRvxqle: 14.sp,
              b16ColorDtkzma: const Color(0xff858C92),
              b16Decorationfefjie: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
