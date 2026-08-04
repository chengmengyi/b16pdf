import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_hep_fjiejizx.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:get/get.dart';

class B16DeleteFileControllerHqmwze extends B16RootControllerFjesak {
  final List<FileToolsFileInfo> b16FilesQxmvza = List<FileToolsFileInfo>.from(
    (Get.arguments?['files'] as List?) ?? const [],
  );
  final Set<String> b16SelectedPathsKqnvze = <String>{};
  bool b16IsSelectedVqmxza(FileToolsFileInfo b16FilePqnvze) =>
      b16SelectedPathsKqnvze.contains(b16FilePqnvze.path);
  void clickItem(FileToolsFileInfo b16FileHqmwza) {
    final b16PathQxmvza = b16FileHqmwza.path;
    if (b16PathQxmvza == null) return;
    b16SelectedPathsKqnvze.contains(b16PathQxmvza)
        ? b16SelectedPathsKqnvze.remove(b16PathQxmvza)
        : b16SelectedPathsKqnvze.add(b16PathQxmvza);
    update();
  }

  void b16ClickSelectAllPqmwza() {
    if (b16SelectedPathsKqnvze.length == b16FilesQxmvza.length) {
      b16SelectedPathsKqnvze.clear();
    } else {
      b16SelectedPathsKqnvze.addAll(
        b16FilesQxmvza
            .map((b16FileVqntze) => b16FileVqntze.path)
            .whereType<String>(),
      );
    }
    update();
  }

  Future<void> clickDelete() async {
    if (b16SelectedPathsKqnvze.isEmpty) return;
    for (final b16PathHqmwza in b16SelectedPathsKqnvze) {
      await FlutterPreviewFile.deleteFile(b16PathHqmwza);
    }
    B16EventHepFjiejizx.instance.b16SendMsgFjijeio(
      B16EventBeanFhifeode(b16EventCodeFhfemie: 160102),
    );
    B16RoutersHepFjeifjoe.b16BackFtynwp();
  }

  String b16FileIconKqnvze(FileToolsFileInfo b16FileQxmvza) =>
      switch (b16FileQxmvza.type) {
        FileToolsDocumentType.pdf => 'b16_pdf_logo',
        FileToolsDocumentType.excel => 'b16_excel_logo',
        _ => 'b16_word_logo',
      };
}
