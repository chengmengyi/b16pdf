import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_controller_hqvwze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16HomePageKpnyra extends B16RootPageQazmtr<B16HomeControllerHqvwze> {
  const B16HomePageKpnyra({super.key});

  @override
  B16HomeControllerHqvwze b16CreateControllerAhdwks() {
    return B16HomeControllerHqvwze();
  }

  @override
  Color get b16NavigationBarColorLxqvbi => Colors.white;

  @override
  bool get b16ResizeToAvoidBottomInsetNwskde => false;

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextVqmwza,
    B16HomeControllerHqvwze b16ControllerKqmxve,
  ) {
    return GetBuilder<B16HomeControllerHqvwze>(
      id: B16HomeControllerHqvwze.b16TabUpdateIdPqmxve,
      builder: (B16HomeControllerHqvwze b16ControllerVqmxza) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(bottom: 64.h),
              child: IndexedStack(
                index: b16ControllerVqmxza.b16TabIndexKqmwza,
                children: b16ControllerVqmxza.b16PagesVqnxre,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: b16BottomWidgetPqmvze(b16ControllerVqmxza),
            ),
          ],
        );
      },
    );
  }

  Widget b16BottomWidgetPqmvze(B16HomeControllerHqvwze b16ControllerKqmxva) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: 64.h,
          margin: EdgeInsets.only(top: 15.w),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 5,
                offset: const Offset(0, -0.5),
              ),
            ],
          ),
          child: Row(
            children: [
              b16ItemWidgetHqnvza(
                B16HomeBottomTabType.files,
                b16ControllerKqmxva,
              ),
              SizedBox(width: 64.w),
              b16ItemWidgetHqnvza(
                B16HomeBottomTabType.tools,
                b16ControllerKqmxva,
              ),
            ],
          ),
        ),
        B16AssetImageViewPzrxcu(
          'b16_bottom_center_bg_fjheifjhe',
          b16WidthDtvqpl: 80.w,
          b16HeightRnxkse: 16.w,
        ),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          child: B16TapGuardViewMfwqke(
            b16ChildHnqvsa: B16AssetImageViewPzrxcu(
              'b16_home_scan_fheifie',
              b16WidthDtvqpl: 64.w,
              b16HeightRnxkse: 64.w,
            ),
          ),
        ),
      ],
    );
  }

  Widget b16ItemWidgetHqnvza(
    B16HomeBottomTabType b16TypeVqmxze,
    B16HomeControllerHqvwze b16ControllerKqnvxa,
  ) {
    final bool b16SelectedPqmwza =
        b16ControllerKqnvxa.b16TabIndexKqmwza == b16TypeVqmxze.index;
    return Expanded(
      child: B16TapGuardViewMfwqke(
        b16OnPressedJkcxwu: () {
          b16ControllerKqnvxa.b16SelectTabHqmvze(b16TypeVqmxze);
        },
        b16ChildHnqvsa: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              B16AssetImageViewPzrxcu(
                b16SelectedPqmwza
                    ? b16TypeVqmxze.b16IconSelectedHqmwze
                    : b16TypeVqmxze.b16IconUnselectedVqnxra,
                b16WidthDtvqpl: 28.w,
                b16HeightRnxkse: 28.w,
              ),
              B16LocalizedTextViewCxmpra(
                b16TypeVqmxze.b16TextKqmvza.tr,
                b16FontSizeRvxqle: 12.sp,
                b16ColorDtkzma: b16SelectedPqmwza
                    ? const Color(0xfff4411f)
                    : const Color(0xff858c92),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
