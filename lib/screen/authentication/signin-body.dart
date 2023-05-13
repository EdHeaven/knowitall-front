import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowitall/config.dart';
import 'package:knowitall/model/login_request_model.dart';
// import 'package:knowitall/screen/authentication/widget/password-input.dart';
// import 'package:knowitall/screen/authentication/widget/text-input.dart';
import 'package:knowitall/screen/screen.dart';
import 'package:knowitall/services/api_service.dart';
import 'package:knowitall/widget/remember-me.dart';
import 'package:knowitall/widget/widget.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  // String? email;
  // String? password;
  //
  // late TextEditingController controller;
  bool isApiCallProcess = false;
  bool _obscureText = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();
    // controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
        inAsyncCall: isApiCallProcess,
        key: UniqueKey(),
        opacity: 0.3,
        child: Form(
          key: globalFormKey,
          child: _signinUI(context),
        ),
      ),
    );
  }

  Widget _signinUI(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
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
                          width: 95,
                        ),
                        Text(
                          'Войти',
                          style: GoogleFonts.nunito(
                              fontSize: 40.0, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/Logo.png',
                    width: 220.0,
                    height: 220.0,
                  ),
                  // const SizedBox(height: 40.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            // TextInput(
                            //   title: "Эл. почта",
                            //   hint: "Введите эл. почту",
                            //   inputType: TextInputType.emailAddress,
                            //   inputAction: TextInputAction.next,
                            //   text: email!,
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
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
                              padding: const EdgeInsets.symmetric(vertical: 10),
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
                                      focusedBorder: const UnderlineInputBorder(
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

                            // const PasswordInput(
                            //   title: "Пароль",
                            //   hint: "Введите пароль",
                            //   inputAction: TextInputAction.done,
                            // ),
                            const RememberMe(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10),
              //   child: FormHelper.inputFieldWidget(
              //     context,
              //     "username",
              //     "Username",
              //     (onValidateVal) {
              //       if (onValidateVal.isEmpty) {
              //         return 'Username can\'t be empty.';
              //       }
              //
              //       return null;
              //     },
              //     (onSavedVal) {
              //       email = onSavedVal;
              //     },
              //     initialValue: "",
              //     obscureText: false,
              //     enabledBorderWidth: 0,
              //     // borderFocusColor: Colors.black,
              //     prefixIconColor: Colors.black,
              //     borderColor: Colors.black,
              //     textColor: Colors.black,
              //     hintColor: Colors.black.withOpacity(0.7),
              //     borderRadius: 10,
              //   ),
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const SizedBox(
                  //   height: 230,
                  // ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        if (validateAndSave()) {
                          setState(() {
                            isApiCallProcess = true;
                          });

                          LoginRequestModel model = LoginRequestModel(
                            email: email,
                            password: password,
                          );

                          APIService.login(model).then((response) {
                            setState(() {
                            isApiCallProcess = false;
                            });
                            if (response) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Nav()));
                            } else {
                              FormHelper.showSimpleAlertDialog(
                                context,
                                Config.appName,
                                "Invalid Email/Password!",
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
                        "Войти",
                        style: GoogleFonts.nunito(
                            fontSize: 16.0, fontWeight: FontWeight.w700),
                      ),
                    ),

                    // const JumpButton(
                    //   title: "Войти",
                    //   frontColor: Color(0xffffffff),
                    //   backColor: Color(0xff6949ff),
                    //   page: Nav(),
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
