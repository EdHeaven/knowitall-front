import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowitall/screen/question/question.dart';
import 'package:knowitall/screen/question/questions/question1.1-body.dart';
import 'package:knowitall/screen/screen.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({Key? key,
    // required this.name, required this.image
  }) : super(key: key);

  // final String name;
  // final String image;

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey,
            width: 1
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            // widget.name,
            "География",
            style:
                GoogleFonts.nunito(fontSize: 26.0, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const Nav()));
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                          "assets/images/Geography.jpg")),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Описание',
                      style: GoogleFonts.nunito(
                          fontSize: 24.0, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Тесты по географии позволят вам проверит свои знания о географических объектах и явлениях Земли, таких как континенты, страны, реки, горы, климат и т.д.',
                      style: GoogleFonts.nunito(
                          fontSize: 16.0, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Тесты',
                      style: GoogleFonts.nunito(
                          fontSize: 24.0, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                ],
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: const TestList(
                      // count: 5,
                      titles: ['Страны', 'Реки', 'Азия', 'Климатические зоны', 'Озёра', ],
                      pages: [QuestionBody1_1(), QuestionScreen(), QuestionScreen(), QuestionScreen(), QuestionScreen(), ],
                    ),
                    // child: ListView.builder(
                    //     itemBuilder: (context, index){
                    //       return Text(index.toString());
                    //     }
                    )
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestList extends StatelessWidget {
  const TestList({
    super.key,
    // required this.count,
    required this.titles,
    required this.pages,
  });

  // final int count;
  final List<String> titles;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: OutlinedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, pages[index]);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => pages[index]));
                },
                style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    side: const BorderSide(
                      color: Color(0xff6949FF),
                      width: 2.0,
                    ),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titles[index],
                      style: GoogleFonts.nunito(
                          fontSize: 24.0, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          );
        });
  }
}
