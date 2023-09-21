import 'package:flutter/material.dart';
import 'package:la_nation/screens/home/tab_item.dart';
import 'package:la_nation/screens/home/top_bar.dart';
import '../../constants/colors.dart' as app_color;

class TabHolder extends StatelessWidget {
  const TabHolder({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        color: app_color.lightBackground,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: app_color.lightBackground,
            appBar: MyAppBar.build(context),
            body: SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: const TabItem(),
            ),
          ),
        ));
  }
}
