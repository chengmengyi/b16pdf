import 'package:b16pdf/b16_hep_djijdow/b16_language_hep_fjeifje/b16_language_tools_fieife.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_choose_language_qxmvza/b16_choose_language_controller_hqmwza.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_media_padding_view_vnyqsl.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16ChooseLanguagePageKqnvze
    extends B16RootPageQazmtr<B16ChooseLanguageControllerHqmwza> {
  const B16ChooseLanguagePageKqnvze({super.key});
  @override
  B16ChooseLanguageControllerHqmwza b16CreateControllerAhdwks() =>
      B16ChooseLanguageControllerHqmwza();

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextQxmvza,
    B16ChooseLanguageControllerHqmwza b16ControllerKqnvze,
  ) => GetBuilder<B16ChooseLanguageControllerHqmwza>(
    init: b16ControllerKqnvze,
    global: false,
    builder: (b16ControllerQxmvza) => Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 120.h),
          _b16TopWidgetHqmwza(),
          SizedBox(height: 40.h),
          _b16ListWidgetKqnvze(b16ControllerQxmvza),
          SizedBox(height: 40.h),
          _b16BottomWidgetVqntza(b16ControllerQxmvza),
          SizedBox(height: 16.h),
        ],
      ),
    ),
  );

  Widget _b16ListWidgetKqnvze(
    B16ChooseLanguageControllerHqmwza b16ControllerQxmvza,
  ) => Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
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
            final b16SelectedHqmwza = b16ControllerQxmvza.b16IsSelectedPqmxza(
              b16ItemPqmwza,
            );
            return B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: () =>
                  b16ControllerQxmvza.b16ClickLanguageHqmwza(b16ItemPqmwza),
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
    ),
  );

  Widget _b16BottomWidgetVqntza(
    B16ChooseLanguageControllerHqmwza b16ControllerQxmvza,
  ) => B16TapGuardViewMfwqke(
    b16OnPressedJkcxwu: b16ControllerQxmvza.clickOk,
    b16ChildHnqvsa: Container(
      width: double.infinity,
      height: 48.h,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.w),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff06B3F2), Color(0xff002DF6)],
        ),
      ),
      child: B16LocalizedTextViewCxmpra(
        'OK'.tr,
        b16FontSizeRvxqle: 18.sp,
        b16ColorDtkzma: Colors.white,
        b16FontWeightHncysp: FontWeight.bold,
      ),
    ),
  );

  Widget _b16TopWidgetHqmwza() => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      B16AssetImageViewPzrxcu(
        'b16_language_top_image_nqmvza',
        b16WidthDtvqpl: 72.w,
        b16HeightRnxkse: 72.w,
      ),
      SizedBox(height: 12.h),
      B16LocalizedTextViewCxmpra(
        'Welcome'.tr,
        b16FontSizeRvxqle: 32.sp,
        b16ColorDtkzma: Colors.black,
        b16FontWeightHncysp: FontWeight.bold,
      ),
      B16LocalizedTextViewCxmpra(
        'Choose your preferred language to get started.'.tr,
        b16FontSizeRvxqle: 16.sp,
        b16ColorDtkzma: const Color(0xff858C92),
        b16FontWeightHncysp: FontWeight.w500,
      ),
    ],
  );
}
