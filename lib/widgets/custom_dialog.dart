import 'package:flutter/material.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                TextWidget(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                    text: 'Abonnement journal en ligne',
                    textColor: app_color.black,
                    align: TextAlign.center),
                TextWidget(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w400,
                  text:
                      'Choisissez la période de facturation de votre abonnement',
                  textColor: app_color.lightTextSoft,
                  align: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: app_color.primary),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(
                  Icons.circle,
                  size: screenWidth * 0.032,
                  color: app_color.primary,
                ),
                title: TextWidget(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w500,
                  text: '24 mois',
                  textColor: app_color.lightTextSoft,
                ),
                trailing: Container(
                  width: screenWidth * 0.25,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: app_color.primary),
                  child: TextWidget(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.w400,
                    text: 'CFA 24,000',
                    align: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: app_color.primary),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(
                  Icons.circle,
                  size: screenWidth * 0.032,
                  color: app_color.primary,
                ),
                title: TextWidget(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w500,
                  text: '24 mois',
                  textColor: app_color.lightTextSoft,
                ),
                trailing: Container(
                  width: screenWidth * 0.25,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: app_color.primary),
                  child: TextWidget(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.w400,
                    text: 'CFA 24,000',
                    align: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: app_color.primary),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(
                  Icons.circle,
                  size: screenWidth * 0.032,
                  color: app_color.primary,
                ),
                title: TextWidget(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w500,
                  text: '24 mois',
                  textColor: app_color.lightTextSoft,
                ),
                trailing: Container(
                  width: screenWidth * 0.25,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: app_color.primary),
                  child: TextWidget(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.w400,
                    text: 'CFA 24,000',
                    align: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            SizedBox(
              width: screenWidth,
              child: Row(
                children: [
                  SizedBox(
                      width: screenWidth * 0.3,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: app_color.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: TextWidget(
                            fontSize: screenWidth * 0.032,
                            fontWeight: FontWeight.w500,
                            text: 'JE M\'ABONNE'),
                      )),
                  SizedBox(width: screenWidth * 0.03),
                  SizedBox(
                      width: screenWidth * 0.3,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: app_color.white),
                        child: TextWidget(
                          fontSize: screenWidth * 0.032,
                          fontWeight: FontWeight.w500,
                          text: 'ANNULER',
                          textColor: app_color.primary,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
