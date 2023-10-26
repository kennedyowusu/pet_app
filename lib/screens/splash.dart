import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/constants/colors.dart';
import 'package:pet_app/constants/images.dart';
import 'package:pet_app/screens/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
        (route) => false,
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
              child: Center(
                child: ClipOval(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.height / 5,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(
                          dog3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "Pettie Care",
              style: GoogleFonts.manrope(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Helping you to keep your \n pet stay healthy!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: blackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
