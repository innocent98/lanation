import 'package:flutter/material.dart';
import 'package:la_nation/screens/settings/font_resize.dart';
import '../../constants/colors.dart' as app_color;

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 0,
      child: Container(
        color: app_color.lightTextSoft,
        child: SizedBox(
            height: screenHeight * 0.08,
            width: screenWidth,
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.035, right: screenWidth * 0.035),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: app_color.white,
                          size: screenWidth * 0.065,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_border,
                          color: app_color.white,
                          size: screenWidth * 0.065,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shortcut_sharp,
                          color: app_color.white,
                          size: screenWidth * 0.065,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FontResize()));
                        },
                        icon: Icon(
                          Icons.tune,
                          color: app_color.white,
                          size: screenWidth * 0.065,
                        )),
                  ]),
            )),
      ),
    );
  }
}
