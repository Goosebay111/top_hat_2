import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TopHatVideoPlayer extends StatefulWidget {
  const TopHatVideoPlayer({super.key, required this.webAddress});
  final String webAddress;

  @override
  State<TopHatVideoPlayer> createState() => _TopHatVideoPlayerState();
}

class _TopHatVideoPlayerState extends State<TopHatVideoPlayer> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.webAddress)!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
      ),
      builder: (context, player) {
        return ListView(
          children: [
            player,
          ],
        );
      },
    );
  }
}


