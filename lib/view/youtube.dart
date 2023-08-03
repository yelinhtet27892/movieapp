import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayer extends StatefulWidget {



  @override
  State<YoutubePlayer> createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<YoutubePlayer> {
  final videoUrl = 'https://www.youtube.com/watch?v=YMx8Bbev6T4&t=37s';
  late YoutubePlayerController _ytbPlayerController;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayerController.fromVideoId(
        videoId: videoUrl,
        params: YoutubePlayerParams(
          mute: false,
          showControls: true,
          showFullscreenButton: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayerScaffold(
        controller: _ytbPlayerController,
        aspectRatio: 16 / 9,
        builder: (context, player) {
          return Column(
            children: [
              player,
              Text('Youtube Player'),
            ],
          );
        },
      ),
    );
  }
}
