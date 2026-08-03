import 'package:flutter/material.dart';

class B16MediaPaddingViewVnyqsl extends StatelessWidget {
  const B16MediaPaddingViewVnyqsl({
    super.key,
    required this.b16ChildQzpmwa,
    this.b16RemoveTopHkvxre = true,
    this.b16RemoveBottomCjnyqu = true,
    this.b16RemoveLeftMfwzpa = true,
    this.b16RemoveRightRtdqle = true,
  });

  final Widget b16ChildQzpmwa;
  final bool b16RemoveTopHkvxre;
  final bool b16RemoveBottomCjnyqu;
  final bool b16RemoveLeftMfwzpa;
  final bool b16RemoveRightRtdqle;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: b16RemoveTopHkvxre,
      removeBottom: b16RemoveBottomCjnyqu,
      removeLeft: b16RemoveLeftMfwzpa,
      removeRight: b16RemoveRightRtdqle,
      child: b16ChildQzpmwa,
    );
  }
}
