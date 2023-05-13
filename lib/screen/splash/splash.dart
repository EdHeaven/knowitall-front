import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowitall/screen/screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(Duration(seconds: 2), () {} );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/images/Logo.png', height: 220, width: 220,),
            ),
            SizedBox(height: 25,),
            Container(
              child: Text('KnowItAll', style: GoogleFonts.nunito(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700),),
            ),
          ],
        ),
      ),
    );
  }
}
