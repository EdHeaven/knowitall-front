import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowitall/screen/screen.dart';
import 'package:knowitall/services/api_service.dart';
import 'package:knowitall/services/shared_service.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey,
        shape: const RoundedRectangleBorder(
            // side: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            'Профиль',
            style:
                GoogleFonts.nunito(fontSize: 26.0, fontWeight: FontWeight.w700),
            textAlign: TextAlign.start,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: Image.asset(
            'assets/images/Logo.png',
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {

                SharedService.logout(context);

                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const SignInScreen()));
              },
              icon: const Icon(
                Icons.logout_rounded,
                size: 35,
              ))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: 150,
                    height: 150,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      "edem_ablyazizov",
                      style: GoogleFonts.nunito(
                          fontSize: 24.0, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                                  color: Color(0xff6949FF), width: 1))),
                      alignment: Alignment.center,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Общее количество баллов:",
                            style: GoogleFonts.nunito(
                                fontSize: 24.0, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "5",
                            style: GoogleFonts.nunito(
                                fontSize: 24.0, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    alignment: Alignment.center,
                    child: userProfile(),
                  ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userProfile() {
    return FutureBuilder(
      future: APIService.getUserProfile(),
      builder: (BuildContext context, AsyncSnapshot<String> model){
        if(model.hasData){
          return Center(child: Text(model.data!),
          );
        }

        return const Center(
          child: Text("Error!"),
        );
      },
    );
  }
}
