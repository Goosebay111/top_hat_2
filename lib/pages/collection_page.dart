import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:top_hat_2/clients/client_list_view.dart';
import 'package:top_hat_2/enums/leaf_type.dart';
import 'package:top_hat_2/helpers/populate_widgets.dart';
import 'package:top_hat_2/models/composite.dart';
import 'package:top_hat_2/models/leaf.dart';
import 'package:top_hat_2/persistent/persistent_data.dart';
import 'package:top_hat_2/ui/collection_type_app_bar.dart';
import 'package:top_hat_2/ui/expandable_button.dart';


class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  Composite collection = Leaf()
    ..leafType = LeafType.collection
    ..name = 'collection'
    ;

  loadValue() async {
    try {
      var savedData = await PersistentData.loadData;
      if (savedData != null) {
        setState(() {
          for (var child in savedData.children) {
            collection.children.add(populateSingleTopicBranchFromJson(
              context: context,
              savedData: child.toJson(),
            ).children.first);
          }
        });
      }
      log('collection page report: \n ${savedData?.toJson()}');
    } catch (e) {
      log('collection page load value error: $e');
    }
  }

  @override
  void initState() {
    loadValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0.0,
        title: const CollectionTitleAppBar(),
      ),
      floatingActionButton: ExpandableButton(
          collection: collection,
          statefulFx: (Function fx) {
            setState(() {
              fx();
            });
          }),
      body: ClientListView(child: collection),
    );
  }
}
