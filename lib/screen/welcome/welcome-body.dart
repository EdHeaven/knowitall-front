import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowitall/screen/screen.dart';
import 'package:knowitall/screen/authentication/signup.dart';
import 'package:knowitall/widget/widget.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/Logo.png',
                  width: 220.0,
                  height: 220.0,
                ),
                Text(
                  'Добро пожаловать!',
                  style: GoogleFonts.nunito(
                      fontSize: 40.0, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 180.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const JumpButton(
                        title: "Хочу зарегестрироваться",
                        frontColor: Color(0xffffffff),
                        backColor: Color(0xff6949ff),
                        page: SignUpScreen(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const JumpButton(
                        title: "У меня уже есть аккаунт",
                        frontColor: Color(0xff6949ff),
                        backColor: Color(0xffF0EDFF),
                        page: SignInScreen(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

