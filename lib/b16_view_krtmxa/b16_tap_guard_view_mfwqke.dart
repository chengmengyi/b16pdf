import 'package:flutter/material.dart';

class B16TapGuardViewMfwqke extends StatefulWidget {
  const B16TapGuardViewMfwqke({
    super.key,
    required this.b16ChildHnqvsa,
    this.b16OnPressedJkcxwu,
    this.b16CooldownGzpmre = const Duration(milliseconds: 800),
    this.b16BorderRadiusTvqlna,
    this.b16EnableFeedbackXrpwdo = true,
  });

  final Widget b16ChildHnqvsa;
  final VoidCallback? b16OnPressedJkcxwu;
  final Duration b16CooldownGzpmre;
  final BorderRadius? b16BorderRadiusTvqlna;
  final bool b16EnableFeedbackXrpwdo;

  @override
  State<B16TapGuardViewMfwqke> createState() => _B16TapGuardStateQzfnby();
}

class _B16TapGuardStateQzfnby extends State<B16TapGuardViewMfwqke> {
  final Stopwatch b16CooldownClockWvkmta = Stopwatch();

  void b16HandlePressedCpqzye() {
    if (b16CooldownClockWvkmta.isRunning &&
        b16CooldownClockWvkmta.elapsed < widget.b16CooldownGzpmre) {
      return;
    }
    b16CooldownClockWvkmta
      ..reset()
      ..start();
    widget.b16OnPressedJkcxwu?.call();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.b16OnPressedJkcxwu == null ? null : b16HandlePressedCpqzye,
      borderRadius: widget.b16BorderRadiusTvqlna,
      enableFeedback: widget.b16EnableFeedbackXrpwdo,
      child: widget.b16ChildHnqvsa,
    );
  }
}
