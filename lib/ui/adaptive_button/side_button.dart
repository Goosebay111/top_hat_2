import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_hat_2/helpers/naming_dialog_box.dart';
import 'package:top_hat_2/models/composite.dart';


class SideButton extends StatelessWidget {
  const SideButton({super.key, required this.statefulFx, this.child});
  final Function statefulFx;
  final Composite? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: const Icon(
            CupertinoIcons.add_circled_solid,
            size: 40,
            color: Colors.white,
          ),
          onPressed: () async {
            String? payload = await namingDialogBox(
              context: context,
              currentText: '',
              newRequest: 'YouTube link',
              youTube: true,
            );
            statefulFx(
                child?.addToChildren('New Episode', payload));
          },
        ),
      ),
    );
  }
}
