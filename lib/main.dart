import 'package:flutter/material.dart';
import 'package:top_hat_2/pages/collection_page.dart';

// minimum viable product that I cut and paste from a fully working project.
// the video player doesn't work yet. I suspect its because I haven't added permissions or maybe I have erased a variable when making the MVP.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TopHat',
      theme: ThemeData(
        // backgroundColor: Colors.white,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
        ),
      ),
      home: const CollectionPage(),
    );
  }
}
