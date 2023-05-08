import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:top_hat_2/enums/leaf_type.dart';
import 'package:top_hat_2/models/composite.dart';
import 'package:top_hat_2/ui/adaptive_button/bottom_button.dart';
import 'package:top_hat_2/ui/adaptive_button/side_button.dart';

class ClientListView extends StatefulWidget {
  const ClientListView({required this.child, Key? key}) : super(key: key);
  final Composite child;

  @override
  State<ClientListView> createState() => _ClientListViewState();
}

class _ClientListViewState extends State<ClientListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.child.children.length + 1,
      scrollDirection: widget.child.leafType?.direction ?? Axis.vertical,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (BuildContext context, int index) {
        if (!(index < widget.child.children.length)) {
          if (widget.child.leafType == LeafType.hatch) {
            return SideButton(
              statefulFx: (void fx) => setState(() => fx),
              child: widget.child,
            );
          }
          return BottomButton(
            statefulFx: (void fx) => setState(() => fx),
            child: widget.child,
          );
        }
        return Slidable(
          startActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                backgroundColor: Colors.green,
                onPressed: ((context) async {
                  final data = widget.child.children[index];
                }),
                icon: CupertinoIcons.cloud_upload_fill,
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                backgroundColor: Colors.red,
                onPressed: ((context) {
                  setState(() {
                    widget.child.remove(index);
                  });
                }),
                icon: CupertinoIcons.delete,
              ),
            ],
          ),
          child: widget.child.render(
            context,
            index,
            (void fx) => setState(() => fx),
          ),
        );
      },
    );
  }
}
