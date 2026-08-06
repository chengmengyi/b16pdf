import 'package:b16pdf/b16_dialog_fjifjie/b16_comment_dialog_jiwjdiw/b16_comment_dialog_jiwjdiw_controller.dart';
import 'package:b16pdf/b16_root_fjield/b16_controller_widget_hqmvza.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_media_padding_view_vnyqsl.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class B16CommentDialogJiwjdiwe
    extends B16ControllerWidgetHqmvza<B16CommentDialogJiwjdiwController> {
  const B16CommentDialogJiwjdiwe({super.key});

  @override
  B16CommentDialogJiwjdiwController b16CreateControllerPqmwza() =>
      B16CommentDialogJiwjdiwController();

  @override
  Widget b16BuildContentHqnvxe(
    BuildContext b16ContextKqmwza,
    B16CommentDialogJiwjdiwController b16ControllerVqnxre,
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
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20.h),
                B16AssetImageViewPzrxcu(
                  "b16_logo_fhuefhie",
                  b16WidthDtvqpl: 68.w,
                  b16HeightRnxkse: 68.w,
                ),
                SizedBox(height: 16.h),
                B16LocalizedTextViewCxmpra(
                  "Enjoying PDF Reader?".tr,
                  b16FontSizeRvxqle: 20.sp,
                  b16ColorDtkzma: Colors.black,
                  b16FontWeightHncysp: FontWeight.bold,
                ),
                SizedBox(height: 10.h),
                B16LocalizedTextViewCxmpra(
                  "Your 5-star rating helps us improve! It only takes a few seconds of your time."
                      .tr,
                  b16FontSizeRvxqle: 14.sp,
                  b16ColorDtkzma: Color(0xff4B5156),
                ),
                SizedBox(height: 10.h),
                //b16_star_sel_icon_jiwjiew  b16_star_uns_icon_djiwji
                Container(
                  width: double.infinity,
                  height: 48.w,
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: GetBuilder<B16CommentDialogJiwjdiwController>(
                    id: B16CommentDialogJiwjdiwController
                        .b16StarBuilderIdKqnvze,
                    builder: (b16BuilderQxmvza) => B16MediaPaddingViewVnyqsl(
                      b16ChildQzpmwa: MasonryGridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 5,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 12.w,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          final bool b16SelectedKqnvze =
                              index < b16BuilderQxmvza.b16StarCountPqnvze;
                          return B16TapGuardViewMfwqke(
                            b16OnPressedJkcxwu: () {
                              b16BuilderQxmvza.b16ClickStarVqmwza(index);
                            },
                            b16ChildHnqvsa: B16AssetImageViewPzrxcu(
                              b16SelectedKqnvze
                                  ? "b16_star_sel_icon_jiwjiew"
                                  : "b16_star_uns_icon_djiwji",
                              b16WidthDtvqpl: 48.w,
                              b16HeightRnxkse: 48.w,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                B16TapGuardViewMfwqke(
                  b16OnPressedJkcxwu: b16ControllerVqnxre.b16ClickRateUsKqnvze,
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
                    child: B16LocalizedTextViewCxmpra(
                      "Rate Us 5 Stars".tr,
                      b16FontSizeRvxqle: 16.sp,
                      b16ColorDtkzma: Colors.white,
                      b16FontWeightHncysp: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: () {
                b16ControllerVqnxre.b16ClickCloseVqntza();
              },
              b16ChildHnqvsa: Container(
                width: 44.w,
                height: 44.w,
                alignment: Alignment.center,
                child: B16AssetImageViewPzrxcu(
                  "b16_close_icon",
                  b16HeightRnxkse: 24.w,
                  b16WidthDtvqpl: 24.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
