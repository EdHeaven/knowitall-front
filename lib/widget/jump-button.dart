import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JumpButton extends StatelessWidget {
  const JumpButton({
    super.key,
    required this.title,
    required this.page,
    required this.frontColor,
    required this.backColor,
  });

  final String title;
  final Color frontColor;
  final Color backColor;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => page));
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        foregroundColor: frontColor,
        backgroundColor: backColor,
      ),
      child: Text(
        title,
        style: GoogleFonts.nunito(
            fontSize: 16.0, fontWeight: FontWeight.w700),
      ),
    );
  }
}
