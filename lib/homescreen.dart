import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:skin_sure/skinCareBot.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: Image.asset("assets/images/img.png",width:size.width*.5 ,),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: size.height * .15,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .05,
                      vertical: size.height * .03),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Ionicons.scan_outline),
                    Text(
                      "Scan Disease",
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * .05),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * .15,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SkinCareBot.routeName);
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .05,
                      vertical: size.height * .02),
                ),
                child: Column(
                  children: [
                    const Icon(Ionicons.person_outline),
                    Text("Personalised \nskin care",textAlign: TextAlign.center,overflow: TextOverflow.fade, style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w700,
                        fontSize: size.width * .05),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
