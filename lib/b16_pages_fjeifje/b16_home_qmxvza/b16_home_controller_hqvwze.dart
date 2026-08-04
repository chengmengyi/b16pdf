import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_child_vqntza/b16_home_child_page_cqmwze.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_tools_child_tqmvza/b16_tools_child_page_vqkrze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/cupertino.dart';

enum B16HomeBottomTabType {
  files('Files', 'b16_home_sel_icon_dfeife', 'b16_home_uns_icon_dhwidiw'),
  tools('Tools', 'b16_tool_sel_icon_djwijow', 'b16_tool_uns_icon_djwijow');

  const B16HomeBottomTabType(
    this.b16TextKqmvza,
    this.b16IconSelectedHqmwze,
    this.b16IconUnselectedVqnxra,
  );

  final String b16TextKqmvza;
  final String b16IconSelectedHqmwze;
  final String b16IconUnselectedVqnxra;
}

class B16HomeControllerHqvwze extends B16RootControllerFjesak {
  static const String b16TabUpdateIdPqmxve = 'b16_home_tab';

  int b16TabIndexKqmwza = 0;

  final List<Widget> b16PagesVqnxre = const [
    B16HomeChildPageCqmwze(),
    B16ToolsChildPageVqkrze(),
  ];

  void b16SelectTabHqmvze(B16HomeBottomTabType b16TabVqnxra) {
    if (b16TabIndexKqmwza == b16TabVqnxra.index) {
      return;
    }
    b16TabIndexKqmwza = b16TabVqnxra.index;
    update([b16TabUpdateIdPqmxve]);
  }
}
