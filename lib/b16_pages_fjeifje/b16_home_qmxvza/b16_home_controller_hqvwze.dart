import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_child_vqntza/b16_home_child_page_cqmwze.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_tools_child_tqmvza/b16_tools_child_page_vqkrze.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/cupertino.dart';

enum B16HomeBottomTabType{
  files("Files","b16_home_sel_icon_dfeife","b16_home_uns_icon_dhwidiw"),
  tools("Tools","b16_tool_sel_icon_djwijow","b16_tool_uns_icon_djwijow");

  final String text;
  final String iconSel;
  final String iconUns;
  const B16HomeBottomTabType(this.text,this.iconSel,this.iconUns);
}

class B16HomeControllerHqvwze extends B16RootControllerFjesak {
  var tabIndex=0;
  final List<Widget> pagesList=[
    B16HomeChildPageCqmwze(),
    B16ToolsChildPageVqkrze(),
  ];
}
