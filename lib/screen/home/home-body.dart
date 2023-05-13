import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowitall/screen/category/category-body.dart';
import 'package:knowitall/screen/home/widget/appbar.dart';
import 'package:knowitall/screen/home/widget/category-card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.grey,
                width: 1
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
        ),
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            'KnowItAll',
            style:
            GoogleFonts.nunito(fontSize: 26.0, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
          child: Image.asset(
            'assets/images/Logo.png',
          ),
        ),
        actions: [
          IconButton(
          onPressed:(){
            showSearch(
              context: context,
              delegate: MySearchDelegate(),);
          },
          icon: const Icon(Icons.search),
        )
        ],
      ),
      body: SafeArea(
        child: Container(
            margin: const EdgeInsets.only(right: 15, left: 15),
          child:
            ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              // HomeScreenAppbar(),
              Row(
                children: <Widget>[
                  CategoryCard(name: "География", image: "assets/images/Geography.jpg", page: CategoryBody()),
                  CategoryCard(name: "Математика", image: "assets/images/Math.jpeg", page: CategoryBody()),
                ],
              ),
              Row(
                children: <Widget>[
                  CategoryCard(name: "Яз. программ.", image: "assets/images/Programming.jpg", page: CategoryBody()),
                  CategoryCard(name: "Физика", image: "assets/images/Physics.jpg", page: CategoryBody()),
                ],
              ),
              Row(
                children: <Widget>[
                  CategoryCard(name: "Химия", image: "assets/images/Chemistry.jpg", page: CategoryBody()),
                  CategoryCard(name: "Биология", image: "assets/images/Biology.jpg", page: CategoryBody()),
                ],
              ),
              Row(
                children: <Widget>[
                  CategoryCard(name: "Искусство", image: "assets/images/Art.jpeg", page: CategoryBody()),
                  CategoryCard(name: "Астрономия", image: "assets/images/Astronomy.jpg", page: CategoryBody()),
                ],
              ),
              Row(
                children: <Widget>[
                  CategoryCard(name: "История", image: "assets/images/History.jpg",page: CategoryBody()),
                  CategoryCard(name: "Философия", image: "assets/images/Philosophy.jpg",page: CategoryBody()),
                ],
              ),
              Row(
                children: <Widget>[
                  CategoryCard(name: "Литература", image: "assets/images/Literature.jpg",page: CategoryBody()),
                  CategoryCard(name: "Музыка", image: "assets/images/Music.jpg",page: CategoryBody()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


