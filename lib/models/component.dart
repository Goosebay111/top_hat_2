import 'package:flutter/material.dart';


abstract class Component {
  void addToChildren(String title, String? payload);
  Widget render(BuildContext context, int? index, Function statefulFx);
}
