import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowitall/screen/home/widget/appbar.dart';

class RatingBody extends StatelessWidget {
  const RatingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            'Рейтинг',
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
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Container(
          child: const RatingList(
        name: [
          'ed_heaven',
          'ablyazizov.e.i20',
          'Вы',
        ],
        points: ['15', '14', '5'],
      )),
    );
  }
}

class RatingList extends StatelessWidget {
  const RatingList({
    super.key,
    // required this.count,
    required this.name,
    required this.points,
  });

  // final int count;
  final List<String> name;
  final List<String> points;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: name.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xff6949ff)))),
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            clipBehavior: Clip.hardEdge,
                            width: 50,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: const Color(0xff6949FF),
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.asset('assets/images/Profile.png')),
                          ),
                          Text(
                            name[index],
                            style: GoogleFonts.nunito(
                                fontSize: 24.0, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            points[index],
                            style: GoogleFonts.nunito(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff6949FF)),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
