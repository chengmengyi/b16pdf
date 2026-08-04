import 'package:b16pdf/b16_dialog_fjifjie/b16_change_language_bottom_dialog_fjeifoef/b16_change_language_bottom_dialog_fjeifoef_controller.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_language_hep_fjeifje/b16_language_tools_fieife.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_controller_widget_hqmvza.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_media_padding_view_vnyqsl.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16ChangeLanguageBottomDialogFjeifoef
    extends
        B16ControllerWidgetHqmvza<
          B16ChangeLanguageBottomDialogFjeifoefController
        > {
  const B16ChangeLanguageBottomDialogFjeifoef({super.key});

  @override
  B16ChangeLanguageBottomDialogFjeifoefController b16CreateControllerPqmwza() =>
      B16ChangeLanguageBottomDialogFjeifoefController();
  @override
  Widget b16BuildContentHqnvxe(
    BuildContext b16ContextKqmwza,
    B16ChangeLanguageBottomDialogFjeifoefController b16ControllerVqnxre,
  ) => GetBuilder<B16ChangeLanguageBottomDialogFjeifoefController>(
    init: b16ControllerVqnxre,
    global: false,
    builder: (b16ControllerQxmvza) => Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
          _b16TitleWidgetKqnvze(),
          _b16ContentWidgetVqntza(b16ControllerQxmvza),
          SizedBox(height: 12.h),
        ],
      ),
    ),
  );

  Widget _b16ContentWidgetVqntza(
    B16ChangeLanguageBottomDialogFjeifoefController b16ControllerQxmvza,
  ) => Container(
    width: double.infinity,
    height: 448.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.w),
      border: Border.all(width: 0.5.w, color: const Color(0xffE0E3EA)),
    ),
    child: B16MediaPaddingViewVnyqsl(
      b16ChildQzpmwa: ListView.builder(
        controller: b16ControllerQxmvza.b16LanguageScrollControllerQxmvza,
        itemCount: b16ControllerQxmvza.b16LanguageListPqmwza.length,
        itemBuilder: (b16ContextKqnvze, b16IndexVqntza) {
          final B16LanguageItemQxmvza b16ItemPqmwza =
              b16ControllerQxmvza.b16LanguageListPqmwza[b16IndexVqntza];
          final b16SelectedHqmwza = b16ControllerQxmvza.b16IsSelectedVqntza(
            b16ItemPqmwza,
          );
          return B16TapGuardViewMfwqke(
            b16OnPressedJkcxwu: () =>
                b16ControllerQxmvza.b16ClickLanguagePqmwza(b16ItemPqmwza),
            b16ChildHnqvsa: SizedBox(
              height: 56.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    B16AssetImageViewPzrxcu(
                      b16ItemPqmwza.b16IconHqmwza,
                      b16WidthDtvqpl: 32.w,
                      b16HeightRnxkse: 32.w,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: B16LocalizedTextViewCxmpra(
                        b16ItemPqmwza.b16NameKqnvze,
                        b16FontSizeRvxqle: 14.sp,
                        b16ColorDtkzma: const Color(0xff060E23),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    B16AssetImageViewPzrxcu(
                      b16SelectedHqmwza ? 'b16_sel_icon' : 'b16_uns_icon',
                      b16WidthDtvqpl: 24.w,
                      b16HeightRnxkse: 24.w,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );

  Widget _b16TitleWidgetKqnvze() => SizedBox(
    width: double.infinity,
    height: 56.h,
    child: Stack(
      children: [
        Align(
          child: B16LocalizedTextViewCxmpra(
            'App Language'.tr,
            b16FontSizeRvxqle: 20.sp,
            b16ColorDtkzma: Colors.black,
            b16FontWeightHncysp: FontWeight.bold,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: B16TapGuardViewMfwqke(
            b16OnPressedJkcxwu: B16RoutersHepFjeifjoe.b16BackFtynwp,
            b16ChildHnqvsa: B16AssetImageViewPzrxcu(
              'b16_close_icon',
              b16WidthDtvqpl: 24.w,
              b16HeightRnxkse: 24.w,
            ),
          ),
        ),
      ],
    ),
  );
}
