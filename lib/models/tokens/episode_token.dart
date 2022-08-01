import 'package:flutter/material.dart';
import 'package:top_hat_2/enums/leaf_type.dart';
import 'package:top_hat_2/models/composite.dart';
import 'package:top_hat_2/pages/episode_page.dart';
import 'package:top_hat_2/ui/hatch_text.dart';
import 'package:top_hat_2/ui/rectangle_box.dart';


class HatchToken extends StatelessWidget {
  const HatchToken({
    super.key,
    required this.children,
    required this.index,
    required this.statefulFx,
    required this.scrollType,
  });
  final int index;
  final Function statefulFx;
  final LeafType scrollType;
  final List<Composite> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EpisodePage(
                      webAddress: children[index].video ?? 'null',
                      title: children[index].name ?? '',
                    )),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RectangleBox(
                children: children, index: index, statefulFx: statefulFx),
            HatchText(children: children, index: index, statefulFx: statefulFx),
          ],
        ),
      ),
    );
  }
}
