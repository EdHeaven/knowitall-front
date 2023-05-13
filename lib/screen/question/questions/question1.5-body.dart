import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowitall/data/tests.dart';
import 'package:knowitall/screen/question/widget/questions-widget.dart';
import 'package:knowitall/screen/result/result-body.dart';
import 'package:knowitall/screen/screen.dart';
// import 'package:mongo_dart/mongo_dart.dart';

class QuestionBody1_5 extends StatelessWidget {
  const QuestionBody1_5 ({Key? key}) : super(key: key);

  // final Test test;

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
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 3, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '5',
                style: GoogleFonts.nunito(
                    fontSize: 26.0, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              Text(
                '/',
                style: GoogleFonts.nunito(
                    fontSize: 26.0, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              Text(
                '5',
                style: GoogleFonts.nunito(
                    fontSize: 26.0, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const CategoryScreen()));
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 250,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: Color(0xff6949ff)))),
                    child: Text(
                      "Древнее государство с очень низкой плотностью населения. Имеет государственные границы только с двумя странами. Основное занятие сельских жителей — скотоводство. Около трети динозавров Земли были найдены на территории этой страны.",
                      style: GoogleFonts.nunito(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "Варианты ответов",
                  style:
                      GoogleFonts.nunito(fontSize: 20.0, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 300,
                child: Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: QuestionList(
                      titles: const [
                        'Намибия',
                        "Мавритания",
                        "Монголия",
                        "КНДР"
                      ],
                      answers: const [false, false, true, false],
                      onAnswerSelected: (int) {
                        0;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pushReplacement(
                //     context, MaterialPageRoute(builder: (context) => page));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultBody()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xff6949ff),
              ),
              child: Text(
                'Завершить',
                style: GoogleFonts.nunito(
                    fontSize: 16.0, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionList extends StatefulWidget {
  const QuestionList({
    super.key,
    // required this.count,
    required this.titles,
    required this.answers,
    required this.onAnswerSelected,
    // required this.pages,
  });

  // final int count;
  final List<String> titles;
  final List<bool> answers;
  final Function(int) onAnswerSelected;

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  int selectedAnswerIndex = -1;
  int count = 0;

  // final List<Widget> pages;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.titles.length,
        itemBuilder: (BuildContext context, int index) {
          bool answer = widget.answers[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    selectedAnswerIndex = index;
                    widget.onAnswerSelected(selectedAnswerIndex);
                  });

                  // Navigator.pushNamed(context, pages[index]);
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuestionScreen()));
                },
                style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    side: const BorderSide(
                      color: Color(0xff6949FF),
                      width: 2.0,
                    ),
                    backgroundColor: selectedAnswerIndex == index
                        ? answer
                            ? const Color(0xff12d18e)
                            : const Color(0xfff75555)
                        : Colors.transparent,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.titles[index],
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
