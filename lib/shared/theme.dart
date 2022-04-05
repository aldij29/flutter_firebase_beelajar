import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 18.0;

Color kPrimaryColor = const Color(0xffFFA86B);
Color kBlackColor = const Color(0xff051E34);
Color kBackgroundColor = const Color(0xffF6F8FA);
Color kGreyColor = const Color(0xff8F8F8F);
Color kWhiteColor = const Color(0xffFFFFFF);
Color kRedColor = const Color(0xffEF5350);
Color kTransparentColor = Colors.transparent;

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight black = FontWeight.w900;

TextStyle regularTextStyle =
    GoogleFonts.outfit(color: kBlackColor, fontWeight: regular);
TextStyle titleTextStyle =
    GoogleFonts.outfit(color: kBlackColor, fontSize: 16, fontWeight: bold);
TextStyle subTitleTextStyle =
    GoogleFonts.outfit(color: kBlackColor, fontSize: 12, fontWeight: regular);
TextStyle informTextStyle =
    GoogleFonts.outfit(color: kGreyColor, fontSize: 10, fontWeight: regular);
