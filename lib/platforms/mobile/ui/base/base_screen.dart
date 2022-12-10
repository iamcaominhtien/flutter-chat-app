import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onHorizontalDragStart: (details) {
        if (details.globalPosition.dx < 50) {
          Get.back();
        }
      },
    );
  }
}
