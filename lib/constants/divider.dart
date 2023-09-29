import 'package:flutter/material.dart';
import '../constants/colors.dart' as app_color;

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: app_color.darkTextSoft,
      height: 2,
      thickness: 1,
    );
  }
}
