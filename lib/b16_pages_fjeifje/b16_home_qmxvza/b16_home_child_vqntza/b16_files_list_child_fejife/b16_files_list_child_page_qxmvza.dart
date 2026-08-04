import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_child_vqntza/b16_files_list_child_fejife/b16_files_list_child_controller_hqmwze.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_child_vqntza/b16_home_child_controller_rkpxwe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_child_mxkqza.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_media_padding_view_vnyqsl.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_refresh_view_dkgwta.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B16FilesListChildPageQxmvza extends B16RootChildMxkqza {
  B16FileTabTypeefie type;
  B16FilesListChildPageQxmvza({
    super.key,
    required this.type,
  });

  @override
  State<B16FilesListChildPageQxmvza> createState() =>
      _B16FilesListChildStateVqnxre();
}

class _B16FilesListChildStateVqnxre
    extends
        B16RootChildStatePrvwlt<
          B16FilesListChildControllerHqmwze,
          B16FilesListChildPageQxmvza
        > {
  @override
  B16FilesListChildControllerHqmwze b16CreateControllerNwztpi() {
    return B16FilesListChildControllerHqmwze(type: widget.type);
  }

  @override
  Widget b16BuildContentYksuvd(
    BuildContext b16ContextKqmwza,
    B16FilesListChildControllerHqmwze b16ControllerVqnxre,
  ) {
    return Column(
      children: [
        _sortWidget(b16ControllerVqnxre),
        SizedBox(height: 8.h,),
        _contentWidget(b16ControllerVqnxre),
      ],
    );
  }

  _sortWidget(B16FilesListChildControllerHqmwze b16controllerVqnxre)=>Row(
    children: [
      Expanded(
        child: B16LocalizedTextViewCxmpra("Local Storage",b16FontSizeRvxqle: 18.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,b16OverflowFzrxke: TextOverflow.ellipsis,),
      ),
      SizedBox(width: 8.w,),
      B16TapGuardViewMfwqke(
        b16OnPressedJkcxwu: (){
          b16controllerVqnxre.clickSort();
        },
        b16ChildHnqvsa: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            B16AssetImageViewPzrxcu("b16_sort_fdwjidjow",b16WidthDtvqpl: 20.w,b16HeightRnxkse: 20.w,),
            SizedBox(width: 4.w,),
            B16LocalizedTextViewCxmpra("Sort",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Color(0xff858C92),b16FontWeightHncysp: FontWeight.w500,),
          ],
        ),
      ),
      SizedBox(width: 12.w,),
      B16TapGuardViewMfwqke(
        b16OnPressedJkcxwu: (){
          b16controllerVqnxre.clickDeleteFile();
        },
        b16ChildHnqvsa: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            B16AssetImageViewPzrxcu("b16_select_fjeifjie",b16WidthDtvqpl: 20.w,b16HeightRnxkse: 20.w,),
            SizedBox(width: 4.w,),
            B16LocalizedTextViewCxmpra("Select",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Color(0xff858C92),b16FontWeightHncysp: FontWeight.w500,),
          ],
        ),
      ),
    ],
  );

  _contentWidget(B16FilesListChildControllerHqmwze b16controllerVqnxre)=> Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(
          width: 0.5.w,
          color: Color(0xffEBEBEB),
        ),
      ),
      child: _listViewWidget(b16controllerVqnxre),
    ),
  );

  _listViewWidget(B16FilesListChildControllerHqmwze b16controllerVqnxre)=>B16MediaPaddingViewVnyqsl(
    b16ChildQzpmwa: B16RefreshViewDkgwta(
      b16EnableLoadMoreNpkxvu: false,
      b16ControllerXqmvta: b16controllerVqnxre.refreshController,
      b16ChildJkznwe: ListView.separated(
        itemCount: 10,
        itemBuilder: (context,index){
          return Container(
            width: double.infinity,
            height: 72.h,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16.w,right: 16.w),
            child: Row(
              children: [
                B16AssetImageViewPzrxcu("b16_word_logo",b16WidthDtvqpl: 32.w,b16HeightRnxkse: 32.w,),
                SizedBox(width: 12.w,),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      B16LocalizedTextViewCxmpra("Meeting Minutes.docx",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,b16OverflowFzrxke: TextOverflow.ellipsis,),
                      B16LocalizedTextViewCxmpra("2026-01-06｜1.2M",b16FontSizeRvxqle: 12.sp,b16ColorDtkzma: Color(0xff858C92),b16FontWeightHncysp: FontWeight.w500,b16OverflowFzrxke: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
                SizedBox(width: 12.w,),
                B16AssetImageViewPzrxcu("b16_more_icon_fjioewjfoe",b16WidthDtvqpl: 24.w,b16HeightRnxkse: 24.w,),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Container(
          width: double.infinity,
          height: 0.5.h,
          color: Color(0xffEBEBEB),
        ),
      ),
    ),
  );

  _noPermissionWidget()=>Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      B16AssetImageViewPzrxcu("b16_lock_fjeifje",b16WidthDtvqpl: 80.w,b16HeightRnxkse: 80.w,),
      SizedBox(height: 16.h,),
      B16LocalizedTextViewCxmpra("No permissions granted",b16FontSizeRvxqle: 20.sp,b16ColorDtkzma: Colors.black,b16FontWeightHncysp: FontWeight.bold,),
      SizedBox(height: 6.h,),
      B16LocalizedTextViewCxmpra("Permission is required to access all files",b16FontSizeRvxqle: 14.sp,b16ColorDtkzma: Color(0xff4B5156),),
      SizedBox(height: 40.h,),
      Container(
        width: double.infinity,
        height: 48.h,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 24.w,right: 24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.w),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xffFF8E71),Color(0xffA77FF1)],
          ),
        ),
        child: B16LocalizedTextViewCxmpra("Go to settings",b16FontSizeRvxqle: 16.sp,b16ColorDtkzma: Colors.white,b16FontWeightHncysp: FontWeight.bold,),
      ),
    ],
  );
}
