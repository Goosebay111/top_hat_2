import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_hat_2/helpers/naming_dialog_box.dart';
import 'package:top_hat_2/models/composite.dart';


class HatchText extends StatelessWidget {
  const HatchText(
      {super.key,
      required this.children,
      required this.index,
      required this.statefulFx});
  final List<Composite> children;
  final int index;
  final Function statefulFx;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        var name = await namingDialogBox(
            context: context,
            currentText: children[index].name ?? '',
            newRequest: 'Rename Item');
        statefulFx(children[index].name = name ?? children[index].name);
      },
      child: Text(
        children[index].name ?? '',
        style: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
