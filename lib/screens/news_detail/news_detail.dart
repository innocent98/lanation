import 'package:flutter/material.dart';
import 'package:la_nation/screens/news_detail/bottom_navigation.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class NewsDetail extends StatelessWidget {
  const NewsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: app_color.white,
      child: SafeArea(
          child: Scaffold(
              backgroundColor: app_color.white,
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.03,
                          screenWidth * 0.03,
                          screenWidth * 0.03,
                          screenWidth * 0.25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                color: app_color.primary,
                                size: screenWidth * 0.03,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              TextWidget(
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.w600,
                                text: 'SPORTS',
                                textColor: app_color.primary,
                              ),
                            ],
                          ),
                          TextWidget(
                            fontSize: screenWidth * 0.032,
                            fontWeight: FontWeight.w400,
                            text: 'Auteur: Radji Mubarak',
                            textColor: app_color.lightTextSoft,
                          ),
                          SizedBox(
                            height: screenHeight * 0.06,
                          ),
                          TextWidget(
                            fontSize: screenWidth * 0.055,
                            fontWeight: FontWeight.w700,
                            text:
                                'Mort de Pelé : les ambiguïtés politiques du « roi » du football, loin des terrains',
                            textColor: app_color.darkBackground,
                          ),
                          TextWidget(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.w500,
                            text: 'Le 29 Decembre 2022 à 9H35',
                            textColor: app_color.lightTextSoft,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                color: app_color.darkBackground,
                                size: screenWidth * 0.03,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              TextWidget(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w500,
                                text: 'Le 29 Decembre 2022 à 9H35',
                                textColor: app_color.lightTextSoft,
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.06),
                          TextWidget(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w500,
                            text:
                                'Le Brésilien, mort le 29 décembre 2022, a souvent été critiqué, pendant et après sa carrière, pour sa proximité avec des figures du pouvoir autoritaire et pour son affairisme. Ministre des sports de 1995 à 1999, il a même un temps caressé l’espoir d’être élu à la présidence.',
                            textColor: app_color.darkBackground,
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Image.network(
                            'https://cdn.shopify.com/s/files/1/0850/2114/files/tips_to_help_heighten_senses_480x480.png?v=1624399167',
                            height: screenHeight * 0.3,
                            width: screenWidth,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          TextWidget(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w500,
                            text:
                                'Le Brésilien, mort le 29 décembre 2022, a souvent été critiqué, pendant et après sa carrière, pour sa proximité avec des figures du pouvoir autoritaire et pour son affairisme. Ministre des sports de 1995 à 1999, il a même un temps caressé l’espoir d’être élu à la présidence.',
                            textColor: app_color.darkBackground,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const BottomNavigation()
                ],
              ))),
    );
  }
}
