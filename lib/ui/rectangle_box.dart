import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:top_hat_2/models/composite.dart';

class RectangleBox extends StatelessWidget {
  const RectangleBox(
      {Key? key,
      required this.children,
      required this.index,
      required this.statefulFx})
      : super(key: key);
  final List<Composite> children;
  final int index;
  final Function statefulFx;

  String? getYoutubeThumbnail(String videoUrl) {
    final Uri? uri = Uri.tryParse(videoUrl);
    if (uri == null) {
      return null;
    }

    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
  }

  @override
  Widget build(BuildContext context) {
    final String? thumbnail =
        getYoutubeThumbnail(children[index].video ?? 'null');
    log(thumbnail.toString());
    return Card(
      elevation: 4,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.200,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: thumbnail != null
              ? Image.network(
                  thumbnail,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                )
              : const Text('no address'),
        ),
      ),
    );
  }
}
