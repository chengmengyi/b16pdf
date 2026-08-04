import 'package:b16pdf/b16_pages_fjeifje/b16_preview_excel_rqmwza/b16_preview_excel_controller_mqptza.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B16PreviewExcelPageXqnvze
    extends B16RootPageQazmtr<B16PreviewExcelControllerMqptza> {
  const B16PreviewExcelPageXqnvze({super.key});

  @override
  B16PreviewExcelControllerMqptza b16CreateControllerAhdwks() =>
      B16PreviewExcelControllerMqptza();

  @override
  Color get b16NavigationBarColorLxqvbi => Colors.white;

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextRqmwza,
    B16PreviewExcelControllerMqptza b16ControllerXqnvze,
  ) => Column(
    children: [
      _titleWidget(b16ControllerXqnvze),
      _contentWidget(),
      _bottomWidget(),
    ],
  );


  _contentWidget()=>Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.all(8.w),
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
    ),
  );

  _bottomWidget()=>B16TapGuardViewMfwqke(
    b16ChildHnqvsa: Container(
      width: double.infinity,
      height: 44.h,
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Color(0xff067BF2),
        borderRadius: BorderRadius.circular(22.w),
      ),
      child: B16LocalizedTextViewCxmpra("Edit",b16FontSizeRvxqle: 16.sp,b16ColorDtkzma: Colors.white,b16FontWeightHncysp: FontWeight.bold,),
    ),
  );

  _titleWidget(B16PreviewExcelControllerMqptza b16controllerXqnvze)=>Container(
    width: double.infinity,
    color: Colors.white,
    child: SafeArea(
      top: true,
      bottom: false,
      child: SizedBox(
        width: double.infinity,
        height: 44.h,
        child: Stack(
          children: [
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: (){
                b16controllerXqnvze.clickBack();
              },
              b16ChildHnqvsa: Container(
                width: 44.w,
                height: 44.h,
                alignment: Alignment.center,
                child: B16AssetImageViewPzrxcu("b16_back_icon",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
              ),
            ),
            Align(
              child: B16LocalizedTextViewCxmpra("profile.excel",b16FontSizeRvxqle: 18.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
            ),
          ],
        ),
      ),
    ),
  );
}
