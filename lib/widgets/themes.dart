import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: darkBlueishColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: MyTheme.darkBlueishColor),
      //buttonTheme: ButtonThemeData(buttonColor: MyTheme.darkBlueishColor,),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: Theme.of(context).textTheme.copyWith(
          headline6:
              context.textTheme.headline6?.copyWith(color: Colors.white)));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkcreamColor,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: MyTheme.lightblueColor,
      ),
      //buttonTheme: ButtonThemeData(buttonColor: lightblueColor,),

      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: Theme.of(context).textTheme);

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color lightblueColor = Vx.indigo500;
  static Color darkBlueishColor = Color(0xff403b58);
}
