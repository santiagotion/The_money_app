import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmountLabel extends StatelessWidget {
  final String wholeNumber;
  final String remainder;
  final double wholeNumberSize;
  final double remainderSize;
  final FontWeight fontWeight;
  final bool inPound;
  final Color color;
  const AmountLabel(
      {Key? key,
      required this.wholeNumber,
      this.remainder = ".00",
      this.wholeNumberSize = 50.00,
      this.remainderSize = 25.00,
      this.fontWeight = FontWeight.w500,
      this.inPound = true,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: inPound == true ? '£' : "",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: color,
                fontSize: 25,
              ),
            ),
          ),
          TextSpan(
            text: wholeNumber,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: color,
                fontSize: wholeNumberSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
          TextSpan(
            text: remainder,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: color,
                fontSize: remainderSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
