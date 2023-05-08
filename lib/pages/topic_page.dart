import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_hat_2/clients/client_list_view.dart';
import 'package:top_hat_2/models/composite.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key, required this.child});
  final Composite child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(child.name ?? '',
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.headlineSmall,
            )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ClientListView(child: child),
    );
  }
}
