import 'package:b16pdf/b16_dialog_fjifjie/b16_add_widget_bottom_dialog_jwiokowdw/b16_add_widget_bottom_dialog_jwiokowdw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_add_widget_plugins/flutter_add_widget_plugins.dart';
import 'package:flutter_add_widget_plugins/widget_info.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

enum AddWidgetType {
  home("Home", "b16_widget_home_icon_fjieiowd"),
  merge("Merge", "b16_widget_merge_icon_fkeofkoe"),
  import("Import", "b16_widget_import_icon_jwiiw"),
  convert("Convert", "b16_widget_convert_icon_dwidjiw");

  final String text;
  final String icon;
  const AddWidgetType(this.text, this.icon);
}

final class B16AddWidgetHepKqmvze {
  B16AddWidgetHepKqmvze._();

  static final B16AddWidgetHepKqmvze instance = B16AddWidgetHepKqmvze._();

  final List<WidgetInfo> _widgetInfoList = <WidgetInfo>[];

  Future<void> showAddWidgetDialog() async {
    var result = await B16RoutersHepFjeifjoe.b16ShowBottomSheetVxqprn<bool>(
      b16ChildQnwxza: const B16AddWidgetBottomDialogJwiokowdw(),
    );
    if(result==true){
      _addWidget();
    }
  }

  _addWidget()async{
    _initWidgetInfo();
    await FlutterAddWidgetPlugins.instance.addWidget(
      items: _widgetInfoList,
      layoutName: "b16_add_widget_layout",
    );

  }


  void _initWidgetInfo() {
    _widgetInfoList.clear();
    for (var value in AddWidgetType.values) {
      _widgetInfoList.add(
        WidgetInfo(
          icon: value.icon,
          name: value.text.tr,
          type: value.name,
        ),
      );
    }
  }
}
