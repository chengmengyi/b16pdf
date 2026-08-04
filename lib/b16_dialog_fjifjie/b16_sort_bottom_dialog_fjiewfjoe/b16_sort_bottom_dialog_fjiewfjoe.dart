import 'package:b16pdf/b16_dialog_fjifjie/b16_sort_bottom_dialog_fjiewfjoe/b16_sort_bottom_dialog_fjiewfjoe_controller.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_controller_widget_hqmvza.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_media_padding_view_vnyqsl.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16SortBottomDialogFjiewfjoe
    extends B16ControllerWidgetHqmvza<B16SortBottomDialogFjiewfjoeController> {
  final B16SortType b16SelectedTypeHqmwza;
  B16SortBottomDialogFjiewfjoe({required this.b16SelectedTypeHqmwza});

  @override
  B16SortBottomDialogFjiewfjoeController b16CreateControllerPqmwza() =>
      B16SortBottomDialogFjiewfjoeController(
        b16SelectedTypeVqmxza: b16SelectedTypeHqmwza,
      );

  @override
  Widget b16BuildContentHqnvxe(
    BuildContext b16ContextKqmwza,
    B16SortBottomDialogFjiewfjoeController b16ControllerVqnxre,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_titleWidget(), _listWidget(b16ControllerVqnxre)],
      ),
    );
  }

  _listWidget(B16SortBottomDialogFjiewfjoeController b16controllerVqnxre) =>
      B16MediaPaddingViewVnyqsl(
        b16ChildQzpmwa: ListView.builder(
          shrinkWrap: true,
          itemCount: B16SortType.values.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var type = B16SortType.values[index];
            return B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: () {
                b16controllerVqnxre.clickSort(type);
              },
              b16ChildHnqvsa: Container(
                width: double.infinity,
                height: 48.h,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Row(
                  children: [
                    B16AssetImageViewPzrxcu(
                      type.b16IconKqnvxe,
                      b16WidthDtvqpl: 24.w,
                      b16HeightRnxkse: 24.w,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: B16LocalizedTextViewCxmpra(
                        type.b16TextHqmwza.tr,
                        b16FontSizeRvxqle: 16.sp,
                        b16ColorDtkzma: Color(0xff4B4D56),
                        b16FontWeightHncysp: FontWeight.w500,
                        b16OverflowFzrxke: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    if (type == b16controllerVqnxre.b16SelectedTypeVqmxza)
                      B16AssetImageViewPzrxcu(
                        "b16_select_sort_fjiefjioe",
                        b16WidthDtvqpl: 24.w,
                        b16HeightRnxkse: 24.w,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      );

  _titleWidget() => SizedBox(
    width: double.infinity,
    height: 56.h,
    child: Stack(
      children: [
        Align(
          child: B16LocalizedTextViewCxmpra(
            "Sort By".tr,
            b16FontSizeRvxqle: 20.sp,
            b16ColorDtkzma: Colors.black,
            b16FontWeightHncysp: FontWeight.bold,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(right: 16.w),
            child: B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: () {
                B16RoutersHepFjeifjoe.b16BackFtynwp();
              },
              b16ChildHnqvsa: B16AssetImageViewPzrxcu(
                "b16_close_icon",
                b16WidthDtvqpl: 24.w,
                b16HeightRnxkse: 24.w,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
