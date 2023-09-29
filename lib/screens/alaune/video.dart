import 'package:flutter/material.dart';
import 'package:la_nation/widgets/text_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../constants/colors.dart' as app_color;

class MyVideo extends StatefulWidget {
  final String text;
  final String videoUrl;

  const MyVideo({required this.text, required this.videoUrl, super.key});

  @override
  State<MyVideo> createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoUrl,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.9,
          child: Column(
            children: [
              YoutubePlayer(
                width: screenWidth,
                controller: _controller,
                showVideoProgressIndicator: true,
                progressColors: const ProgressBarColors(
                    playedColor: app_color.red, handleColor: app_color.primary),
              ),
              Container(
                width: screenWidth,
                height: screenWidth * 0.2,
                color: app_color.black,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: TextWidget(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                    text: widget.text,
                    overflow: TextOverflow.ellipsis,
                    maxLine: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: screenWidth * 0.02,
        )
      ],
    );
  }
}
