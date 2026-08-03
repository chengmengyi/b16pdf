import 'package:flutter/material.dart';
import 'package:get/get.dart';

class B16LocalizedTextViewCxmpra extends StatelessWidget {
  const B16LocalizedTextViewCxmpra(
    this.b16ValueQzkmta, {
    super.key,
    this.b16TranslateVnhxre = false,
    this.b16StyleGqpwcu,
    this.b16ColorDtkzma,
    this.b16FontSizeRvxqle,
    this.b16FontWeightHncysp,
    this.b16TextAlignJkwzdu,
    this.b16MaxLinesPqmtva,
    this.b16OverflowFzrxke,
    this.b16SoftWrapCvnqwy,
    this.b16Decorationfefjie,
  });

  final String b16ValueQzkmta;
  final bool b16TranslateVnhxre;
  final TextStyle? b16StyleGqpwcu;
  final Color? b16ColorDtkzma;
  final double? b16FontSizeRvxqle;
  final FontWeight? b16FontWeightHncysp;
  final TextAlign? b16TextAlignJkwzdu;
  final int? b16MaxLinesPqmtva;
  final TextOverflow? b16OverflowFzrxke;
  final bool? b16SoftWrapCvnqwy;
  final TextDecoration? b16Decorationfefjie;

  @override
  Widget build(BuildContext context) {
    final TextStyle b16ResolvedStyleLqwxne =
        (b16StyleGqpwcu ?? const TextStyle()).copyWith(
          color: b16ColorDtkzma,
          fontSize: b16FontSizeRvxqle,
          fontWeight: b16FontWeightHncysp,
          decoration: b16Decorationfefjie,
          decorationColor: b16ColorDtkzma,
        );
    return Text(
      b16TranslateVnhxre ? b16ValueQzkmta.tr : b16ValueQzkmta,
      textAlign: b16TextAlignJkwzdu,
      maxLines: b16MaxLinesPqmtva,
      overflow: b16OverflowFzrxke,
      softWrap: b16SoftWrapCvnqwy,
      style: b16ResolvedStyleLqwxne,
    );
  }
}
