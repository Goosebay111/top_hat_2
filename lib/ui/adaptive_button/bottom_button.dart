import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_hat_2/enums/leaf_type.dart';
import 'package:top_hat_2/helpers/renaming_dialog_box.dart';
import 'package:top_hat_2/models/composite.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key, required this.statefulFx, required this.child});
  final Function statefulFx;
  final Composite? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // todo: 
        IconButton(
          icon: Icon(
            (child?.leafType == LeafType.collection)
                ? CupertinoIcons.plus_app_fill
                : CupertinoIcons.plus_app,
            size: 50,
          ),
          onPressed: () async {
            var name =
                await namingDialogBox(context: context, newRequest: 'Add Item');
            if (name == null) {
              return;
            }
            statefulFx(child?.addToChildren(name ?? '', null));
          },
        ),
      ],
    );
  }
}
