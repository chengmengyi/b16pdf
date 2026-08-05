import 'package:b16pdf/b16_dialog_fjifjie/b16_add_widget_bottom_dialog_jwiokowdw/b16_add_widget_bottom_dialog_jwiokowdw_controller.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_add_widget_hep_qxnvza/b16_add_widget_hep_kqmvze.dart';
import 'package:b16pdf/b16_root_fjield/b16_controller_widget_hqmvza.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_media_padding_view_vnyqsl.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class B16AddWidgetBottomDialogJwiokowdw
    extends
        B16ControllerWidgetHqmvza<B16AddWidgetBottomDialogJwiokowdwController> {
  const B16AddWidgetBottomDialogJwiokowdw({super.key});

  @override
  B16AddWidgetBottomDialogJwiokowdwController b16CreateControllerPqmwza() =>
      B16AddWidgetBottomDialogJwiokowdwController();

  @override
  Widget b16BuildContentHqnvxe(
    BuildContext b16ContextKqmwza,
    B16AddWidgetBottomDialogJwiokowdwController b16ControllerVqnxre,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          B16LocalizedTextViewCxmpra(
            'Add Widget'.tr,
            b16FontSizeRvxqle: 20.sp,
            b16ColorDtkzma: Colors.black,
            b16FontWeightHncysp: FontWeight.bold,
          ),
          SizedBox(height: 10.h),
          B16LocalizedTextViewCxmpra(
            'Add widget with one click to open files'.tr,
            b16FontSizeRvxqle: 14.sp,
            b16ColorDtkzma: const Color(0xff4B5156),
            b16MaxLinesPqmtva: 1,
            b16OverflowFzrxke: TextOverflow.ellipsis,
          ),
          SizedBox(height: 12.h),
          _contentWidget(),
          SizedBox(height: 20.h),
          B16TapGuardViewMfwqke(
            b16OnPressedJkcxwu: (){
              b16ControllerVqnxre.clickAdd();
            },
            b16ChildHnqvsa: Container(
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  B16AssetImageViewPzrxcu(
                    "b16_add_icon_fwodkow",
                    b16WidthDtvqpl: 24.w,
                    b16HeightRnxkse: 24.w,
                  ),
                  SizedBox(width: 8.w),
                  B16LocalizedTextViewCxmpra(
                    "Add".tr,
                    b16FontSizeRvxqle: 16.sp,
                    b16ColorDtkzma: Colors.white,
                    b16FontWeightHncysp: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentWidget() => Container(
    width: double.infinity,
    height: 152.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.w),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: 5,
          offset: const Offset(0, -0.5),
        ),
      ],
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        B16AssetImageViewPzrxcu(
          "b16_add_widget_bg_fiejdie",
          b16WidthDtvqpl: double.infinity,
          b16HeightRnxkse: double.infinity,
        ),
        Container(
          margin: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 40.h,
                padding: EdgeInsets.all(1.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.w),
                  ),
                  child: Row(
                    children: [
                      B16AssetImageViewPzrxcu(
                        "b16_search_fjhiefje",
                        b16WidthDtvqpl: 24.w,
                        b16HeightRnxkse: 24.w,
                      ),
                      SizedBox(width: 8.w),
                      B16LocalizedTextViewCxmpra(
                        "Search...".tr,
                        b16FontSizeRvxqle: 16.sp,
                        b16ColorDtkzma: Color(0xff858C92),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              B16MediaPaddingViewVnyqsl(
                b16ChildQzpmwa: MasonryGridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 8.w,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: AddWidgetType.values.length,
                  itemBuilder: (BuildContext context, int index) {
                    var type = AddWidgetType.values[index];
                    return Container(
                      width: double.infinity,
                      height: 64.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.w),
                        border: Border.all(
                          width: 0.5.w,
                          color: Color(0xffEBEBEB),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          B16AssetImageViewPzrxcu(
                            type.icon,
                            b16WidthDtvqpl: 24.w,
                            b16HeightRnxkse: 24.w,
                          ),
                          SizedBox(height: 4.h),
                          B16LocalizedTextViewCxmpra(
                            type.text.tr,
                            b16FontSizeRvxqle: 12.sp,
                            b16ColorDtkzma: Colors.black,
                            b16FontWeightHncysp: FontWeight.bold,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
