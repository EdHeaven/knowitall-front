import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowitall/screen/category/category-body.dart';
import 'package:knowitall/screen/category/category.dart';
import 'package:knowitall/screen/screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key, required this.name, required this.image, required this.page})
      : super(key: key);

  final String name;
  final String image;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      width: 185,
      height: 138,
      child: Card(
        // margin: EdgeInsets.all(32),
        borderOnForeground: false,
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        // color: Colors.amber.shade100,
        // semanticContainer: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        // Implement InkResponse
        child: InkResponse(
          containedInkWell: true,
          highlightShape: BoxShape.circle,
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        // page
                        const CategoryBody(
                          // name: "name",
                          // image: "assets/images/Geography.jpg",
                        )));
          },
          // Add image & text
          child: Ink.image(
            width: double.infinity,
            height: 140,
            fit: BoxFit.cover,
            image: AssetImage(image),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                name,
                style: GoogleFonts.nunito(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
