import 'package:bhoomi_app/screens/home_page/PropertyPost_form/OfficeForm.dart';
import 'package:bhoomi_app/screens/home_page/PropertyPost_form/property_post_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class chooseFile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final H =  MediaQuery.of(context).size.height*0.3;
    final W = MediaQuery.of(context).size.width*0.7;

    // TODO: implement build
    return Scaffold(
      body: Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Get.to(()=>PropertyPostForm());
              },
              child: Container(
                height: H,
                width: W,
                decoration: BoxDecoration(
                  color: CupertinoColors.activeGreen,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow:[BoxShadow(blurRadius: 10,color: CupertinoColors.activeGreen)]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(child: Text('If you want your office show at home page then Click Here ',style: GoogleFonts.play(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Get.to(()=>OfficeForm());
              },

              child: Container(
                height: H,
                width: W,
                decoration: BoxDecoration(
                    color: CupertinoColors.activeGreen,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow:[BoxShadow(blurRadius: 10,color: CupertinoColors.activeGreen)]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(child: Text('If you want your office show at office page then Click Here ',style: GoogleFonts.play(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ),
            ),
          ],
        ) ,
      ),
    );
  }

}