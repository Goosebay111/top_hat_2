import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:top_hat_2/enums/leaf_type.dart';
import 'package:top_hat_2/models/composite.dart';
import 'package:top_hat_2/models/leaf.dart';

Composite populateSingleTopicBranchFromJson({
  required BuildContext context,
  required Map<String, dynamic> savedData,
  Composite? currentCollection,
}) {
  //
  Composite copiedTopic = currentCollection ?? Leaf()
    ..leafType = LeafType.collection
    ..name = 'collection';
  Composite loadedCollection = Composite.fromJson(savedData);

  //does not allow the same item of the same name to be added twice.
  if (copiedTopic.children.isNotEmpty) {
    var listOfIDs = copiedTopic.children.map((item) => item.name).toList();
    if (listOfIDs.contains(loadedCollection.name)) {
      log('child.children contains fromJson.id ${loadedCollection.name}');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('The collection already contains this item.')));

      return loadedCollection;
    }
  }

  try {
    // now that all of the checks are done,
    // add a topic branch of the loaded collection to the result
    copiedTopic.addToChildren(loadedCollection.name ?? '',
        loadedCollection.video);
    // gets the updated number of children in the collection
    var numberOfChildren = copiedTopic.children.length;
    // add children to each result.children
    for (var i = 0; i < numberOfChildren; i++) {
      if (copiedTopic.children[i].name == loadedCollection.name) {
        
        copiedTopic.children[i].children = loadedCollection.children
            .map(
              (topic) => Leaf()
                ..leafType = LeafType.hatch
                
                ..name = topic.name
                ..video = topic.video
                ..children = topic.children,
            )
            .toList();
      }
    }
  } catch (e) {
    log('populateWidgetsFromJson error: $e');
  }
  return copiedTopic;
}
