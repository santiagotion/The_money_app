import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ToWhoTextFied extends StatelessWidget {
  final FocusNode focusNode;
  final Function onChanged;
  final Function onSubmitted;
  final String hintText;
  final double textSize;
  final double hintSize;
  final TextInputType kebordType;
  final bool autofocus;

  const ToWhoTextFied(
      {Key? key,
      required this.focusNode,
      required this.onChanged(String input),
      required this.onSubmitted(String input),
      required this.hintText,
      this.textSize = 20,
      this.hintSize = 20,
      this.kebordType = TextInputType.name,
      this.autofocus = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          width: 200,
          alignment: Alignment.center,
          child: TextField(
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.center,
            onTap: () {},
            autofocus: true,
            keyboardType: kebordType,
            focusNode: focusNode,
            onChanged: (input) {
              onChanged(input);
            },
            onSubmitted: (value) {
              onSubmitted(value);
            },
            keyboardAppearance: Brightness.light,
            cursorColor: Colors.white,
            cursorHeight: 25,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: textSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: hintSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              hintText: hintText,
            ),
          ),
        ),
        Container(
          height: 2,
          width: 200,
          color: Colors.white,
        )
      ],
    );
  }
}
