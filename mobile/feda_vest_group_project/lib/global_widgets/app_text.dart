import 'package:feda_vest_group_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      this.text,
      this.textSize,
      this.fontWeight,
      this.color,
      this.maxline,
      this.textAlign,
      this.textStyle,
      this.letterSpacing,
      this.height,
      this.wordSpacing});
  final String? text;
  final double? textSize, letterSpacing, height, wordSpacing;
  final int? maxline;
  final Color? color;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? ' ',
      textAlign: textAlign,
      maxLines: maxline ?? 1,
      style: GoogleFonts.inter(
        fontSize: textSize != null ? Utils.textSize(textSize!) : null,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        height: height,
        textStyle: textStyle,
      ),
    );
  }
}
