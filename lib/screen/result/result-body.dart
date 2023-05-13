import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowitall/screen/screen.dart';

class ResultBody extends StatelessWidget {
  const ResultBody({Key? key}) : super(key: key);

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
            'Результат',
            style:
            GoogleFonts.nunito(fontSize: 26.0, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text("ПОЗДРАВЛЯЕМ!!!", style:
                GoogleFonts.nunito(fontSize: 32.0, fontWeight: FontWeight.w700, color: Color(0xff6949ff)),
                  textAlign: TextAlign.center,),
              ),
              SizedBox(
                // width: 246,
                // height: 235,
                child: Image.network("https://freepngclipart.com/download/computer/80626-trophy-golden-computer-cup-icons-free-download-png-hq.png", width: 246, height: 235,),
              ),
              Text("Ваш балл за тест:", style:
              GoogleFonts.nunito(fontSize: 26.0, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,),
              Text("5", style:
              GoogleFonts.nunito(fontSize: 100.0, fontWeight: FontWeight.w700, color: Color(0xff12d18e)),
                textAlign: TextAlign.center,),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.pushReplacement(
                //     context, MaterialPageRoute(builder: (context) => page));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Nav()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xff6949ff),
              ),
              child: Text(
                'Вернуться на главную',
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
