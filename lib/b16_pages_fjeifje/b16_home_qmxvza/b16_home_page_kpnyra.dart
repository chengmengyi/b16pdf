import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_controller_hqvwze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B16HomePageKpnyra extends B16RootPageQazmtr<B16HomeControllerHqvwze> {
  const B16HomePageKpnyra({super.key});

  @override
  B16HomeControllerHqvwze b16CreateControllerAhdwks() {
    return B16HomeControllerHqvwze();
  }

  @override
  Color get b16NavigationBarColorLxqvbi => Colors.white;

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextVqmwza,
    B16HomeControllerHqvwze b16ControllerKqmxve,
  ) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(bottom: 64.h),
          child: IndexedStack(
            index: b16ControllerKqmxve.tabIndex,
            children: b16ControllerKqmxve.pagesList,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _bottomWidget(),
        ),
      ],
    );
  }

  _bottomWidget()=>Stack(
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
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, -0.5),
            ),
          ],
        ),
        child: Row(
          children: [
            _itemWidget(B16HomeBottomTabType.files),
            SizedBox(width: 64.w,),
            _itemWidget(B16HomeBottomTabType.tools),
          ],
        ),
      ),
      B16AssetImageViewPzrxcu("b16_bottom_center_bg_fjheifjhe",b16WidthDtvqpl: 80.w,b16HeightRnxkse: 16.w,),
      Container(
        margin: EdgeInsets.only(top: 4.h),
        child: B16TapGuardViewMfwqke(
          b16ChildHnqvsa: B16AssetImageViewPzrxcu("b16_home_scan_fheifie",b16WidthDtvqpl: 64.w,b16HeightRnxkse: 64.w,),
        ),
      ),
    ],
  );

  _itemWidget(B16HomeBottomTabType type)=>Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          B16AssetImageViewPzrxcu(type.iconSel,b16WidthDtvqpl: 28.w,b16HeightRnxkse: 28.w,),
          B16LocalizedTextViewCxmpra(type.text,b16FontSizeRvxqle: 12.sp,b16ColorDtkzma: Color(0xffF4411F),)
        ],
      ),
    ),
  );
}
