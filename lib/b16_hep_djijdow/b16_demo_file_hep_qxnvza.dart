import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_preview_file/flutter_preview_file.dart';
import 'package:path_provider/path_provider.dart';

class B16DemoFileHepQxnvza {
  B16DemoFileHepQxnvza._();

  static final B16DemoFileHepQxnvza instance = B16DemoFileHepQxnvza._();

  static const String _b16DemoPdfAssetPathKqmwze = 'assets/PDF_Demo.pdf';
  static const String _b16DemoPdfFileNameVqntza = 'PDF_Demo.pdf';
  static const String _b16DemoDirectoryNamePqnvze = 'b16_demo_files';

  FileToolsFileInfo? _b16DemoPdfInfoHqmwza;

  Future<FileToolsFileInfo?> b16GetDemoPdfInfoKqnvxe() async {
    final FileToolsFileInfo? b16CachedInfoQxmvza = _b16DemoPdfInfoHqmwza;
    if (b16CachedInfoQxmvza != null &&
        File(b16CachedInfoQxmvza.path ?? '').existsSync()) {
      return b16CachedInfoQxmvza;
    }
    try {
      final File b16DemoFileVqntza = await _b16EnsureDemoPdfRqmwza();
      final FileStat b16FileStatPqnvze = await b16DemoFileVqntza.stat();
      _b16DemoPdfInfoHqmwza = FileToolsFileInfo(
        name: _b16DemoPdfFileNameVqntza,
        type: FileToolsDocumentType.pdf,
        updateTime: b16FileStatPqnvze.modified.millisecondsSinceEpoch,
        size: b16FileStatPqnvze.size,
        path: b16DemoFileVqntza.path,
      );
      return _b16DemoPdfInfoHqmwza;
    } catch (_) {
      return null;
    }
  }

  Future<File> _b16EnsureDemoPdfRqmwza() async {
    final Directory b16DocumentsDirectoryKqmwze =
        await getApplicationDocumentsDirectory();
    final Directory b16DemoDirectoryVqntza = Directory(
      '${b16DocumentsDirectoryKqmwze.path}/$_b16DemoDirectoryNamePqnvze',
    );
    if (!b16DemoDirectoryVqntza.existsSync()) {
      await b16DemoDirectoryVqntza.create(recursive: true);
    }
    final File b16DemoFileQxnvza = File(
      '${b16DemoDirectoryVqntza.path}/$_b16DemoPdfFileNameVqntza',
    );
    if (b16DemoFileQxnvza.existsSync()) {
      return b16DemoFileQxnvza;
    }
    final ByteData b16DemoBytesHqmwza = await rootBundle.load(
      _b16DemoPdfAssetPathKqmwze,
    );
    await b16DemoFileQxnvza.writeAsBytes(
      b16DemoBytesHqmwza.buffer.asUint8List(),
      flush: true,
    );
    return b16DemoFileQxnvza;
  }
}
