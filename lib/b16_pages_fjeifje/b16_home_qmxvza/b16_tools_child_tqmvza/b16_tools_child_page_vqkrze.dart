import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_tools_child_tqmvza/b16_tools_child_controller_hpnxwe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_child_mxkqza.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B16ToolsChildPageVqkrze extends B16RootChildMxkqza {
  const B16ToolsChildPageVqkrze({super.key});

  @override
  State<B16ToolsChildPageVqkrze> createState() => _B16ToolsChildStateMqnvxa();
}

class _B16ToolsChildStateMqnvxa
    extends
        B16RootChildStatePrvwlt<
          B16ToolsChildControllerHpnxwe,
          B16ToolsChildPageVqkrze
        > {
  @override
  B16ToolsChildControllerHpnxwe b16CreateControllerNwztpi() {
    return B16ToolsChildControllerHpnxwe();
  }

  @override
  Widget b16BuildContentYksuvd(
    BuildContext b16ContextKqmwza,
    B16ToolsChildControllerHpnxwe b16ControllerVqmxre,
  ) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: B16AssetImageViewPzrxcu("b16_tools_top_bg_fjeifie",b16WidthDtvqpl: 200.w,b16HeightRnxkse: 120.h,),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(left: 8.w,right: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleWidget(),
                SizedBox(height: 10.h),
                _toolsWidget(),
                SizedBox(height: 8.h),
                _systemWidget(),
                SizedBox(height: 8.h),
                _preferenceWidget(b16ControllerVqmxre),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _toolsWidget()=>Container(
    width: double.infinity,
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.w),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8.w,),
            B16AssetImageViewPzrxcu("b16_tools_icon_fjiejfoe",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
            SizedBox(width: 8.w,),
            B16LocalizedTextViewCxmpra("PDF tools",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
          ],
        ),
        SizedBox(height: 12.h,),
        Row(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 72.h,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(
                    width: 0.5.w,
                    color: Color(0xffEBEBEB),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10.w,),
                    B16AssetImageViewPzrxcu("b16_scan_to_pdf_fjiefoe",b16WidthDtvqpl: 52.w,b16HeightRnxkse: 60.h,),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          B16LocalizedTextViewCxmpra("Scan To",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Colors.black,),
                          B16LocalizedTextViewCxmpra("PDF",b16FontSizeRvxqle: 18.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 72.h,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(
                    width: 0.5.w,
                    color: Color(0xffEBEBEB),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10.w,),
                    B16AssetImageViewPzrxcu("b16_image_to_pdf_fjiefjie",b16WidthDtvqpl: 52.w,b16HeightRnxkse: 60.h,),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          B16LocalizedTextViewCxmpra("Image To",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Colors.black,),
                          B16LocalizedTextViewCxmpra("PDF",b16FontSizeRvxqle: 18.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  _systemWidget()=>Container(
    width: double.infinity,
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.w),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8.w,),
            B16AssetImageViewPzrxcu("b16_system_icon_fjiejfoe",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
            SizedBox(width: 8.w,),
            B16LocalizedTextViewCxmpra("System",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
          ],
        ),
        SizedBox(height: 12.h,),
        Container(
          width: double.infinity,
          height: 56.h,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            border: Border.all(
              width: 0.5.w,
              color: Color(0xffEBEBEB),
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 12.w,),
              B16AssetImageViewPzrxcu("b16_add_widget_icon_fjiejfoe",b16WidthDtvqpl: 32.w,b16HeightRnxkse: 32.w,),
              SizedBox(width: 12.w,),
              Expanded(
                child: B16LocalizedTextViewCxmpra("Add Widget",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.w500,),
              ),
              B16AssetImageViewPzrxcu("b16_add_icon_fjoefe",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
            ],
          ),
        ),
      ],
    ),
  );

  _preferenceWidget(B16ToolsChildControllerHpnxwe b16controllerVqmxre)=>Container(
    width: double.infinity,
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.w),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8.w,),
            B16AssetImageViewPzrxcu("b16_pre_icon_fjiefjoe",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
            SizedBox(width: 8.w,),
            B16LocalizedTextViewCxmpra("Preference",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
          ],
        ),
        SizedBox(height: 12.h,),
        B16TapGuardViewMfwqke(
          b16OnPressedJkcxwu: (){
            b16controllerVqmxre.clickChangeLanguage();
          },
          b16ChildHnqvsa: Container(
            width: double.infinity,
            height: 56.h,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              border: Border.all(
                width: 0.5.w,
                color: Color(0xffEBEBEB),
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 12.w,),
                B16AssetImageViewPzrxcu("b16_lan_icon_dwdw",b16WidthDtvqpl: 32.w,b16HeightRnxkse: 32.w,),
                SizedBox(width: 12.w,),
                Expanded(
                  child: B16LocalizedTextViewCxmpra("App Language",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.w500,),
                ),
                B16LocalizedTextViewCxmpra("English",b16FontSizeRvxqle: 12.sp,b16ColorDtkzma: Color(0xff858C92),b16FontWeightHncysp: FontWeight.w500,),
                SizedBox(width: 4.w,),
                B16AssetImageViewPzrxcu("b16_right_kspwkpw",b16WidthDtvqpl: 16.w,b16HeightRnxkse: 16.w,),
                SizedBox(width: 4.w,),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  _titleWidget()=>SafeArea(
    top: true,
    bottom: false,
    child: B16LocalizedTextViewCxmpra("Tools & Settings",b16FontSizeRvxqle: 28.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
  );
}
