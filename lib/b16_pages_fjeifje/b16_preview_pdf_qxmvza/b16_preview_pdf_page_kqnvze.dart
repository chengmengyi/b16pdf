import 'dart:typed_data';

import 'package:b16pdf/b16_pages_fjeifje/b16_preview_pdf_qxmvza/b16_preview_pdf_controller_hqmwza.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_page_qazmtr.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_asset_image_view_pzrxcu.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_localized_text_view_cxmpra.dart';
import 'package:b16pdf/b16_view_krtmxa/b16_tap_guard_view_mfwqke.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
  ) => GetBuilder<B16PreviewPdfControllerHqmwza>(
    init: b16ControllerKqnvze,
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
    B16PreviewPdfControllerHqmwza b16ControllerQxmvza,
  ) => Expanded(
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
      child: !b16ControllerQxmvza.b16CanLoadViewerVqntza
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                PdfFileView(
                  filePath: b16ControllerQxmvza.b16FileInfoKqnvze.path ?? '',
                  viewerKey: b16ControllerQxmvza.b16ViewerKeyQxmvza,
                  controller: b16ControllerQxmvza.b16ViewerControllerVqntza,
                  undoController: b16ControllerQxmvza.b16UndoControllerPqmwza,
                  canShowTextSelectionMenu: false,
                  pageLayoutMode: PdfPageLayoutMode.single,
                  onDocumentLoaded: b16ControllerQxmvza.b16DocumentLoadedPqmwza,
                  onPageChanged: b16ControllerQxmvza.b16PageChangedHqmwza,
                  loadingBuilder: (_) =>
                      const Center(child: CircularProgressIndicator()),
                  messageBuilder: (_, b16MessageQxmvza) => Center(
                    child: B16LocalizedTextViewCxmpra('Preview unavailable'.tr),
                  ),
                ),
                Positioned.fill(
                  child: LayoutBuilder(
                    builder: (b16ContextKqnvze, b16ConstraintsVqntza) =>
                        IgnorePointer(
                          ignoring: !b16ControllerQxmvza.b16PenModeKqnvze,
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onPanStart: (b16DetailsPqmwza) =>
                                b16ControllerQxmvza.b16StartPenQxmvza(
                                  _b16NormalizeHqmwza(
                                    b16DetailsPqmwza.localPosition,
                                    b16ConstraintsVqntza.biggest,
                                  ),
                                ),
                            onPanUpdate: (b16DetailsPqmwza) =>
                                b16ControllerQxmvza.b16UpdatePenVqntza(
                                  _b16NormalizeHqmwza(
                                    b16DetailsPqmwza.localPosition,
                                    b16ConstraintsVqntza.biggest,
                                  ),
                                ),
                            onPanEnd: (_) =>
                                b16ControllerQxmvza.b16EndPenPqmwza(),
                            child: CustomPaint(
                              painter: _B16PdfPenPainterKqnvze(
                                strokes: b16ControllerQxmvza.b16PenStrokesHqmwza
                                    .where(
                                      (b16StrokeQxmvza) =>
                                          b16StrokeQxmvza.b16PageNumberKqnvze ==
                                          b16ControllerQxmvza
                                              .b16CurrentPageVqmxza,
                                    )
                                    .toList(),
                                draft: b16ControllerQxmvza.b16DraftPointsRqmwza,
                                draftColor:
                                    b16ControllerQxmvza.b16PenColorQxmvza,
                                draftWidth:
                                    b16ControllerQxmvza.b16PenWidthVqntza,
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _b16PenPanelPqmwza(b16ControllerQxmvza),
                ),
              ],
            ),
    ),
  );

  Offset _b16NormalizeHqmwza(Offset b16PointQxmvza, Size b16SizeKqnvze) =>
      Offset(
        (b16PointQxmvza.dx / b16SizeKqnvze.width).clamp(0, 1),
        (b16PointQxmvza.dy / b16SizeKqnvze.height).clamp(0, 1),
      );

  Widget _b16BottomVqntza(
    B16PreviewPdfControllerHqmwza b16ControllerQxmvza,
  ) => Container(
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
        SizedBox(height: 8.h),
        SizedBox(
          height: 88.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: b16ControllerQxmvza.b16PageCountHqmwza,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, b16IndexKqnvze) {
              final b16PageVqntza = b16IndexKqnvze + 1;
              final Uint8List? b16BytesPqmwza =
                  b16ControllerQxmvza.b16ThumbnailsKqnvze[b16PageVqntza];
              return B16TapGuardViewMfwqke(
                b16OnPressedJkcxwu: () =>
                    b16ControllerQxmvza.b16JumpToPageVqntza(b16PageVqntza),
                b16ChildHnqvsa: Container(
                  width: 72.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F5F7),
                    borderRadius: BorderRadius.circular(3.w),
                    border: Border.all(
                      width:
                          b16PageVqntza ==
                              b16ControllerQxmvza.b16CurrentPageVqmxza
                          ? 2.w
                          : 0.5.w,
                      color:
                          b16PageVqntza ==
                              b16ControllerQxmvza.b16CurrentPageVqmxza
                          ? const Color(0xff067BF2)
                          : const Color(0xffEBEBEB),
                    ),
                  ),
                  child: Stack(
                    children: [
                      if (b16BytesPqmwza != null)
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.all(4.w),
                            child: Image.memory(
                              b16BytesPqmwza,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
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
            separatorBuilder: (b16ContextQxmvza, b16IndexKqnvze) =>
                SizedBox(width: 8.w),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            SizedBox(width: 16.w),
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: b16ControllerQxmvza.clickUndo,
              b16ChildHnqvsa: B16AssetImageViewPzrxcu(
                'b16_undo_icon_fjeifje',
                b16WidthDtvqpl: 24.w,
                b16HeightRnxkse: 24.w,
              ),
            ),
            SizedBox(width: 16.w),
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: b16ControllerQxmvza.clickRedo,
              b16ChildHnqvsa: B16AssetImageViewPzrxcu(
                'b16_redo_icon_jijfioe',
                b16WidthDtvqpl: 24.w,
                b16HeightRnxkse: 24.w,
              ),
            ),
            const Spacer(),
            B16TapGuardViewMfwqke(
              b16OnPressedJkcxwu: b16ControllerQxmvza.clickSave,
              b16ChildHnqvsa: Container(
                width: 140.w,
                height: 44.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xff067BF2),
                  borderRadius: BorderRadius.circular(22.w),
                ),
                child: B16LocalizedTextViewCxmpra(
                  b16ControllerQxmvza.b16SavingPqmwza
                      ? 'Saving...'.tr
                      : 'Save'.tr,
                  b16FontSizeRvxqle: 16.sp,
                  b16ColorDtkzma: Colors.white,
                  b16FontWeightHncysp: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 16.w),
          ],
        ),
        SizedBox(height: 8.h),
        const Divider(height: 0.5),
        SizedBox(height: 8.h),
        SizedBox(
          height: 44.h,
          child: Row(
            children: B16PdfEditType.values.map((b16TypeKqnvze) {
              final b16SelectedVqntza =
                  b16TypeKqnvze == b16ControllerQxmvza.b16SelectedTypeQxmvza;
              return Expanded(
                child: B16TapGuardViewMfwqke(
                  b16OnPressedJkcxwu: () =>
                      b16ControllerQxmvza.b16SelectToolKqnvze(b16TypeKqnvze),
                  b16ChildHnqvsa: Container(
                    height: 44.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    padding: EdgeInsets.all(1.5.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22.w),
                      gradient: b16SelectedVqntza
                          ? const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xffFF8E71), Color(0xffA77FF1)],
                            )
                          : null,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22.w),
                      ),
                      child: B16AssetImageViewPzrxcu(
                        b16TypeKqnvze.b16IconKqnvze,
                        b16WidthDtvqpl: 28.w,
                        b16HeightRnxkse: 28.w,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    ),
  );

  Widget _b16TitleHqmwza(B16PreviewPdfControllerHqmwza b16ControllerQxmvza) =>
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
                      b16ControllerQxmvza.b16FileNameRqmwza,
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

  Widget _b16PenPanelPqmwza(
    B16PreviewPdfControllerHqmwza b16ControllerQxmvza,
  ) => IgnorePointer(
    ignoring: !b16ControllerQxmvza.b16PenPanelVisibleKqnvze,
    child: AnimatedOpacity(
      duration: const Duration(milliseconds: 260),
      opacity: b16ControllerQxmvza.b16PenPanelVisibleKqnvze ? 1 : 0,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 260),
        offset: b16ControllerQxmvza.b16PenPanelVisibleKqnvze
            ? Offset.zero
            : const Offset(0, 0.12),
        child: Container(
          margin: EdgeInsets.fromLTRB(8.w, 0, 8.w, 8.h),
          padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w),
            border: Border.all(color: const Color(0xffE7EAEB)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 18.w,
                offset: Offset(0, 6.h),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  B16LocalizedTextViewCxmpra(
                    'Color'.tr,
                    b16FontSizeRvxqle: 12.sp,
                    b16ColorDtkzma: const Color(0xff1A1D22),
                    b16FontWeightHncysp: FontWeight.bold,
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: b16ControllerQxmvza.b16PenColorsHqmwza
                          .map(
                            (b16ColorKqnvze) => B16TapGuardViewMfwqke(
                              b16OnPressedJkcxwu: () => b16ControllerQxmvza
                                  .b16ChangePenColorPqmwza(b16ColorKqnvze),
                              b16ChildHnqvsa: Container(
                                width: 24.w,
                                height: 24.w,
                                decoration: BoxDecoration(
                                  color: b16ColorKqnvze,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width:
                                        b16ColorKqnvze ==
                                            b16ControllerQxmvza
                                                .b16PenColorQxmvza
                                        ? 3.w
                                        : 1.w,
                                    color:
                                        b16ColorKqnvze ==
                                            b16ControllerQxmvza
                                                .b16PenColorQxmvza
                                        ? const Color(0xff1A1D22)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  B16LocalizedTextViewCxmpra(
                    'Width'.tr,
                    b16FontSizeRvxqle: 12.sp,
                    b16ColorDtkzma: const Color(0xff1A1D22),
                    b16FontWeightHncysp: FontWeight.bold,
                  ),
                  Expanded(
                    child: Slider(
                      value: b16ControllerQxmvza.b16PenWidthVqntza,
                      min: 2,
                      max: 30,
                      activeColor: b16ControllerQxmvza.b16PenColorQxmvza,
                      onChanged: b16ControllerQxmvza.b16ChangePenWidthHqmwza,
                    ),
                  ),
                  SizedBox(
                    width: 26.w,
                    child: B16LocalizedTextViewCxmpra(
                      b16ControllerQxmvza.b16PenWidthVqntza.toStringAsFixed(0),
                      b16FontSizeRvxqle: 12.sp,
                      b16ColorDtkzma: const Color(0xff858C92),
                      b16TextAlignJkwzdu: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class _B16PdfPenPainterKqnvze extends CustomPainter {
  final List<B16PdfStrokeQxmvza> strokes;
  final List<Offset> draft;
  final Color draftColor;
  final double draftWidth;
  const _B16PdfPenPainterKqnvze({
    required this.strokes,
    required this.draft,
    required this.draftColor,
    required this.draftWidth,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final b16StrokeEntriesQxmvza =
        <({List<Offset> points, Color color, double width})>[
          ...strokes.map(
            (b16ItemVqntza) => (
              points: b16ItemVqntza.b16PointsVqntza,
              color: b16ItemVqntza.b16ColorPqmwza,
              width: b16ItemVqntza.b16WidthHqmvza,
            ),
          ),
          (points: draft, color: draftColor, width: draftWidth),
        ];
    for (final b16EntryKqnvze in b16StrokeEntriesQxmvza) {
      final b16StrokeKqnvze = b16EntryKqnvze.points;
      if (b16StrokeKqnvze.length < 2) continue;
      final b16PaintQxmvza = Paint()
        ..color = b16EntryKqnvze.color
        ..strokeWidth = b16EntryKqnvze.width
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;
      final b16PathPqmwza = Path()
        ..moveTo(
          b16StrokeKqnvze.first.dx * size.width,
          b16StrokeKqnvze.first.dy * size.height,
        );
      for (final b16PointHqmwza in b16StrokeKqnvze.skip(1)) {
        b16PathPqmwza.lineTo(
          b16PointHqmwza.dx * size.width,
          b16PointHqmwza.dy * size.height,
        );
      }
      canvas.drawPath(b16PathPqmwza, b16PaintQxmvza);
    }
  }

  @override
  bool shouldRepaint(covariant _B16PdfPenPainterKqnvze oldDelegate) => true;
}
