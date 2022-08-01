import 'package:flutter/material.dart';
import 'package:top_hat_2/enums/leaf_type.dart';
import 'package:top_hat_2/models/component.dart';


class Composite implements Component {
  Composite({
    required this.name,
    required this.children,
    required this.leafType,
    required this.video,
  });
  String? name;
  LeafType? leafType;
  List<Composite> children;
  String? video;

  @override
  addToChildren(String title, String? payload) {}

  @override
  Widget render(BuildContext context, int? index, Function statefulFx) =>
      Container();

  void remove(int index) => children.removeAt(index);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'children': children.map((e) => e.toJson()).toList(),
      'leafType': leafType.toString(),
      'youtube': video,
    };
  }

  factory Composite.fromJson(Map<String, dynamic> json) {
    late LeafType translation;
    switch (json['leafType']) {
      case 'collection':
        translation = LeafType.collection;
        break;
      case 'topic':
        translation = LeafType.topic;
        break;
      case 'hatch':
        translation = LeafType.hatch;
        break;
      default:
        translation = LeafType.collection;
        break;
    }

    return Composite(
      name: json['name'] as String,
      leafType: translation,
      children: (json['children'] as List<dynamic>)
          .map((e) => Composite.fromJson(e))
          .toList(),
      video: json['youtube'] as String? ?? 'null',
    );
  }
}
