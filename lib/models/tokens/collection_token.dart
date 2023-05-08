import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_hat_2/enums/leaf_type.dart';
import 'package:top_hat_2/helpers/renaming_dialog_box.dart';
import 'package:top_hat_2/models/composite.dart';
import 'package:top_hat_2/pages/topic_page.dart';

class CollectionToken extends StatelessWidget {
  const CollectionToken({
    super.key,
    required this.index,
    required this.children,
    required this.statefulFx,
    required this.scrollType,
  });

  final int index;
  final Function statefulFx;
  final LeafType scrollType;
  final List<Composite> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xfffafafa),
      child: ListTile(
        leading: Text(
          'Topic',
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodySmall),
        ),
        title: Text(
          children[index].name ?? '',
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.titleLarge),
        ),
        trailing: GestureDetector(
          onLongPress: () {
           
          },
          child: Text('no longer there',
              style: GoogleFonts.roboto(fontSize: 10)),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TopicPage(child: children[index]);
              },
            ),
          );
        },
        onLongPress: () async {
          String? name = await namingDialogBox(
              context: context,
              currentText: children[index].name ?? '',
              newRequest: 'Rename Collection');
          statefulFx(children[index]..name = name ?? children[index].name);
        },
      ),
    );
  }
}
