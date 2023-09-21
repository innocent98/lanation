import 'package:flutter/material.dart';
import 'package:la_nation/screens/alaune/alaune_item.dart';
import 'package:la_nation/screens/alaune/service_detail.dart';
import '../../constants/colors.dart' as app_color;

class Service extends StatelessWidget {
  final News2 item;

  const Service({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ServiceDetail()));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  app_color.black.withOpacity(0.5), BlendMode.srcATop),
              child: Image.network(
                item.image,
                width: screenWidth * 0.5,
                height: screenHeight * 0.25,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.02,
          )
        ],
      ),
    );
  }
}
