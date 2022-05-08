import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Stars_Container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Column(
        children: [
          Container(
            width: 350,
            padding: EdgeInsets.all(20),
            child: Text(
              'Ingrédients :',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                color: Color(0xFF202020),
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
                fontSize: 14.0,
              ),
            ),
          ),
          SizedBox(
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(Icons.star_border),
                    tooltip: 'Add to favorites',
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(Icons.star_border),
                    tooltip: 'Add to favorites',
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(Icons.star_border),
                    tooltip: 'Add to favorites',
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(Icons.star_border),
                    tooltip: 'Add to favorites',
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(Icons.star_border),
                    tooltip: 'Add to favorites',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
