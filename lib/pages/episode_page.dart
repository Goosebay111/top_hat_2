import 'package:flutter/material.dart';
import 'package:top_hat_2/ui/video_player.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({super.key, required this.title, required this.webAddress});

  final String title;
  final String webAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ]),
      body: TopHatVideoPlayer(webAddress: webAddress),
    );
  }
}
