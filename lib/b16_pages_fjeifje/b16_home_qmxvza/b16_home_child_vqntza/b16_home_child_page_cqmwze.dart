import 'package:b16pdf/b16_hep_djijdow/b16_add_widget_hep_qxnvza/b16_add_widget_hep_kqmvze.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_child_vqntza/b16_files_list_child_fejife/b16_files_list_child_page_qxmvza.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_child_vqntza/b16_home_child_controller_rkpxwe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_child_mxkqza.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16HomeChildPageCqmwze extends B16RootChildMxkqza {
  const B16HomeChildPageCqmwze({super.key});

  @override
  State<B16HomeChildPageCqmwze> createState() => _B16HomeChildStatePqnvxa();
}

class _B16HomeChildStatePqnvxa
    extends
        B16RootChildStatePrvwlt<
          B16HomeChildControllerRkpxwe,
          B16HomeChildPageCqmwze
        > {
  @override
  B16HomeChildControllerRkpxwe b16CreateControllerNwztpi() {
    return B16HomeChildControllerRkpxwe();
  }

  @override
  Widget b16BuildContentYksuvd(
    BuildContext b16ContextHqmwza,
    B16HomeChildControllerRkpxwe b16ControllerVqmxze,
  ) {
    return GetBuilder<B16HomeChildControllerRkpxwe>(
      init: b16ControllerVqmxze,
      builder: (b16ControllerQxmvza) => Container(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          children: [
            _topWidget(b16ControllerQxmvza),
            SizedBox(height: 12.h),
            _tabWidget(b16ControllerQxmvza),
            if (b16ControllerQxmvza.b16ShowAddWidgetQxnvza)
              _addSmallWidget(b16ControllerQxmvza),
            SizedBox(height: 12.h),
            _pageWidget(b16ControllerQxmvza),
          ],
        ),
      ),
    );
  }

  _pageWidget(B16HomeChildControllerRkpxwe b16controllerVqmxze) => Expanded(
    child: PageView.builder(
      itemCount: B16FileTabTypeefie.values.length,
      controller: b16controllerVqmxze.pageController,
      onPageChanged: b16controllerVqmxze.b16PageChangedHqmwza,
      itemBuilder: (context, index) {
        return B16FilesListChildPageQxmvza(
          type: B16FileTabTypeefie.values[index],
        );
      },
    ),
  );

  _tabWidget(B16HomeChildControllerRkpxwe b16controllerVqmxze) => SizedBox(
    width: double.infinity,
    height: 36.h,
    child: ListView.separated(
      itemCount: B16FileTabTypeefie.values.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var type = B16FileTabTypeefie.values[index];
        final b16SelectedQxmvza =
            index == b16controllerVqmxze.b16SelectedTabIndexQmvnza;
        return B16TapGuardViewMfwqke(
          b16OnPressedJkcxwu: () {
            b16controllerVqmxze.clickTabItem(type);
          },
          b16ChildHnqvsa: Container(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.w),
              color: b16SelectedQxmvza ? null : Colors.white,
              gradient: b16SelectedQxmvza
                  ? LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
                    )
                  : null,
              border: Border.all(width: 1.w, color: Color(0xffEBEBEB)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                B16AssetImageViewPzrxcu(
                  b16SelectedQxmvza ? type.iconSel : type.iconUns,
                  b16WidthDtvqpl: 16.w,
                  b16HeightRnxkse: 16.w,
                ),
                SizedBox(width: 2.w),
                B16LocalizedTextViewCxmpra(
                  type.name.tr,
                  b16FontSizeRvxqle: 14.sp,
                  b16ColorDtkzma: b16SelectedQxmvza
                      ? Colors.white
                      : const Color(0xff4B5156),
                  b16FontWeightHncysp: FontWeight.bold,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(width: 8.w),
    ),
  );

  _addSmallWidget(B16HomeChildControllerRkpxwe b16controllerVqmxze) => Stack(
    alignment: Alignment.topLeft,
    children: [
      Container(
        width: double.infinity,
        height: 56.h,
        margin: EdgeInsets.only(top: 8.h),
        padding: EdgeInsets.only(left: 76.w, right: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(width: 0.5.w, color: Color(0xffEBEBEB)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xffFCF2F7), Color(0xffFEF3F6)],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: B16LocalizedTextViewCxmpra(
                "To access features instantly, add the widget!".tr,
                b16FontSizeRvxqle: 14.sp,
                b16ColorDtkzma: Colors.black,
                b16OverflowFzrxke: TextOverflow.ellipsis,
                b16MaxLinesPqmtva: 2,
              ),
            ),
            SizedBox(width: 8.w),
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: () {
                B16AddWidgetHepKqmvze.instance.showAddWidgetDialog();
              },
              b16ChildHnqvsa: Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 4.h,
                  bottom: 4.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.w),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xffFD7734), Color(0xffF73A70)],
                  ),
                ),
                child: B16LocalizedTextViewCxmpra(
                  "Grant".tr,
                  b16FontSizeRvxqle: 14.sp,
                  b16ColorDtkzma: Colors.white,
                  b16FontWeightHncysp: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 8.w),
        child: B16AssetImageViewPzrxcu(
          "b16_add_small_widget_iwiwd",
          b16WidthDtvqpl: 60.w,
          b16HeightRnxkse: 60.w,
        ),
      ),
    ],
  );

  _topWidget(B16HomeChildControllerRkpxwe b16controllerVqmxze) => SafeArea(
    top: true,
    bottom: false,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            B16LocalizedTextViewCxmpra(
              "Files".tr,
              b16FontSizeRvxqle: 28.sp,
              b16ColorDtkzma: Colors.black,
              b16FontWeightHncysp: FontWeight.bold,
            ),
            Expanded(
              child: kDebugMode
                  ? B16TapGuardViewMfwqke(
                      b16OnPressedJkcxwu: () {
                        b16controllerVqmxze.test();
                      },
                      b16ChildHnqvsa: Container(
                        width: double.infinity,
                        height: 20.h,
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Container(
          width: double.infinity,
          height: 48.h,
          padding: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
            ),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Row(
              children: [
                B16AssetImageViewPzrxcu(
                  "b16_search_fjhiefje",
                  b16WidthDtvqpl: 24.w,
                  b16HeightRnxkse: 24.w,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    enabled: true,
                    textAlign: TextAlign.left,
                    controller: b16controllerVqmxze.textEditingController,
                    textInputAction: TextInputAction.search,
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    onTap: () {},
                    decoration: InputDecoration(
                      counterText: '',
                      isCollapsed: true,
                      hintText: "Search...".tr,
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xff858C92),
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: b16controllerVqmxze.b16SearchFilesPqmxza,
                    onSubmitted: b16controllerVqmxze.b16SearchFilesPqmxza,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
