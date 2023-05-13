import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({Key? key}) : super(key: key);

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              value: isChecked,
              visualDensity: VisualDensity.compact,
              activeColor: const Color(0xff6949ff),
              onChanged: (newBool) {
                setState(() {
                  isChecked = newBool;
                });
              }),
        ),
        Text(
          "Запомни меня",
          style:
              GoogleFonts.nunito(fontSize: 16.0, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
