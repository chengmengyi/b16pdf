import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_tools_child_tqmvza/b16_tools_child_controller_hpnxwe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_add_widget_hep_qxnvza/b16_add_widget_hep_kqmvze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_child_mxkqza.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    return GetBuilder<B16ToolsChildControllerHpnxwe>(
      init: b16ControllerVqmxre,
      global: false,
      builder: (b16ControllerQxmvza) => Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: B16AssetImageViewPzrxcu(
              "b16_tools_top_bg_fjeifie",
              b16WidthDtvqpl: 200.w,
              b16HeightRnxkse: 120.h,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleWidget(),
                  SizedBox(height: 10.h),
                  _toolsWidget(),
                  SizedBox(height: 8.h),
                  _systemWidget(),
                  SizedBox(height: 8.h),
                  _preferenceWidget(b16ControllerQxmvza),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _toolsWidget() => Container(
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
            SizedBox(width: 8.w),
            B16AssetImageViewPzrxcu(
              "b16_tools_icon_fjiejfoe",
              b16WidthDtvqpl: 24.w,
              b16HeightRnxkse: 24.w,
            ),
            SizedBox(width: 8.w),
            B16LocalizedTextViewCxmpra(
              "PDF tools".tr,
              b16FontSizeRvxqle: 14.sp,
              b16ColorDtkzma: Colors.black,
              b16FontWeightHncysp: FontWeight.bold,
            ),
          ],
        ),
        SizedBox(height: 12.h),
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
                  border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    B16AssetImageViewPzrxcu(
                      "b16_scan_to_pdf_fjiefoe",
                      b16WidthDtvqpl: 52.w,
                      b16HeightRnxkse: 60.h,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          B16LocalizedTextViewCxmpra(
                            "Scan To".tr,
                            b16FontSizeRvxqle: 14.sp,
                            b16ColorDtkzma: Colors.black,
                          ),
                          B16LocalizedTextViewCxmpra(
                            "PDF".tr,
                            b16FontSizeRvxqle: 18.sp,
                            b16ColorDtkzma: Colors.black,
                            b16FontWeightHncysp: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 72.h,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    B16AssetImageViewPzrxcu(
                      "b16_image_to_pdf_fjiefjie",
                      b16WidthDtvqpl: 52.w,
                      b16HeightRnxkse: 60.h,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          B16LocalizedTextViewCxmpra(
                            "Image To".tr,
                            b16FontSizeRvxqle: 14.sp,
                            b16ColorDtkzma: Colors.black,
                          ),
                          B16LocalizedTextViewCxmpra(
                            "PDF".tr,
                            b16FontSizeRvxqle: 18.sp,
                            b16ColorDtkzma: Colors.black,
                            b16FontWeightHncysp: FontWeight.bold,
                          ),
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

  Widget _systemWidget() => Container(
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
            SizedBox(width: 8.w),
            B16AssetImageViewPzrxcu(
              "b16_system_icon_fjiejfoe",
              b16WidthDtvqpl: 24.w,
              b16HeightRnxkse: 24.w,
            ),
            SizedBox(width: 8.w),
            B16LocalizedTextViewCxmpra(
              "System".tr,
              b16FontSizeRvxqle: 14.sp,
              b16ColorDtkzma: Colors.black,
              b16FontWeightHncysp: FontWeight.bold,
            ),
          ],
        ),
        SizedBox(height: 12.h),
        B16TapGuardViewMfwqke(
          b16OnPressedJkcxwu: () {
            B16AddWidgetHepKqmvze.instance.showAddWidgetDialog();
          },
          b16ChildHnqvsa: Container(
            width: double.infinity,
            height: 56.h,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
            ),
            child: Row(
              children: [
                SizedBox(width: 12.w),
                B16AssetImageViewPzrxcu(
                  "b16_add_widget_icon_fjiejfoe",
                  b16WidthDtvqpl: 32.w,
                  b16HeightRnxkse: 32.w,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: B16LocalizedTextViewCxmpra(
                    "Add Widget".tr,
                    b16FontSizeRvxqle: 14.sp,
                    b16ColorDtkzma: Colors.black,
                    b16FontWeightHncysp: FontWeight.w500,
                  ),
                ),
                B16AssetImageViewPzrxcu(
                  "b16_add_icon_fjoefe",
                  b16WidthDtvqpl: 24.w,
                  b16HeightRnxkse: 24.w,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _preferenceWidget(B16ToolsChildControllerHpnxwe b16controllerVqmxre) =>
      Container(
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
                SizedBox(width: 8.w),
                B16AssetImageViewPzrxcu(
                  "b16_pre_icon_fjiefjoe",
                  b16WidthDtvqpl: 24.w,
                  b16HeightRnxkse: 24.w,
                ),
                SizedBox(width: 8.w),
                B16LocalizedTextViewCxmpra(
                  "Preference".tr,
                  b16FontSizeRvxqle: 14.sp,
                  b16ColorDtkzma: Colors.black,
                  b16FontWeightHncysp: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: () {
                b16controllerVqmxre.clickChangeLanguage();
              },
              b16ChildHnqvsa: Container(
                width: double.infinity,
                height: 56.h,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 12.w),
                    B16AssetImageViewPzrxcu(
                      "b16_lan_icon_dwdw",
                      b16WidthDtvqpl: 32.w,
                      b16HeightRnxkse: 32.w,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: B16LocalizedTextViewCxmpra(
                        "App Language".tr,
                        b16FontSizeRvxqle: 14.sp,
                        b16ColorDtkzma: Colors.black,
                        b16FontWeightHncysp: FontWeight.w500,
                      ),
                    ),
                    B16LocalizedTextViewCxmpra(
                      b16controllerVqmxre.b16CurrentLanguageNameQxmvza,
                      b16FontSizeRvxqle: 12.sp,
                      b16ColorDtkzma: Color(0xff858C92),
                      b16FontWeightHncysp: FontWeight.w500,
                    ),
                    SizedBox(width: 4.w),
                    B16AssetImageViewPzrxcu(
                      "b16_right_kspwkpw",
                      b16WidthDtvqpl: 16.w,
                      b16HeightRnxkse: 16.w,
                    ),
                    SizedBox(width: 4.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _titleWidget() => SafeArea(
    top: true,
    bottom: false,
    child: B16LocalizedTextViewCxmpra(
      "Tools & Settings".tr,
      b16FontSizeRvxqle: 28.sp,
      b16ColorDtkzma: Colors.black,
      b16FontWeightHncysp: FontWeight.bold,
    ),
  );
}
