import 'package:b16pdf/b16_dialog_fjifjie/b16_change_language_bottom_dialog_fjeifoef/b16_change_language_bottom_dialog_fjeifoef_controller.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_controller_widget_hqmvza.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_media_padding_view_vnyqsl.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B16ChangeLanguageBottomDialogFjeifoef extends B16ControllerWidgetHqmvza<B16ChangeLanguageBottomDialogFjeifoefController>{

  @override
  B16ChangeLanguageBottomDialogFjeifoefController b16CreateControllerPqmwza() => B16ChangeLanguageBottomDialogFjeifoefController();

  @override
  Widget b16BuildContentHqnvxe(BuildContext b16ContextKqmwza, B16ChangeLanguageBottomDialogFjeifoefController b16ControllerVqnxre) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 16.w,right: 16.w,),
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
          _titleWidget(),
          _contentWidget(),
        ],
      ),
    );
  }
  
  _contentWidget()=>Container(
    width: double.infinity,
    height: 448.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.w),
      border: Border.all(
        width: 0.5.w,
        color: Color(0xffE0E3EA),
      ),
    ),
    child: B16MediaPaddingViewVnyqsl(
      b16ChildQzpmwa: ListView.builder(
        itemBuilder: (context,index){
          return Container(
            width: double.infinity,
            height: 56.h,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16.w,right: 16.w),
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
          );
        },
      ),
    ),
  );

  _titleWidget()=>SizedBox(
    width: double.infinity,
    height: 56.h,
    child: Stack(
      children: [
        Align(
          child: B16LocalizedTextViewCxmpra("App Language",b16FontSizeRvxqle: 20.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: B16TapGuardViewMfwqke(
            b16OnPressedJkcxwu: (){
              B16RoutersHepFjeifjoe.b16BackFtynwp();
            },
            b16ChildHnqvsa: B16AssetImageViewPzrxcu("b16_close_icon",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
          ),
        ),
      ],
    ),
  );
}