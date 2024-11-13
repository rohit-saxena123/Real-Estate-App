import 'package:bhoomi_app/main.dart';
import 'package:bhoomi_app/screens/home_page/home_screen.dart';
import 'package:bhoomi_app/screens/login_screen/login_home_screen.dart';
import 'package:bhoomi_app/screens/signup_page/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserDetails();
    // gohomePage();
  }

  Future<void> checkUserDetails() async {
    // async ke baad await ka use krna hi hai
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isRegister = await prefs.getBool('isRegister') ?? false;

    await Future.delayed(Duration(seconds: 6));

    if (isRegister) {
      Get.off(() => MainPage());
    } else {
      Get.off(() => MainPage());
    }
  }

  // Future<void> gohomePage() async {
  //   await Future.delayed(Duration(seconds: 4));
  //   Get.off(MainPage());
  // }


  @override
  Widget build(BuildContext context)  {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),

        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animation/Animation.json',height: 300,width: MediaQuery.of(context).size.width),
            SizedBox(height: 20,),
            Text('Welcome to Bhoomi',style: GoogleFonts.play(fontSize: 18,fontWeight: FontWeight.bold, ),)
          ],
        ),

        ),
      ),
    );

  }
}