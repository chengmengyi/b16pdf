import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/material.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

enum B16PdfEditType {
  highlight('b16_highlight_icon_fjiejifde'),
  underline('b16_underline_icon_fjiefjie'),
  strikeThrough('b16_strike_through_icon_fhiejfie'),
  pen('b16_pen_icon_fjiefjie');

  final String b16IconKqnvze;
  const B16PdfEditType(this.b16IconKqnvze);
}

class B16PdfStrokeQxmvza {
  final int b16PageNumberKqnvze;
  final List<Offset> b16PointsVqntza;
  final Color b16ColorPqmwza;
  final double b16WidthHqmvza;
  const B16PdfStrokeQxmvza({
    required this.b16PageNumberKqnvze,
    required this.b16PointsVqntza,
    required this.b16ColorPqmwza,
    required this.b16WidthHqmvza,
  });
}

class B16PreviewPdfControllerHqmwza extends B16RootControllerFjesak {
  final FileToolsFileInfo b16FileInfoKqnvze =
      Get.arguments['file'] as FileToolsFileInfo;
  final GlobalKey<SfPdfViewerState> b16ViewerKeyQxmvza =
      GlobalKey<SfPdfViewerState>();
  final PdfViewerController b16ViewerControllerVqntza = PdfViewerController();
  final UndoHistoryController b16UndoControllerPqmwza = UndoHistoryController();
  final Map<int, Uint8List?> b16ThumbnailsKqnvze = <int, Uint8List?>{};
  final Map<int, Size> b16PageSizesVqmxza = <int, Size>{};
  final List<B16PdfStrokeQxmvza> b16PenStrokesHqmwza = <B16PdfStrokeQxmvza>[];
  final List<B16PdfStrokeQxmvza> b16RedoStrokesPqnvze = <B16PdfStrokeQxmvza>[];
  List<Offset> b16DraftPointsRqmwza = <Offset>[];
  B16PdfEditType? b16SelectedTypeQxmvza;
  bool b16CanLoadViewerVqntza = false;
  bool b16DocumentLoadedKqnvze = false;
  bool b16SavingPqmwza = false;
  bool b16PenPanelVisibleKqnvze = false;
  int b16PageCountHqmwza = 0;
  int b16CurrentPageVqmxza = 1;
  Color b16PenColorQxmvza = const Color(0xff067BF2);
  double b16PenWidthVqntza = 8;
  Timer? b16PenPanelTimerPqmwza;
  final List<Color> b16PenColorsHqmwza = const [
    Color(0xffF4411F),
    Color(0xff1A1D22),
    Color(0xff067BF2),
    Color(0xff23A55A),
    Color(0xffF4C542),
  ];

  String get b16FileNameRqmwza {
    if ((b16FileInfoKqnvze.name ?? '').isNotEmpty) {
      return b16FileInfoKqnvze.name!;
    }
    return (b16FileInfoKqnvze.path ?? '').split(Platform.pathSeparator).last;
  }

  bool get b16PenModeKqnvze => b16SelectedTypeQxmvza == B16PdfEditType.pen;

