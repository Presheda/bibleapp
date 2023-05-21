import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String title;

  final double? fontSize;
  final Color? color;
  final int? maxLine;
  final String? fontFamily;
  final FontWeight? fontWeight;

  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final double? lineHeight;
  final double? letterSpacing;
  final TextDecoration? decoration;


  CustomText(
      {this.color,
      required  this.title,
        this.maxLine,
        this.fontSize,
        this.fontFamily,

        this.textAlign,
        this.lineHeight,
        this.decoration,
        this.fontStyle,
        this.letterSpacing,
        this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLine ?? 3,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,

      style: GoogleFonts.poppins(
          letterSpacing: letterSpacing,
          fontSize: fontSize ?? 10,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          height: lineHeight,
          color: color ?? Theme.of(context).textTheme.bodySmall!.color),

    );
  }
}
