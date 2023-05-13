import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
    required this.title,
    required this.hint,
    required this.inputAction,
  });

  final String title;
  final String hint;
  final TextInputAction inputAction;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style:
                GoogleFonts.nunito(fontSize: 16.0, fontWeight: FontWeight.w700),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: widget.hint,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility, color: const Color(0xff6949ff),),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff6949ff),
                  width: 2.0,
                ),
              ),
            ),
            obscureText: _obscureText,
            textInputAction: widget.inputAction,
            style: GoogleFonts.nunito(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
