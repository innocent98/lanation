import 'package:flutter/material.dart';
import 'package:la_nation/screens/home/top_bar.dart';
import 'package:la_nation/widgets/custom_dialog.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class AbonnezVous extends StatelessWidget {
  const AbonnezVous({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: app_color.white,
      child: SafeArea(
          child: Scaffold(
        appBar: MyAppBar.build(context),
        backgroundColor: app_color.white,
        body: SizedBox(
          width: screenWidth,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.asset('assets/img/subcription.png'),
                  SizedBox(height: screenHeight * 0.06),
                  TextWidget(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w400,
                    text: 'Choisissez votre type d\'abonnement',
                    textColor: app_color.lightTextSoft,
                  ),
                  SizedBox(height: screenHeight * 0.035),
                  SizedBox(
                    width: screenWidth,
                    child: Wrap(
                        spacing: screenWidth * 0.02,
                        runSpacing: screenWidth * 0.02,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const Dialog(
                                    backgroundColor: app_color.white,
                                    elevation: 0,
                                    child: CustomDialog(),
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: screenWidth * 0.45,
                              height: screenHeight * 0.28,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: app_color.darkTextSoft),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgdZpEDslKnjBmPC6dlF6pf9Q2m1o5aMdHwg&usqp=CAU',
                                  width: screenWidth * 0.3,
                                  height: screenHeight * 0.3,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenWidth * 0.45,
                            height: screenHeight * 0.28,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: app_color.darkTextSoft),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgdZpEDslKnjBmPC6dlF6pf9Q2m1o5aMdHwg&usqp=CAU',
                                width: screenWidth * 0.3,
                                height: screenHeight * 0.3,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
