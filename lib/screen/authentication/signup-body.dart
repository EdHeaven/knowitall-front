import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowitall/config.dart';
import 'package:knowitall/model/register_request_model.dart';
// import 'package:knowitall/screen/authentication/widget/password-input.dart';
// import 'package:knowitall/screen/authentication/widget/text-input.dart';
import 'package:knowitall/screen/screen.dart';
import 'package:knowitall/services/api_service.dart';
// import 'package:knowitall/widget/widget.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  // String? username;
  //
  // String? email;
  //
  // String? password;

  bool isApiCallProcess = false;
  bool _obscureText = true;
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
        inAsyncCall: isApiCallProcess,
        key: UniqueKey(),
        opacity: 0.3,
        child: Form(
          key: globalFormKey,
          child: _signupUI(context),
        ),
      ),
    );
  }

  Widget _signupUI(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WelcomeScreen()));
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 35,
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Регистрация',
                        style: GoogleFonts.nunito(
                            fontSize: 40.0, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/Logo.png',
                    width: 220.0,
                    height: 220.0,
                  ),
                  // const SizedBox(height: 40.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            // TextInput(
                            //   title: "Имя пользователя",
                            //   hint: "Введите имя пользователя",
                            //   inputType: TextInputType.name,
                            //   inputAction: TextInputAction.next,
                            //   // text: username!,
                            // ),
                            // TextInput(
                            //   title: "Эл. почта",
                            //   hint: "Введите эл. почту",
                            //   inputType: TextInputType.emailAddress,
                            //   inputAction: TextInputAction.next,
                            //   // text: email!,
                            // ),
                            // PasswordInput(
                            //   title: "Пароль",
                            //   hint: "Введите пароль",
                            //   inputAction: TextInputAction.done,

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Имя",
                                    style: GoogleFonts.nunito(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextFormField(
                                    // controller: controller,
                                    // onEditingComplete: (){
                                    //   setState(() {
                                    //     value = controller.text;
                                    //   });
                                    // },
                                    onSaved: (value) {
                                      username = value;
                                    },
                                    onChanged: (value) {
                                      username = value;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Пожалуйста, введите имя!";
                                      }
                                      return null;
                                    },
                                    // onEditingComplete: (){
                                    //   setState(() {
                                    //     email = controller.text;
                                    //     debugPrint(email);
                                    //   });
                                    // },
                                    decoration: const InputDecoration(
                                      hintText: "Введите имя",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff6949ff),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    style: GoogleFonts.nunito(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Эл. почта",
                                    style: GoogleFonts.nunito(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextFormField(
                                    // controller: controller,
                                    // onEditingComplete: (){
                                    //   setState(() {
                                    //     value = controller.text;
                                    //   });
                                    // },
                                    onSaved: (value) {
                                      email = value;
                                    },
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Пожалуйста, введите почту!";
                                      }
                                      return null;
                                    },
                                    // onEditingComplete: (){
                                    //   setState(() {
                                    //     email = controller.text;
                                    //     debugPrint(email);
                                    //   });
                                    // },
                                    decoration: const InputDecoration(
                                      hintText: "Введите эл. почту",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff6949ff),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    style: GoogleFonts.nunito(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Пароль",
                                    style: GoogleFonts.nunito(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextFormField(
                                    onSaved: (value) {
                                      password = value;
                                    },
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Пожалуйста, введите пароль!";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Введите пароль",
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: const Color(0xff6949ff),
                                        ),
                                      ),
                                      focusedBorder:
                                          const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff6949ff),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    obscureText: _obscureText,
                                    textInputAction: TextInputAction.done,
                                    style: GoogleFonts.nunito(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(height: double.infinity),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // const SizedBox(
                  //   height: 180,
                  // ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        if (validateAndSave()) {
                          setState(() {
                            isApiCallProcess = true;
                          });

                          RegisterRequestModel model = RegisterRequestModel(
                            username: username,
                            email: email,
                            password: password,
                          );

                          APIService.register(model).then((response) {
                            setState(() {
                              isApiCallProcess = false;
                            });

                            if (response.message == "null") {
                              FormHelper.showSimpleAlertDialog(
                                context,
                                Config.appName,
                                "Регистрация прошла учпешно! Можете войти в аккаунт.",
                                "OK",
                                () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInScreen()));
                                },
                              );
                            } else {
                              FormHelper.showSimpleAlertDialog(
                                context,
                                Config.appName,
                                response.message,
                                "OK",
                                () {
                                  Navigator.pop(context);
                                },
                              );
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        foregroundColor: const Color(0xffffffff),
                        backgroundColor: const Color(0xff6949ff),
                      ),
                      child: Text(
                        "Зарегестрироваться",
                        style: GoogleFonts.nunito(
                            fontSize: 16.0, fontWeight: FontWeight.w700),
                      ),
                    ),

                    // const JumpButton(
                    //   title: "Зарегестрироваться",
                    //   frontColor: Color(0xffffffff),
                    //   backColor: Color(0xff6949ff),
                    //   page: Nav(),
                    // ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
