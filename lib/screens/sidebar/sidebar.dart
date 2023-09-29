import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/constants/divider.dart';
import 'package:la_nation/constants/my_app_bar.dart';
import 'package:la_nation/providers/prefs_provider.dart';
import 'package:la_nation/providers/theme_provider.dart';
import 'package:la_nation/screens/settings/font_resize.dart';
import 'package:la_nation/widgets/sidebar_widget.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    void toggleDarkMode(WidgetRef ref) {
      final currentState = ref.read(darkModeProvider);
      final newDarkModeState = !currentState;

      ref.read(darkModeProvider.notifier).state = newDarkModeState;
      ref.read(prefsProvider).setBool('darkMode', newDarkModeState);
    }

    final bool? darkMode = ref.watch(darkModeProvider);

    return Container(
      color: app_color.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor:
            darkMode == true ? app_color.darkBackground : app_color.white,
        appBar: MyAppBar.build(context, 'Paramètres'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyDivider(),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: TextWidget(
                  fontSize: screenWidth * 0.042,
                  fontWeight: FontWeight.w700,
                  text: 'Compte',
                  textColor: app_color.primary,
                ),
              ),
              SideBarWidget(
                icon: Icons.person_outline,
                text: 'Se connecter',
                onPressed: () {},
                icon2: Icons.person_add_alt,
                text2: 'Créer un compte',
                onPressed2: () {},
              ),
              SizedBox(height: screenHeight * 0.03),
              const MyDivider(),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: TextWidget(
                  fontSize: screenWidth * 0.042,
                  fontWeight: FontWeight.w700,
                  text: 'Réglages de l\'application',
                  textColor: app_color.primary,
                ),
              ),
              SideBarWidget(
                icon: Icons.bookmark_border,
                text: 'Mis en signet',
                onPressed: () {},
                icon2: Icons.menu,
                text2: 'Autre',
                onPressed2: () {},
              ),
              SizedBox(height: screenHeight * 0.035),
              SideBarWidget(
                icon: Icons.info,
                text: 'Apropo de nous',
                onPressed: () {},
                icon2: Icons.text_fields,
                text2: 'Taile du texte',
                onPressed2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FontResize()),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.035),
              SideBarWidget(
                icon: Icons.dark_mode,
                text: 'Apparance Mode clair',
                onPressed: () {
                  toggleDarkMode(ref);
                },
                icon3: darkMode == true ? Icons.toggle_on : Icons.toggle_off,
              ),
              const MyDivider(),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: TextWidget(
                  fontSize: screenWidth * 0.042,
                  fontWeight: FontWeight.w700,
                  text: 'Aide & Support',
                  textColor: app_color.primary,
                ),
              ),
              SideBarWidget(
                icon: Icons.contact_support_rounded,
                text: 'Nous contacter',
                onPressed: () {},
                icon2: Icons.privacy_tip,
                text2: 'Mention legales',
                onPressed2: () {},
              ),
              SizedBox(height: screenHeight * 0.035),
              const MyDivider(),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: TextWidget(
                  fontSize: screenWidth * 0.042,
                  fontWeight: FontWeight.w700,
                  text: 'À propos',
                  textColor: app_color.primary,
                ),
              ),
              SideBarWidget(
                icon: Icons.person_outline,
                text: 'Conditions et confidentialité',
                onPressed: () {},
                // icon2: Icons.privacy_tip,
                text2: 'Version',
                onPressed2: () {},
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.16),
                child: TextWidget(
                  fontSize: screenWidth * 0.032,
                  fontWeight: FontWeight.w400,
                  text: '1.1.2',
                  align: TextAlign.center,
                  textColor: app_color.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              SizedBox(
                width: screenWidth,
                height: screenHeight * 0.09,
                child: TextWidget(
                  fontSize: screenWidth * 0.034,
                  fontWeight: FontWeight.w600,
                  text: '(c) 2023 La Nation Benin.',
                  align: TextAlign.center,
                  textColor: app_color.black,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