  @override
  void onInit() {
    super.onInit();
    b16UndoControllerPqmwza.addListener(_b16ChangedQxmvza);
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future<void>.delayed(const Duration(milliseconds: 120));
      b16CanLoadViewerVqntza = true;
      update();
    });
  }

  void _b16ChangedQxmvza() => update();
  void b16DocumentLoadedPqmwza(PdfDocumentLoadedDetails b16DetailsQxmvza) {
    b16DocumentLoadedKqnvze = true;
    b16PageCountHqmwza = b16DetailsQxmvza.document.pages.count;
    b16PageSizesVqmxza.clear();
    for (
      var b16IndexKqnvze = 0;
      b16IndexKqnvze < b16PageCountHqmwza;
      b16IndexKqnvze++
    ) {
      b16PageSizesVqmxza[b16IndexKqnvze + 1] =
          b16DetailsQxmvza.document.pages[b16IndexKqnvze].size;
    }
    update();
    _b16LoadThumbnailsVqmxza();
  }

  void b16PageChangedHqmwza(PdfPageChangedDetails b16DetailsQxmvza) {
    b16CurrentPageVqmxza = b16DetailsQxmvza.newPageNumber;
    update();
  }

  void b16SelectToolKqnvze(B16PdfEditType b16TypeQxmvza) {
    if (b16TypeQxmvza == B16PdfEditType.pen) {
      b16ClickPenRqmwza();
      return;
    }
    b16HidePenPanelKqnvze();
    b16DraftPointsRqmwza = <Offset>[];
    b16SelectedTypeQxmvza = b16SelectedTypeQxmvza == b16TypeQxmvza
        ? null
        : b16TypeQxmvza;
    b16ViewerControllerVqntza.annotationMode = switch (b16SelectedTypeQxmvza) {
      B16PdfEditType.highlight => PdfAnnotationMode.highlight,
      B16PdfEditType.underline => PdfAnnotationMode.underline,
      B16PdfEditType.strikeThrough => PdfAnnotationMode.strikethrough,
      _ => PdfAnnotationMode.none,
    };
    b16ViewerControllerVqntza.clearSelection();
    update();
  }

  void b16ClickPenRqmwza() {
    if (!b16DocumentLoadedKqnvze || b16SavingPqmwza) return;
    final b16EnablePenQxmvza = !b16PenModeKqnvze;
    b16SelectedTypeQxmvza = b16EnablePenQxmvza ? B16PdfEditType.pen : null;
    b16DraftPointsRqmwza = <Offset>[];
    b16ViewerControllerVqntza.annotationMode = PdfAnnotationMode.none;
    b16ViewerControllerVqntza.clearSelection();
    if (b16EnablePenQxmvza) {
      b16ShowPenPanelVqntza();
    } else {
      b16HidePenPanelKqnvze();
    }
    update();
  }

  void b16ShowPenPanelVqntza() {
    b16PenPanelTimerPqmwza?.cancel();
    b16PenPanelVisibleKqnvze = true;
    update();
    b16PenPanelTimerPqmwza = Timer(const Duration(seconds: 3), () {
      b16PenPanelVisibleKqnvze = false;
      update();
    });
  }

  void b16HidePenPanelKqnvze() {
    b16PenPanelTimerPqmwza?.cancel();
    b16PenPanelTimerPqmwza = null;
    b16PenPanelVisibleKqnvze = false;
  }

  void b16ChangePenColorPqmwza(Color b16ColorQxmvza) {
    b16PenColorQxmvza = b16ColorQxmvza;
    b16ShowPenPanelVqntza();
  }

  void b16ChangePenWidthHqmwza(double b16WidthQxmvza) {
    b16PenWidthVqntza = b16WidthQxmvza;
    b16ShowPenPanelVqntza();
  }

  void b16JumpToPageVqntza(int b16PageNumberKqnvze) {
    b16ViewerControllerVqntza.jumpToPage(b16PageNumberKqnvze);
    b16CurrentPageVqmxza = b16PageNumberKqnvze;
    update();
  }

  void b16StartPenQxmvza(Offset b16PointKqnvze) {
    if (!b16PenModeKqnvze || b16SavingPqmwza) return;
    b16DraftPointsRqmwza = <Offset>[b16PointKqnvze];
    update();
  }

  void b16UpdatePenVqntza(Offset b16PointKqnvze) {
    if (b16DraftPointsRqmwza.isEmpty || !b16PenModeKqnvze) return;
    b16DraftPointsRqmwza.add(b16PointKqnvze);
    update();
  }

  void b16EndPenPqmwza() {
    if (b16DraftPointsRqmwza.isEmpty) return;
    b16PenStrokesHqmwza.add(
      B16PdfStrokeQxmvza(
        b16PageNumberKqnvze: b16CurrentPageVqmxza,
        b16PointsVqntza: List<Offset>.from(b16DraftPointsRqmwza),
        b16ColorPqmwza: b16PenColorQxmvza,
        b16WidthHqmvza: b16PenWidthVqntza,
      ),
    );
    b16RedoStrokesPqnvze.clear();
    b16DraftPointsRqmwza = <Offset>[];
    update();
  }

  void clickUndo() {
    if (b16PenStrokesHqmwza.isNotEmpty) {
      b16RedoStrokesPqnvze.add(b16PenStrokesHqmwza.removeLast());
    } else {
      b16UndoControllerPqmwza.undo();
    }
    update();
  }

  void clickRedo() {
    if (b16RedoStrokesPqnvze.isNotEmpty) {
      b16PenStrokesHqmwza.add(b16RedoStrokesPqnvze.removeLast());
    } else {
      b16UndoControllerPqmwza.redo();
    }
    update();
  }

  Future<void> clickSave() async {
    if (!b16DocumentLoadedKqnvze || b16SavingPqmwza) return;
    b16SavingPqmwza = true;
    update();
    try {
      List<int> b16BytesQxmvza = await b16ViewerControllerVqntza.saveDocument();
      if (b16PenStrokesHqmwza.isNotEmpty) {
        final b16DocumentKqnvze = PdfDocument(inputBytes: b16BytesQxmvza);
        for (final b16StrokeVqntza in b16PenStrokesHqmwza) {
          if (b16StrokeVqntza.b16PageNumberKqnvze >
              b16DocumentKqnvze.pages.count) {
            continue;
          }
          final dynamic b16PagePqmwza =
              b16DocumentKqnvze.pages[b16StrokeVqntza.b16PageNumberKqnvze - 1];
          final Size b16SizeHqmwza = b16PagePqmwza.size as Size;
          final b16PathRqmwza = PdfPath();
          for (
            var b16IndexQxmvza = 1;
            b16IndexQxmvza < b16StrokeVqntza.b16PointsVqntza.length;
            b16IndexQxmvza++
          ) {
            final b16FromKqnvze =
                b16StrokeVqntza.b16PointsVqntza[b16IndexQxmvza - 1];
            final b16ToVqntza = b16StrokeVqntza.b16PointsVqntza[b16IndexQxmvza];
            b16PathRqmwza.addLine(
              Offset(
                b16FromKqnvze.dx * b16SizeHqmwza.width,
                b16FromKqnvze.dy * b16SizeHqmwza.height,
              ),
              Offset(
                b16ToVqntza.dx * b16SizeHqmwza.width,
                b16ToVqntza.dy * b16SizeHqmwza.height,
              ),
            );
          }
          b16PagePqmwza.graphics.drawPath(
            b16PathRqmwza,
            pen: PdfPen(
              PdfColor(
                (b16StrokeVqntza.b16ColorPqmwza.r * 255).round(),
                (b16StrokeVqntza.b16ColorPqmwza.g * 255).round(),
                (b16StrokeVqntza.b16ColorPqmwza.b * 255).round(),
              ),
              width:
                  (b16StrokeVqntza.b16WidthHqmvza / 800) * b16SizeHqmwza.width,
            ),
          );
        }
        b16BytesQxmvza = await b16DocumentKqnvze.save();
        b16DocumentKqnvze.dispose();
      }
      await File(
        b16FileInfoKqnvze.path!,
      ).writeAsBytes(b16BytesQxmvza, flush: true);
      b16PenStrokesHqmwza.clear();
      b16RedoStrokesPqnvze.clear();
      Fluttertoast.showToast(msg: 'Saved successfully'.tr);
    } catch (b16ErrorKqnvze) {
      Fluttertoast.showToast(msg: '$b16ErrorKqnvze');
    } finally {
      b16SavingPqmwza = false;
      update();
    }
  }

  Future<void> _b16LoadThumbnailsVqmxza() async {
    for (
      var b16PageKqnvze = 1;
      b16PageKqnvze <= b16PageCountHqmwza;
      b16PageKqnvze++
    ) {
      try {
        b16ThumbnailsKqnvze[b16PageKqnvze] =
            await FlutterPreviewFile.renderPdfPageToImageBytes(
              pdfPath: b16FileInfoKqnvze.path!,
              pageIndex: b16PageKqnvze - 1,
              width: 160,
            );
        update();
      } catch (_) {
        b16ThumbnailsKqnvze[b16PageKqnvze] = null;
      }
    }
  }

  void clickBack() => B16RoutersHepFjeifjoe.b16BackFtynwp();
  @override
  void onClose() {
    b16PenPanelTimerPqmwza?.cancel();
    b16UndoControllerPqmwza.removeListener(_b16ChangedQxmvza);
    b16UndoControllerPqmwza.dispose();
    b16ViewerControllerVqntza.dispose();
    super.onClose();
  }
}
