import 'package:b16pdf/b16_pages_fjeifje/b16_launcher_feofke/b16_launcher_controller_fjifje.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B16LauncherPageFjeijie extends B16RootPageQazmtr<B16LauncherControllerFjifje>{

  @override
  B16LauncherControllerFjifje b16CreateControllerAhdwks() => B16LauncherControllerFjifje();

  @override
  Widget b16BuildContentRuznxe(BuildContext b16ContextCmvqer, B16LauncherControllerFjifje b16ControllerTbnyui) {
    return Column(
      children: [
        SizedBox(height: 160.h,),
        B16AssetImageViewPzrxcu("b16_logo_fhuefhie",b16WidthDtvqpl: 88.w,b16HeightRnxkse: 88.w,),
        SizedBox(height: 20.h,),
        B16LocalizedTextViewCxmpra("Your pocket file pro",b16FontSizeRvxqle: 16.sp,b16ColorDtkzma: Color(0xff000000),b16FontWeightHncysp: FontWeight.bold,),
        Spacer(),
        Container(
          width: double.infinity,
          height: 16.h,
          margin: EdgeInsets.only(left: 62.w,right: 62.w),
          child: LayoutBuilder(
            builder: (context,bc){
              var maxWidth = bc.maxWidth-(4.w);
              return Container(
                width: double.infinity,
                height: 16.h,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 2.w,right: 2.w),
                decoration: BoxDecoration(
                  color: Color(0xffEBEBEB),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Container(
                  width: maxWidth*0.5,
                  height: 12.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xffFF8E71),Color(0xffA77FF1)],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 142.h,),
      ],
    );
  }
}