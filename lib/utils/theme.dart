import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

themeData(context) => ThemeData(
      brightness: Brightness.light,
      textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
      primarySwatch: Colors.green,
      primaryColor: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
