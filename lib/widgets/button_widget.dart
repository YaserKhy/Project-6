import 'package:flutter/material.dart';
import 'package:project6/colors/app_colors.dart';
import 'package:project6/extensions/nav.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Widget? toScreen;
  final Color? color;
  final double? width;
  const ButtonWidget({super.key, required this.title, this.toScreen, this.color, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 324,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:  WidgetStatePropertyAll<Color>(color ?? ColorSelect.brandColor),
              shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
          onPressed: toScreen != null ? () {
            context.push(screen: toScreen!);
          } : null,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          )),
    );
  }
}
