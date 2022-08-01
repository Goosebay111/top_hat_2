import 'package:flutter/material.dart';
import 'package:top_hat_2/enums/leaf_type.dart';
import 'package:top_hat_2/helpers/convert_youtube_url.dart';
import 'package:top_hat_2/models/composite.dart';
import 'package:top_hat_2/models/tokens/collection_token.dart';
import 'package:top_hat_2/models/tokens/episode_token.dart';
import 'package:top_hat_2/models/tokens/topic_token.dart';


class Leaf extends Composite {
  Leaf()
      : super(
          children: [],
          name: '',
          leafType: LeafType.collection,
          video: null,
        );
  @override
  addToChildren(String title, String? payload) {
    switch (leafType) {
      case LeafType.collection:
        children.add(Leaf()
          ..leafType = LeafType.topic
          
          ..name = title);
        break;
      case LeafType.topic:
        children.add(Leaf()
          ..leafType = LeafType.hatch
          
          ..name = title);
        break;
      case LeafType.hatch:
        if (payload == null) {
          break;
        }
        children.add(Leaf()
          ..leafType = LeafType.topic
          
          ..name = title
          ..video = ProcessURL.convertURL(payload));
        break;

      case null:
        break;
    }
  }

  @override
  render(BuildContext context, int? index, Function statefulFx) {
    switch (leafType) {
      case LeafType.collection:
        return CollectionToken(
          scrollType: LeafType.collection, // unused
          statefulFx: statefulFx,
          index: index ?? 0,
          children: children,
        );
      case LeafType.topic:
        return TopicToken(
          scrollType: LeafType.topic,
          statefulFx: statefulFx,
          index: index ?? 0,
          children: children,
        );
      case LeafType.hatch:
        return HatchToken(
          scrollType: LeafType.hatch, // unused
          statefulFx: statefulFx,
          index: index ?? 0,
          children: children,
        );

      case null:
        return const Text('Leaf Error');
    }
  }
}
