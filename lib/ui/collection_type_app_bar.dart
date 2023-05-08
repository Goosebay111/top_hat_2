import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionTitleAppBar extends StatelessWidget {
  const CollectionTitleAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('Top',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headlineMedium,
                color: Colors.black87)),
        Text('ic',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodySmall,
                color: Colors.grey[200])),
        Text('Hat',
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.headlineMedium,
            )),
        Text('ch',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodySmall,
                color: Colors.grey[200])),
      ],
    );
  }
}