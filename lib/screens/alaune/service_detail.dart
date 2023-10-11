import 'package:flutter/material.dart';
import 'package:la_nation/widgets/button.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class ServiceDetail extends StatefulWidget {
  const ServiceDetail({super.key});

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: app_color.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://media.istockphoto.com/id/1146517111/photo/taj-mahal-mausoleum-in-agra.jpg?s=612x612&w=0&k=20&c=vcIjhwUrNyjoKbGbAQ5sOcEzDUgOfCsm9ySmJ8gNeRk=',
                width: screenWidth,
                height: screenHeight * 0.4,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w600,
                      text: 'Product Title',
                      textColor: app_color.darkBackground,
                    ),
                    TextWidget(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w400,
                      text: 'Prix unitaire: FCFA 10 000',
                      textColor: app_color.black,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    SizedBox(
                      width: screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextWidget(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w500,
                            text: 'Quantite',
                            textColor: app_color.darkBackground,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: _decrementCounter,
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  foregroundColor: app_color.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    side: const BorderSide(
                                        width: 2, color: app_color.primary),
                                  ),
                                ),
                                child: TextWidget(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w600,
                                  text: '-',
                                  textColor: app_color.darkBackground,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              TextWidget(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.w600,
                                text: _counter.toString(),
                                textColor: app_color.darkBackground,
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              TextButton(
                                onPressed: _incrementCounter,
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  foregroundColor: app_color.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2),
                                    side: const BorderSide(
                                        width: 2, color: app_color.primary),
                                  ),
                                ),
                                child: TextWidget(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w600,
                                  text: '+',
                                  textColor: app_color.darkBackground,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          TextWidget(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w400,
                            text: 'Total a payer',
                            textColor: app_color.darkBackground,
                          ),
                          TextWidget(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w600,
                            text: 'FCFA 30 000',
                            textColor: app_color.primary,
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          SizedBox(
                            width: screenWidth * 0.6,
                            child: Button(
                              buttonColor: app_color.primary,
                              buttonText: 'PAYER',
                              textColor: app_color.white,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    TextWidget(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w500,
                      text: 'Description du produit',
                      textColor: app_color.darkBackground,
                    ),
                    TextWidget(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w400,
                      text:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic',
                      textColor: app_color.darkBackground,
                    ),
                    SizedBox(height: screenHeight * 0.06)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
