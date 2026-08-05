import 'package:b16pdf/b16_pages_fjeifje/b16_images_result_qxnvza/b16_images_result_controller_kqmwze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B16ImagesResultPageVqntza
    extends B16RootPageQazmtr<B16ImagesResultControllerKqmwze> {
  const B16ImagesResultPageVqntza({super.key});

  @override
  B16ImagesResultControllerKqmwze b16CreateControllerAhdwks() {
    return B16ImagesResultControllerKqmwze();
  }

  @override
  Color get b16NavigationBarColorLxqvbi => Colors.white;

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextVqmwza,
    B16ImagesResultControllerKqmwze b16ControllerKqmxve,
  ) {
    return Column(
      children: [
        _b16TitleHqmwza(b16ControllerKqmxve),
        _b16ContentKqnvze(b16ControllerKqmxve),
        _b16BottomVqntza(b16ControllerKqmxve),
      ],
    );
  }

  _b16BottomVqntza(B16ImagesResultControllerKqmwze b16controllerKqmxve)=> Container(
    width: double.infinity,
    padding: EdgeInsets.only(left: 16.w,right: 16.w),
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
        SizedBox(height: 8.h),
        SizedBox(
          height: 88.h,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, b16IndexKqnvze) {
              final b16PageVqntza = b16IndexKqnvze + 1;
              return B16TapGuardViewMfwqke(
                b16ChildHnqvsa: Container(
                  width: 72.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F5F7),
                    borderRadius: BorderRadius.circular(3.w),
                    border: Border.all(
                      width: 0.5.w,
                      color: const Color(0xffEBEBEB),
                    ),
                  ),
                  child: Stack(
                    children: [

                      Positioned(
                        right: 2.w,
                        bottom: 2.h,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 1.h,
                          ),
                          color: Colors.black54,
                          child: Text(
                            '$b16PageVqntza',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (b16ContextQxmvza, b16IndexKqnvze) => SizedBox(width: 8.w),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: (){

              },
              b16ChildHnqvsa: Container(
                width: 64.w,
                height: 64.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.w),
                  border: Border.all(
                    width: 0.5.w,
                    color: Color(0xffCFD6DC),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    B16AssetImageViewPzrxcu("b16_retake_icon_jiwodw",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
                    SizedBox(height: 4.h,),
                    B16LocalizedTextViewCxmpra("Retake",b16FontSizeRvxqle: 11.sp,b16ColorDtkzma: Color(0xff858C92),b16FontWeightHncysp: FontWeight.w500,),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w,),
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: (){

              },
              b16ChildHnqvsa: Container(
                width: 64.w,
                height: 64.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.w),
                  border: Border.all(
                    width: 0.5.w,
                    color: Color(0xffCFD6DC),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    B16AssetImageViewPzrxcu("b16_addpage_icon_dkwokow",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
                    SizedBox(height: 4.h,),
                    B16LocalizedTextViewCxmpra("Add",b16FontSizeRvxqle: 11.sp,b16ColorDtkzma: Color(0xff858C92),b16FontWeightHncysp: FontWeight.w500,),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w,),
            Expanded(
              child: B16TapGuardViewMfwqke(
                b16OnPressedJkcxwu: (){
                  b16controllerKqmxve.clickSave();
                },
                b16ChildHnqvsa: Container(
                  width: double.infinity,
                  height: 44.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff067BF2),
                    borderRadius: BorderRadius.circular(22.w),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      B16AssetImageViewPzrxcu("b16_sel_icon",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
                      SizedBox(width: 8.w),
                      B16LocalizedTextViewCxmpra("Save PDF",b16FontSizeRvxqle: 16.sp,b16ColorDtkzma: Colors.white,b16FontWeightHncysp: FontWeight.bold,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
      ],
    ),
  );

  Widget _b16ContentKqnvze(B16ImagesResultControllerKqmwze b16controllerKqmxve) => Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
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

  Widget _b16TitleHqmwza(B16ImagesResultControllerKqmwze b16controllerKqmxve) =>
      Container(
        width: double.infinity,
        color: Colors.white,
        child: SafeArea(
          top: true,
          bottom: false,
          child: SizedBox(
            height: 44.h,
            child: Stack(
              children: [
                B16TapGuardViewMfwqke(
                  b16OnPressedJkcxwu: b16controllerKqmxve.clickBack,
                  b16ChildHnqvsa: SizedBox(
                    width: 44.w,
                    height: 44.h,
                    child: Center(
                      child: B16AssetImageViewPzrxcu(
                        'b16_back_icon',
                        b16WidthDtvqpl: 24.w,
                        b16HeightRnxkse: 24.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
