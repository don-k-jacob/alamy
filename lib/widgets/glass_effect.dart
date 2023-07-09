import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GlassEffect extends StatelessWidget {
  const GlassEffect({super.key, required this.child, this.isOval = false});
  final Widget child;
  final bool isOval;
  @override
  Widget build(BuildContext context) {
    return isOval
        ? ClipOval(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 6.0,
                sigmaY: 6.0,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  // color: Color(0xff1E1E1E),
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: child,
              ),
            ),
          )
        : ClipRect(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 6.0,
                sigmaY: 6.0,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  // color: Color(0xff1E1E1E),
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: child,
              ),
            ),
          );
  }
}
