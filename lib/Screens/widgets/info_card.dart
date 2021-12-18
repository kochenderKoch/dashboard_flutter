import 'package:dashboard_flutter/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class InfoCard extends StatelessWidget {
  final String? title;
  final String? value;
  final Color? topColor;
  final bool isActive;
  final Function? onTap;
  final Color? bezierCOlor;
  const InfoCard(
      {Key? key,
      this.title,
      this.value,
      this.topColor,
      this.isActive = false,
      this.onTap,
      this.bezierCOlor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Expanded(
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: themeProvider.getTheme().scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 6),
                color: Colors.white.withOpacity(.1),
                blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: topColor ?? blue,
                          height: 5,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: _height * .03,
                  ),
                  RichText(
                      textDirection: TextDirection.rtl,
                      strutStyle: const StrutStyle(fontSize: 18, height: 1.5),
                      maxLines: 2,
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: true,
                          applyHeightToLastDescent: true),
                      textScaleFactor: 1.2,
                      textWidthBasis: TextWidthBasis.longestLine,
                      locale: const Locale('de'),
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "$title\n",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: themeProvider.getTheme().colorScheme.error,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text: "$value\n",
                            style: GoogleFonts.lato(
                                fontSize: 40,
                                color: themeProvider
                                    .getTheme()
                                    .colorScheme
                                    .onBackground))
                      ])),
                ],
              ),
              Positioned(
                child: Opacity(
                  //semi red clippath with more height and with 0.5 opacity
                  opacity: 0.1,
                  child: ClipPath(
                    clipper: WaveClipper(), //set our custom wave clipper
                    child: Container(
                      color: bezierCOlor,
                      height: 80,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(
        0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
