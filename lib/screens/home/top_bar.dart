import 'package:flutter/material.dart';
import 'package:la_nation/screens/abonez_vous/abonnez_vous.dart';
import 'package:la_nation/screens/sidebar/sidebar.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class MyAppBar {
  static AppBar build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: Image.asset('assets/img/logo.png'),
        ),
        leadingWidth: screenWidth * 0.3,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.04, top: 5),
            child: Row(
              children: [
                FilledButton(
                    style: FilledButton.styleFrom(
                        backgroundColor: app_color.red,
                        elevation: 0,
                        shadowColor: app_color.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AbonnezVous()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w600,
                                text: 'Abonnez vous',
                                textColor: app_color.white),
                            Icon(
                              Icons.shopping_cart,
                              size: screenWidth * 0.04,
                            )
                          ],
                        ),
                        TextWidget(
                            fontSize: screenWidth * 0.025,
                            fontWeight: FontWeight.w500,
                            text: 'A partir de 200f',
                            textColor: app_color.white)
                      ],
                    )),
                SizedBox(
                  width: screenWidth * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SideBar()));
                  },
                  child: ImageIcon(
                    const AssetImage('assets/img/menuw.png'),
                    color: app_color.primary,
                    size: screenWidth * 0.07,
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
