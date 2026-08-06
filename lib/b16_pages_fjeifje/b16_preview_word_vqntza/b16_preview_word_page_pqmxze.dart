import 'dart:io';

import 'package:b16pdf/b16_pages_fjeifje/b16_preview_word_vqntza/b16_preview_word_controller_cqnvra.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class B16PreviewWordPagePqmxze
    extends B16RootPageQazmtr<B16PreviewWordControllerCqnvra> {
  const B16PreviewWordPagePqmxze({super.key});
  @override
  B16PreviewWordControllerCqnvra b16CreateControllerAhdwks() => B16PreviewWordControllerCqnvra();

  @override
  Color get b16NavigationBarColorLxqvbi => Colors.white;

  @override
  Future<bool> b16AllowRoutePopYmejcu(B16PreviewWordControllerCqnvra b16ControllerTbnyui) async{
    b16ControllerTbnyui.clickBack();
    return false;
  }

  @override
  Widget b16BuildContentRuznxe(
    BuildContext b16ContextVqntza,
    B16PreviewWordControllerCqnvra b16ControllerPqmxze,
  ) => GetBuilder<B16PreviewWordControllerCqnvra>(
    init: b16ControllerPqmxze,
    global: false,
    builder: (b16ControllerQxmvza) => Column(
      children: [
        _b16TitleHqmwza(b16ControllerQxmvza),
        _b16ContentKqnvze(b16ControllerQxmvza),
        _b16BottomVqntza(b16ControllerQxmvza),
      ],
    ),
  );

  Widget _b16ContentKqnvze(
    B16PreviewWordControllerCqnvra b16ControllerQxmvza,
  ) => Expanded(
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
      child: !b16ControllerQxmvza.b16CanLoadViewerVqntza
          ? const Center(child: CircularProgressIndicator())
          : WordFileView(
              controller: b16ControllerQxmvza.b16WordControllerKqnvze,
              autoInitialize: false,
              loadingBuilder: (_) =>
                  const Center(child: CircularProgressIndicator()),
              messageBuilder: (_, b16MessagePqmxza) => Center(
                child: B16LocalizedTextViewCxmpra(
                  File(
                        b16ControllerQxmvza.b16FileInfoPqmxze.path ?? '',
                      ).existsSync()
                      ? 'Preview unavailable'.tr
                      : 'File not found'.tr,
                ),
              ),
            ),
    ),
  );

  Widget _b16BottomVqntza(B16PreviewWordControllerCqnvra b16ControllerQxmvza) =>
      Padding(
        padding: EdgeInsets.all(8.w),
        child: Row(
          children: [
            Expanded(
              child: _b16ActionPqmwza(
                text: b16ControllerQxmvza.b16IsSavingRqmwza
                    ? 'Saving...'.tr
                    : (b16ControllerQxmvza.b16IsEditingQxmvza
                          ? 'Cancel'.tr
                          : 'Edit'.tr),
                onTap: b16ControllerQxmvza.clickEdit,
                color: b16ControllerQxmvza.b16IsEditingQxmvza
                    ? const Color(0xff858C92)
                    : const Color(0xff067BF2),
              ),
            ),
            if (b16ControllerQxmvza.b16IsEditingQxmvza) SizedBox(width: 8.w),
            if (b16ControllerQxmvza.b16IsEditingQxmvza)
              Expanded(
                child: _b16ActionPqmwza(
                  text: b16ControllerQxmvza.b16IsSavingRqmwza
                      ? 'Saving...'.tr
                      : 'Save'.tr,
                  onTap: b16ControllerQxmvza.clickSave,
                  color: const Color(0xff067BF2),
                ),
              ),
          ],
        ),
      );
  Widget _b16ActionPqmwza({
    required String text,
    required VoidCallback onTap,
    required Color color,
  }) => B16TapGuardViewMfwqke(
    b16OnPressedJkcxwu: onTap,
    b16ChildHnqvsa: Container(
      height: 44.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22.w),
      ),
      child: B16LocalizedTextViewCxmpra(
        text,
        b16FontSizeRvxqle: 16.sp,
        b16ColorDtkzma: Colors.white,
        b16FontWeightHncysp: FontWeight.bold,
      ),
    ),
  );
  Widget _b16TitleHqmwza(B16PreviewWordControllerCqnvra b16ControllerQxmvza) =>
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
                  b16OnPressedJkcxwu: b16ControllerQxmvza.clickBack,
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
                Align(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 52.w),
                    child: B16LocalizedTextViewCxmpra(
                      b16ControllerQxmvza.b16FileNameHqmwza,
                      b16FontSizeRvxqle: 18.sp,
                      b16ColorDtkzma: Colors.black,
                      b16FontWeightHncysp: FontWeight.bold,
                      b16OverflowFzrxke: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
