import 'package:flutter/material.dart';

class RectangleContainer extends StatelessWidget {
  const RectangleContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white54, width: 2),
      ),
      child: child,
    );
  }
}
