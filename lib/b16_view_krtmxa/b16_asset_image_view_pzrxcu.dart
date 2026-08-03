import 'package:flutter/material.dart';

class B16AssetImageViewPzrxcu extends StatelessWidget {
  const B16AssetImageViewPzrxcu(
    this.b16FileNameKqmwza, {
    super.key,
    this.b16WidthDtvqpl,
    this.b16HeightRnxkse,
    this.b16FitJzpwcu,
    this.b16AlignmentLqhmvx = Alignment.center,
    this.b16TintColorYfsqwe,
    this.b16SemanticLabelCknzra,
    this.b16ExcludeSemanticsGpxtdv = false,
  });

  static const String b16AssetRootVqmwke = 'assets/b16pdf_images_fjwnsd/';

  final String b16FileNameKqmwza;
  final double? b16WidthDtvqpl;
  final double? b16HeightRnxkse;
  final BoxFit? b16FitJzpwcu;
  final AlignmentGeometry b16AlignmentLqhmvx;
  final Color? b16TintColorYfsqwe;
  final String? b16SemanticLabelCknzra;
  final bool b16ExcludeSemanticsGpxtdv;

  String get b16AssetPathHqnvta => '$b16AssetRootVqmwke$b16FileNameKqmwza.png';

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      b16AssetPathHqnvta,
      width: b16WidthDtvqpl,
      height: b16HeightRnxkse,
      fit: b16FitJzpwcu ?? BoxFit.fill,
      alignment: b16AlignmentLqhmvx,
      color: b16TintColorYfsqwe,
      semanticLabel: b16SemanticLabelCknzra,
      excludeFromSemantics: b16ExcludeSemanticsGpxtdv,
    );
  }
}
