import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

class AppBarBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AppBarBackButton({this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? Get.back,
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color(0xfff2f2f2),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            TablerIcons.chevron_left,
          ),
        ),
      ),
    );
  }
}
