import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_hat_2/helpers/renaming_dialog_box.dart';
import 'package:top_hat_2/models/composite.dart';
import 'package:top_hat_2/persistent/persistent_data.dart';
import 'package:top_hat_2/ui/action_button.dart';
import 'package:top_hat_2/ui/expandable_fab.dart';


class ExpandableButton extends StatelessWidget {
  const ExpandableButton({Key? key, required this.collection, required this.statefulFx})
      : super(key: key);
  final Composite collection;
  final Function statefulFx;

  @override
  Widget build(BuildContext context) {
    Future<void> insertData(Composite collection) async {
      final data = collection;
      data.toJson();
      
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Inserted ID ${data.name.toString()}'),
      ));
    }

    return ExpandableFab(
      distance: 75,
      children: [
        ActionButton(
          color: Colors.red,
          icon: const Icon(
            Icons.save,
            color: Colors.white,
          ),
          onPressed: () {
            PersistentData.saveData(context: context, data: collection);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('File saved'),
            ));
          },
        ),
        ActionButton(
          color: Colors.green,
          icon: const Icon(
            CupertinoIcons.cloud_download,
            color: Colors.white,
          ),
          onPressed: () async {
            String? code = await namingDialogBox(
              context: context,
              newRequest: 'Enter TopHat Code',
              uniqueCode: true,
            );
          },
        ),
        ActionButton(
          color: Colors.blue,
          icon: const Icon(
            CupertinoIcons.cloud_upload,
            color: Colors.white,
          ),
          onPressed: () {
            log('insert data');
            log(collection.toJson().toString());
            insertData(collection);
          },
        ),
      ],
    );
  }
}
