import 'package:b16pdf/b16_pages_fjeifje/b16_open_notification_page_rqmvza/b16_open_notification_controller_hqvwze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class B16OpenNotificationPageKqmxve
    extends B16RootPageQazmtr<B16OpenNotificationControllerHqvwze> {
  const B16OpenNotificationPageKqmxve({super.key});

  @override
  B16OpenNotificationControllerHqvwze b16CreateControllerAhdwks() {
    return B16OpenNotificationControllerHqvwze();
  }

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextVqmwza,
    B16OpenNotificationControllerHqvwze b16ControllerKqmxve,
  ) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        B16AssetImageViewPzrxcu(
          'b16_overlay_permission_top_bg_fjeifje',
          b16WidthDtvqpl: double.infinity,
          b16HeightRnxkse: 180.h,
        ),
        Column(
          children: [
            Spacer(),
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: b16ControllerKqmxve.clickLater,
              b16ChildHnqvsa: B16LocalizedTextViewCxmpra(
                'Later'.tr,
                b16FontSizeRvxqle: 16.sp,
                b16ColorDtkzma: const Color(0xff4b5156),
                b16Decorationfefjie: TextDecoration.underline,
                b16FontWeightHncysp: FontWeight.bold,
              ),
            ),
            SizedBox(height: 36.h),
          ],
        ),
      ],
    );
  }
}
