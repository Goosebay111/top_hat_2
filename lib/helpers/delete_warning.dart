import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_hat_2/models/composite.dart';

class DeleteWarning extends StatelessWidget {
  const DeleteWarning({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Composite child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: child.leafType?.buttonAlignment ?? Alignment.center,
      color: Colors.red,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Icon(
          CupertinoIcons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SaveWarning extends StatelessWidget {
  const SaveWarning({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Composite child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: child.leafType?.buttonAlignment ?? Alignment.center,
      color: Colors.green,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Icon(
          CupertinoIcons.cloud_upload_fill,
          color: Colors.white,
        ),
      ),
    );
  }
}
