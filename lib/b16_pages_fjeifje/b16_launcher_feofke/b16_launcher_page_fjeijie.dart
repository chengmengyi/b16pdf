import 'package:b16pdf/b16_pages_fjeifje/b16_launcher_feofke/b16_launcher_controller_fjifje.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16LauncherPageFjeijie
    extends B16RootPageQazmtr<B16LauncherControllerFjifje> {
  const B16LauncherPageFjeijie({super.key});

  @override
  B16LauncherControllerFjifje b16CreateControllerAhdwks() {
    return B16LauncherControllerFjifje();
  }

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextCmvqer,
    B16LauncherControllerFjifje b16ControllerTbnyui,
  ) {
    return Column(
      children: [
        SizedBox(height: 160.h),
        B16AssetImageViewPzrxcu(
          'b16_logo_fhuefhie',
          b16WidthDtvqpl: 88.w,
          b16HeightRnxkse: 88.w,
        ),
        SizedBox(height: 20.h),
        B16LocalizedTextViewCxmpra(
          'Your pocket file pro'.tr,
          b16FontSizeRvxqle: 16.sp,
          b16ColorDtkzma: Colors.black,
          b16FontWeightHncysp: FontWeight.bold,
        ),
        const Spacer(),
        GetBuilder<B16LauncherControllerFjifje>(
          id: B16LauncherControllerFjifje.b16ProgressUpdateIdQmxvza,
          builder: (B16LauncherControllerFjifje b16ControllerKqmvza) {
            return b16ProgressWidgetPqnvxe(
              b16ControllerKqmvza.b16ProgressValuePqmxra,
            );
          },
        ),
        SizedBox(height: 142.h),
      ],
    );
  }

  Widget b16ProgressWidgetPqnvxe(double b16ProgressVqmwza) {
    return Container(
      width: double.infinity,
      height: 16.h,
      margin: EdgeInsets.symmetric(horizontal: 62.w),
      child: LayoutBuilder(
        builder: (BuildContext b16ContextHqmxve, BoxConstraints b16BoxKqvwza) {
          final double b16TrackWidthPqmxre = b16BoxKqvwza.maxWidth - 4.w;
          final double b16SafeProgressTqnvxa = b16ProgressVqmwza.clamp(
            0.0,
            1.0,
          );
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: BoxDecoration(
              color: const Color(0xffebebeb),
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Container(
              width: b16TrackWidthPqmxre * b16SafeProgressTqnvxa,
              height: 12.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                gradient: const LinearGradient(
                  colors: [Color(0xffff8e71), Color(0xffa77ff1)],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
