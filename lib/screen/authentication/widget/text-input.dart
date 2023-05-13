import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    required this.title,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    // required this.text
  });

  final String title;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  // final String? text;



  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  // late TextEditingController controller;
  // late String value;

  // @override
  // void initState(){
  //   super.initState();
  //   controller = TextEditingController();
  // }

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
          TextFormField(
            // controller: controller,
            // // onEditingComplete: (){
            // //   setState(() {
            // //     value = controller.text;
            // //   });
            // // },
            // onSaved: (value){
            //   value = controller.text;
            // },
            // onEditingComplete: (){
            //   setState(() {
            //     value = widget.text;
            //   });
            // },
            decoration: InputDecoration(
              hintText: widget.hint,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff6949ff),
                  width: 2.0,
                ),
              ),
            ),
            keyboardType: widget.inputType,
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
