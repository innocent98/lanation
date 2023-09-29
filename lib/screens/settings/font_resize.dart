import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/constants/divider.dart';
import 'package:la_nation/constants/my_app_bar.dart';
import 'package:la_nation/providers/font_provider.dart';
import 'package:la_nation/providers/keep_settings_provider.dart';
import 'package:la_nation/providers/prefs_provider.dart';
import 'package:la_nation/widgets/custom_radio.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class FontResize extends ConsumerWidget {
  const FontResize({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final bool? keepSettings = ref.watch(keepSettingsProvider);
    final double fontSize = ref.watch(fontSizeProvider);

    double currentSliderValue = fontSize;

    void toggleSettingsStateFalse(WidgetRef ref) {
      const newSettingsState = false;

      ref.read(keepSettingsProvider.notifier).state = newSettingsState;
      ref.read(prefsProvider).setBool('keepSettings', newSettingsState);
    }

    void toggleSettingsStateTrue(WidgetRef ref) {
      const newSettingsState = true;

      ref.read(keepSettingsProvider.notifier).state = newSettingsState;
      ref.read(prefsProvider).setBool('keepSettings', newSettingsState);
    }

    void setFontSize(WidgetRef ref, value) {
      ref.read(fontSizeProvider.notifier).state = value;
    }

    return Container(
      color: app_color.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: app_color.white,
        appBar: MyAppBar.build(context, 'Réglages de l\'application'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyDivider(),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w700,
                      text: 'Taille de la police',
                      textColor: app_color.black,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextWidget(
                      fontSize: screenWidth * 0.033,
                      fontWeight: FontWeight.w400,
                      text:
                          'Pour votre confort de lecture, vous pouvez conserver le réglage de votre appareil ou personnaliser la taille de la police dans les articles en déplaçant le curseur.',
                      textColor: app_color.lightTextSoft,
                    )
                  ],
                ),
              ),
              const MyDivider(),
              MyRadio(
                text: 'Conserver le réglage de votre appareil',
                color: keepSettings == true
                    ? app_color.primary
                    : app_color.transparent,
                onPressed: () {
                  toggleSettingsStateTrue(ref);
                },
              ),
              MyRadio(
                text: 'Personnaliser la taille de la police',
                color: keepSettings == false
                    ? app_color.primary
                    : app_color.transparent,
                onPressed: () {
                  toggleSettingsStateFalse(ref);
                },
              ),
              const MyDivider(),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.text_fields,
                    size: screenWidth * 0.04,
                  ),
                  SizedBox(
                    width: screenWidth * 0.7,
                    child: Slider(
                      value: currentSliderValue,
                      max: screenWidth * 0.1,
                      divisions: 15,
                      onChanged: keepSettings == false
                          ? (double value) {
                              setFontSize(ref, value);
                            }
                          : null,
                      activeColor: app_color.primary,
                      inactiveColor: app_color.darkTextSoft,
                    ),
                  ),
                  Icon(
                    Icons.text_fields,
                    size: screenWidth * 0.07,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      fontSize: screenWidth * 0.033,
                      fontWeight: FontWeight.w400,
                      text:
                          'Prévisualisation de la taille de police dans un article:',
                      textColor: app_color.black,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: app_color.darkTextSoft, width: 1)),
                      child: TextWidget(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w400,
                        text:
                            ' Un grand journal, c\'est rebâtir tous les jours un chateau de sable avec une petite cuillère. -Hubert Beuve-Mery',
                        textColor: app_color.black,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
