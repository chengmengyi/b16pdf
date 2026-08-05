import 'package:b16pdf/b16_pages_fjeifje/b16_process_result_vqntza/b16_process_result_controller_hqmwze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_lottie_widget_ijowok.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B16ProcessResultPageKqnvze
    extends B16RootPageQazmtr<B16ProcessResultControllerHqmwze> {
  const B16ProcessResultPageKqnvze({super.key});

  @override
  B16ProcessResultControllerHqmwze b16CreateControllerAhdwks() {
    return B16ProcessResultControllerHqmwze();
  }

  @override
  Color get b16NavigationBarColorLxqvbi => Colors.white;

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextVqmwza,
    B16ProcessResultControllerHqmwze b16ControllerKqmxve,
  ) {
    return Column(
      children: [
        _b16TitleHqmwza(b16ControllerKqmxve),
        SizedBox(height: 100.h,),
        B16AssetImageViewPzrxcu("b16_process_result_top_ejwoeow",b16WidthDtvqpl: 80.w,b16HeightRnxkse: 80.w,),
        SizedBox(height: 20.h,),
        B16LocalizedTextViewCxmpra('Success!',b16FontSizeRvxqle: 24.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
        SizedBox(height: 8.h,),
        B16LocalizedTextViewCxmpra('Your file is ready',b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Color(0xff4B5156),b16FontWeightHncysp: FontWeight.w500,),
        SizedBox(height: 50.h,),
        _infoWidget(),
        Spacer(),
        _bottomWidget(),
      ],
    );
  }

  _bottomWidget()=>B16TapGuardViewMfwqke(
    b16OnPressedJkcxwu: (){

    },
    b16ChildHnqvsa: Container(
      width: double.infinity,
      height: 60.h,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.w),
          topRight: Radius.circular(12.w),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 5,
            offset: const Offset(0, -0.5),
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        height: 44.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.w),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
          ),
        ),
        child: B16LocalizedTextViewCxmpra(
          "Open",
          b16FontSizeRvxqle: 16.sp,
          b16ColorDtkzma: Colors.white,
          b16FontWeightHncysp: FontWeight.bold,
        ),
      ),
    ),
  );

  _infoWidget()=>Container(
    width: double.infinity,
    height: 72.h,
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 16.w,right: 16.w),
    margin: EdgeInsets.only(left: 40.w,right: 40.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.w),
      border: Border.all(
        width: 0.5.w,
        color: Color(0xffEBEBEB),
      ),
    ),
    child: Row(
      children: [
        B16AssetImageViewPzrxcu("b16_pdf_logo",b16WidthDtvqpl: 32.w,b16HeightRnxkse: 32.w,),
        SizedBox(width: 12.w,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              B16LocalizedTextViewCxmpra("profile.pdf",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
              B16LocalizedTextViewCxmpra("2026-01-01｜12.0M",b16FontSizeRvxqle: 12.sp,b16ColorDtkzma: Color(0xff858C92),b16FontWeightHncysp: FontWeight.w500,),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _b16TitleHqmwza(B16ProcessResultControllerHqmwze b16controllerKqmxve) =>
      Container(
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
