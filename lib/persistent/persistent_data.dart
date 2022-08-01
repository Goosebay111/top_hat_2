import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_hat_2/models/composite.dart';

class PersistentData {
  static Future<void> saveData({
    required BuildContext context,
    required Composite? data,
  }) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String compositeDataJson = json.encode(
        data?.toJson(),
      );
      prefs.setString('collection', compositeDataJson);
      log('data saved');
    } catch (e) {
      log('persistent data save data error: ${e.toString()}');
    }
  }

  static Future<Composite?> get loadData async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    String? jsonValue = preference.getString('collection');

    if (jsonValue != null) {
      Composite result = Composite.fromJson(
        json.decode(jsonValue),
      );
      log(result.toString());
      return result;
    } else {
      return null;
    }
  }
}
