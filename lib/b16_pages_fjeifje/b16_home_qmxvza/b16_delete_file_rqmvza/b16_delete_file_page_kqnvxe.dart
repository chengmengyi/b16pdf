import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_delete_file_rqmvza/b16_delete_file_controller_hqmwze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_media_padding_view_vnyqsl.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16DeleteFilePageKqnvxe
    extends B16RootPageQazmtr<B16DeleteFileControllerHqmwze> {
  const B16DeleteFilePageKqnvxe({super.key});

  @override
  B16DeleteFileControllerHqmwze b16CreateControllerAhdwks() {
    return B16DeleteFileControllerHqmwze();
  }

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextVqmxza,
    B16DeleteFileControllerHqmwze b16ControllerPqmwze,
  ) {
    return GetBuilder<B16DeleteFileControllerHqmwze>(
      init: b16ControllerPqmwze,
      builder: (b16ControllerQxmvza) => Column(
        children: [
          _titleWidget(b16ControllerQxmvza),
          _contentWidget(b16ControllerQxmvza),
        ],
      ),
    );
  }

  _contentWidget(B16DeleteFileControllerHqmwze b16controllerPqmwze) => Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(top: 8.h),
      color: Colors.white,
      child: Column(
        children: [
          _listWidget(b16controllerPqmwze),
          _bottomWidget(b16controllerPqmwze),
        ],
      ),
    ),
  );

  _listWidget(B16DeleteFileControllerHqmwze b16controllerPqmwze) => Expanded(
    child: B16MediaPaddingViewVnyqsl(
      b16ChildQzpmwa: ListView.builder(
        itemCount: b16controllerPqmwze.b16FilesQxmvza.length,
        itemBuilder: (context, index) {
          final b16FileQxmvza = b16controllerPqmwze.b16FilesQxmvza[index];
          return B16TapGuardViewMfwqke(
            b16OnPressedJkcxwu: () {
              b16controllerPqmwze.clickItem(b16FileQxmvza);
            },
            b16ChildHnqvsa: Container(
              width: double.infinity,
              height: 72.h,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Row(
                children: [
                  B16AssetImageViewPzrxcu(
                    b16controllerPqmwze.b16IsSelectedVqmxza(b16FileQxmvza)
                        ? "b16_sel_icon"
                        : "b16_uns_icon",
                    b16WidthDtvqpl: 24.w,
                    b16HeightRnxkse: 24.w,
                  ),
                  SizedBox(width: 12.w),
                  B16AssetImageViewPzrxcu(
                    b16controllerPqmwze.b16FileIconKqnvze(b16FileQxmvza),
                    b16WidthDtvqpl: 32.w,
                    b16HeightRnxkse: 32.w,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        B16LocalizedTextViewCxmpra(
                          b16FileQxmvza.name ?? '',
                          b16FontSizeRvxqle: 14.sp,
                          b16ColorDtkzma: Colors.black,
                          b16FontWeightHncysp: FontWeight.bold,
                          b16OverflowFzrxke: TextOverflow.ellipsis,
                        ),
                        B16LocalizedTextViewCxmpra(
                          _b16FileDetailPqmwza(b16FileQxmvza),
                          b16FontSizeRvxqle: 12.sp,
                          b16ColorDtkzma: Color(0xff858C92),
                          b16FontWeightHncysp: FontWeight.w500,
                          b16OverflowFzrxke: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );

  String _b16FileDetailPqmwza(FileToolsFileInfo b16FileVqntze) {
    final b16DateHqmwza = DateTime.fromMillisecondsSinceEpoch(
      b16FileVqntze.updateTime ?? 0,
    );
    final b16DateTextKqnvze =
        '${b16DateHqmwza.year}-${b16DateHqmwza.month.toString().padLeft(2, '0')}-${b16DateHqmwza.day.toString().padLeft(2, '0')}';
    final b16SizePqmxza = (b16FileVqntze.size ?? 0) / 1024 / 1024;
    return '$b16DateTextKqnvze | ${b16SizePqmxza.toStringAsFixed(1)}M';
  }


  _bottomWidget(B16DeleteFileControllerHqmwze b16controllerPqmwze) => Container(
    width: double.infinity,
    height: 60.h,
    alignment: Alignment.center,
    padding: EdgeInsets.only(left: 16.w, right: 16.w),
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
    child: B16TapGuardViewMfwqke(
      b16OnPressedJkcxwu: () {
        b16controllerPqmwze.clickDelete();
      },
      b16ChildHnqvsa: Container(
        width: double.infinity,
        height: 44.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffF4411F),
          borderRadius: BorderRadius.circular(22.w),
        ),
        child: B16LocalizedTextViewCxmpra(
          "Delete".tr,
          b16FontSizeRvxqle: 16.sp,
          b16ColorDtkzma: Colors.white,
          b16FontWeightHncysp: FontWeight.bold,
        ),
      ),
    ),
  );

  _titleWidget(B16DeleteFileControllerHqmwze b16controllerPqmwze) => Container(
    width: double.infinity,
    color: Colors.white,
    child: SafeArea(
      top: true,
      bottom: false,
      child: Container(
        width: double.infinity,
        height: 44.h,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Row(
          children: [
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: () {
                B16RoutersHepFjeifjoe.b16BackWithExitAdPqnvze<void>();
              },
              b16ChildHnqvsa: B16LocalizedTextViewCxmpra(
                "Cancel".tr,
                b16FontSizeRvxqle: 16.sp,
                b16ColorDtkzma: Color(0xff4B5156),
                b16FontWeightHncysp: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: B16LocalizedTextViewCxmpra(
                '{n} Selected'.tr.replaceAll(
                  '{n}',
                  b16controllerPqmwze.b16SelectedPathsKqnvze.length.toString(),
                ),
                b16FontSizeRvxqle: 18.sp,
                b16ColorDtkzma: Color(0xff060E23),
                b16FontWeightHncysp: FontWeight.bold,
              ),
            ),
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: b16controllerPqmwze.b16ClickSelectAllPqmwza,
              b16ChildHnqvsa: B16LocalizedTextViewCxmpra(
                "Select All".tr,
                b16FontSizeRvxqle: 16.sp,
                b16ColorDtkzma: Color(0xff067BF2),
                b16FontWeightHncysp: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
