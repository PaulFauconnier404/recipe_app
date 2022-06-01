import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/model/recipe_provider.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:provider/provider.dart';


class Stars_Container extends StatelessWidget {
  String id;
  List<dynamic> note;

  Stars_Container({
    required this.id,
    required this.note
  });

  

  
  @override
  Widget build(BuildContext context) {
    
    bool starsUp = true;

    void addNote(noteToAdd) async{
      
      note.add(noteToAdd);
      await Provider.of<RecipeProvider>(
            context,
            listen: false,
          ).updateRecipe(note, id);
    }

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
                    tooltip: '1',
                    onPressed: () {addNote(1);},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(Icons.star_border),
                    tooltip: '2',
                    onPressed: () {addNote(2);},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(Icons.star_border),
                    tooltip: '3',
                    onPressed: () {addNote(3);},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(Icons.star_border),
                    tooltip: '4',
                    onPressed: () {addNote(4);},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(
                      starsUp ?
                        Icons.star_border
                        :
                        Icons.star_border

                      ),
                    tooltip: '5',
                    onPressed: () {addNote(5);
                      starsUp = starsUp!;
                    },
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
