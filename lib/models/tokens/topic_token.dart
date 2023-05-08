import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_hat_2/clients/client_list_view.dart';
import 'package:top_hat_2/enums/leaf_type.dart';
import 'package:top_hat_2/helpers/naming_dialog_box.dart';
import 'package:top_hat_2/models/composite.dart';


class TopicToken extends StatelessWidget {
  const TopicToken({
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.333,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListTile(
                  onLongPress: () async {
                    var name = await namingDialogBox(
                      context: context,
                      currentText: children[index].name ?? '',
                      newRequest: scrollType == LeafType.collection
                          ? 'Rename Topic'
                          : 'Rename Hatch',
                    );
                    statefulFx(
                      children[index].name = name ?? children[index].name,
                    );
                  },
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      scrollType == LeafType.collection ? 'Topic' : 'Hatch',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodySmall),
                    ),
                  ),
                  title: Text(
                    children[index].name ?? '',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ClientListView(child: children[index]),
          ),
        ],
      ),
    );
  }
}
