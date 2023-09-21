import 'package:flutter/material.dart';
import 'package:la_nation/screens/alaune/alaune.dart';
import 'package:la_nation/screens/other_alaune/other_alaune.dart';
import '../../constants/colors.dart' as app_color;

class TabItem extends StatelessWidget {
  const TabItem({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: app_color.lightBackground,
      child: SafeArea(
          child: DefaultTabController(
        length: 6,
        child: Scaffold(
          backgroundColor: app_color.lightBackground,
          appBar: AppBar(
            toolbarHeight: 15,
            bottom: TabBar(
              isScrollable: true,
              labelColor: app_color.white,
              unselectedLabelColor: app_color.black,
              unselectedLabelStyle:
                  const TextStyle(backgroundColor: app_color.transparent),
              labelStyle: const TextStyle(
                  fontFamily: 'IBM', fontWeight: FontWeight.w500),
              indicator: BoxDecoration(
                  color: app_color.primary,
                  borderRadius: BorderRadius.circular(8)),
              tabs: [
                SizedBox(
                  width: screenWidth * 0.3,
                  child: const Tab(text: 'A LA UNE'),
                ),
                SizedBox(
                  width: screenWidth * 0.3,
                  child: const Tab(text: 'ACTUALITES'),
                ),
                SizedBox(
                  width: screenWidth * 0.3,
                  child: const Tab(text: 'CULTURE'),
                ),
                SizedBox(
                  width: screenWidth * 0.3,
                  child: const Tab(text: 'ECONOMIE'),
                ),
                SizedBox(
                    width: screenWidth * 0.3, child: const Tab(text: 'SPORT')),
                const Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Alaune(),
              OtherAlaune(),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      )),
    );
  }
}
