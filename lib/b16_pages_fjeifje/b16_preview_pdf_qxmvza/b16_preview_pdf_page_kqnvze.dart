import 'package:b16pdf/b16_pages_fjeifje/b16_preview_pdf_qxmvza/b16_preview_pdf_controller_hqmwza.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_media_padding_view_vnyqsl.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class B16PreviewPdfPageKqnvze
    extends B16RootPageQazmtr<B16PreviewPdfControllerHqmwza> {
  const B16PreviewPdfPageKqnvze({super.key});

  @override
  B16PreviewPdfControllerHqmwza b16CreateControllerAhdwks() =>
      B16PreviewPdfControllerHqmwza();

  @override
  Color get b16NavigationBarColorLxqvbi => Colors.white;

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextQxmvza,
    B16PreviewPdfControllerHqmwza b16ControllerKqnvze,
  ) => Column(
    children: [
      _titleWidget(b16ControllerKqnvze),
      _contentWidget(b16ControllerKqnvze),
      _bottomWidget(b16ControllerKqnvze),
    ],
  );

  _contentWidget(B16PreviewPdfControllerHqmwza b16controllerKqnvze)=>Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(left: 8.w,right: 8.w,top: 8.h),
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

  _bottomWidget(B16PreviewPdfControllerHqmwza b16controllerKqnvze)=>Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.w),
        topRight: Radius.circular(12.w),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: 5,
          offset: const Offset(0, -0.5),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8.h,),
        Container(
          width: double.infinity,
          height: 88.h,
          margin: EdgeInsets.only(left: 16.w,right: 16.w),
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Container(
                width: 72.w,
                height: 88.h,
                decoration: BoxDecoration(
                  color: Color(0xffF3F5F7),
                  borderRadius: BorderRadius.circular(3.w),
                  border: Border.all(
                    width: 0.5.w,
                    color: Color(0xffEBEBEB),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: EdgeInsets.only(left: 6.w,right: 6.w,top: 5.h,bottom: 2.h),
                    ),
                    Positioned(
                      right: 2.w,
                      bottom: 2.h,
                      child: Container(
                        padding: EdgeInsets.only(left: 5.w,right: 5.w,top: 1.h,bottom: 1.h),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        child: B16LocalizedTextViewCxmpra("${index+1}",b16FontSizeRvxqle: 10.sp,b16ColorDtkzma: Colors.white,b16FontWeightHncysp: FontWeight.bold,),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 8.w,),
          ),
        ),
        SizedBox(height: 10.h,),
        Row(
          children: [
            SizedBox(width: 16.w,),
            B16TapGuardViewMfwqke(
              b16ChildHnqvsa: B16AssetImageViewPzrxcu("b16_undo_icon_fjeifje",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
            ),
            SizedBox(width: 16.w,),
            B16TapGuardViewMfwqke(
              b16ChildHnqvsa: B16AssetImageViewPzrxcu("b16_redo_icon_jijfioe",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
            ),
            Spacer(),
            B16TapGuardViewMfwqke(
              b16ChildHnqvsa: Container(
                width: 140.w,
                height: 44.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff067BF2),
                  borderRadius: BorderRadius.circular(22.w),
                ),
                child: B16LocalizedTextViewCxmpra("Save",b16FontSizeRvxqle: 16.sp,b16ColorDtkzma: Colors.white,b16FontWeightHncysp: FontWeight.bold,),
              ),
            ),
            SizedBox(width: 16.w,),
          ],
        ),
        SizedBox(height: 8.h,),
        Container(
          width: double.infinity,
          height: 0.5.h,
          color: Color(0xffEBEBEB),
        ),
        SizedBox(height: 8.h,),
        Container(
          width: double.infinity,
          height: 44.h,
          padding: EdgeInsets.only(left: 16.w,right: 16.w),
          child: B16MediaPaddingViewVnyqsl(
            b16ChildQzpmwa: MasonryGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: B16PdfEditType.values.length,
              crossAxisCount: 4,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              itemBuilder: (BuildContext context, int index) {
                var type = B16PdfEditType.values[index];
                return Container(
                  width: double.infinity,
                  height: 44.h,
                  padding: EdgeInsets.all(1.5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.w),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xffFF8E71),Color(0xffA77FF1)]
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.w),
                    ),
                    child: B16AssetImageViewPzrxcu(type.icon,b16WidthDtvqpl: 28.w,b16HeightRnxkse: 28.w,),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8.h,),
      ],
    ),
  );

  _titleWidget(B16PreviewPdfControllerHqmwza b16controllerKqnvze)=>Container(
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
                b16controllerKqnvze.clickBack();
              },
              b16ChildHnqvsa: Container(
                width: 44.w,
                height: 44.h,
                alignment: Alignment.center,
                child: B16AssetImageViewPzrxcu("b16_back_icon",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
              ),
            ),
            Align(
              child: B16LocalizedTextViewCxmpra("profile.pdf",b16FontSizeRvxqle: 18.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
            ),
          ],
        ),
      ),
    ),
  );
}
