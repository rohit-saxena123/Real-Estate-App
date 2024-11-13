// import 'package:bhoomi_app/OTPVerifiscreen.dart';
import 'package:bhoomi_app/main.dart';
import 'package:bhoomi_app/screens/home_page/home_screen.dart';
import 'package:bhoomi_app/screens/signin_page/signin_screen.dart';
import 'package:bhoomi_app/screens/signup_page/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class LoginHomeScreen extends StatefulWidget {
  @override
  State<LoginHomeScreen> createState() => _LoginHomeScreenState();
}

class _LoginHomeScreenState extends State<LoginHomeScreen> {
  bool isfinished = false;
  bool isFinished=false;
  String loginButtonText = 'Swipe for Sign Up';
  String regsButtonText = 'Swipe for sign In';

  @override
  Widget build(BuildContext context) {
    final Width =MediaQuery.of(context).size;
    final Height =MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.network('https://img.freepik.com/premium-photo/bright-corner-office-with-yellow-chair-inspirational-quotes_1273204-2161.jpg?ga=GA1.1.435796893.1694598652&semt=ais_hybrid',fit: BoxFit.cover,height: Height.height*1.5,width:Width.width*2,),


          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 60,
                    child:
                    SwipeableButtonView(
                      buttonText: 'SLIDE FOR SIGN UP',
                      buttonWidget: Container(
                        child: Icon(Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                        ),),
                      activeColor: Colors.green.shade100,
                      isFinished: isfinished,
                      onWaitingProcess: () {
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            isfinished = true;
                          });
                        });
                      },
                      onFinish: () async {
                        await Navigator.push(context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: SignupScreen()));

                        //TODO: For reverse ripple effect animation
                        setState(() {
                          isfinished = false;
                        });
                      },
                    )
                ),
                SizedBox(
                  height: 20,
                ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
               height: 60,
                child:
                SwipeableButtonView(
                  buttonText: 'SLIDE FOR SIGN IN',
                  buttonWidget: Container(
                    child: Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),),
                  activeColor: Colors.blueGrey,
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        isFinished = true;
                      });
                    });
                  },
                  onFinish: () async {
                    await Navigator.push(context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: MainPage()));

                    //TODO: For reverse ripple effect animation
                    setState(() {
                      isFinished = false;
                    });
                  },
                )
              ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
