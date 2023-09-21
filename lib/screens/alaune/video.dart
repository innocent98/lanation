import 'package:flutter/material.dart';
import 'package:la_nation/screens/alaune/alaune_item.dart';
import 'package:la_nation/widgets/text_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../constants/colors.dart' as app_color;

class MyVideo extends StatefulWidget {
  final News2 item;

  const MyVideo({required this.item, super.key});

  @override
  State<MyVideo> createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Column(
          children: [
            YoutubePlayer(
              width: screenWidth,
              controller: _controller,
              showVideoProgressIndicator: true,
              progressColors: const ProgressBarColors(
                  playedColor: app_color.red, handleColor: app_color.primary),
            ),
            Container(
              color: app_color.black,
              child: SizedBox(
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextWidget(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                    text:
                        'Grand Prix cycliste international Chantal Biya: Cinq coureurs béninois sur la ligne de départ',
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: screenWidth * 0.02,
        )
      ],
    );
  }
}
