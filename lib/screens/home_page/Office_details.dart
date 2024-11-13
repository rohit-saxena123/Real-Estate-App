import 'package:bhoomi_app/screens/home_page/Adapter_office.dart';
import 'package:bhoomi_app/screens/home_page/Model_office.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class OfficeDetails extends StatefulWidget {
  final Office_property data;

  OfficeDetails({
    required this.data,
  });

  @override
  State<OfficeDetails> createState() => _OfficeDetailsState();
}

class _OfficeDetailsState extends State<OfficeDetails> {
  // void _launchWhatsapp() async {
  //   var phoneNumber = '919650017061';
  //   final url = Uri.parse('https://wa.me/$phoneNumber');
  //
  //   if (await canLaunchUrl(url)) {
  //     await launch(url as String);
  //   } else {
  //     throw 'could not launcher $url';
  //   }
  // }

  void _launchers() async {
    var phoneNumber = '919650017061'; // Phone number with country code

    var whatsappUrl = 'https://wa.me/$phoneNumber';

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }


  void _showNumber(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('View Number',style: GoogleFonts.play(),),
        content: Text('9650017061'),


      );
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    bool isTextVisible = false;

    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Office Details',
            style: GoogleFonts.play(),
          ),
          actions: [
            InkWell(
                onTap: () {
                  _launchers();
                  Fluttertoast.showToast(msg: 'msg',toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,backgroundColor: CupertinoColors.activeGreen,textColor: Colors.white,timeInSecForIosWeb: 2);

                },
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Image.asset(
                    'assets/whatsapp.png',
                    height: 20,
                    width: 20,
                  ),
                )),
          ],
        ),
        body:
            // Container(
            //   color: Colors.white,
            //  width: MediaQuery.of(context).size.width,
            //  height: MediaQuery.of(context).size.height,
            //  child: Column(
            //    crossAxisAlignment: CrossAxisAlignment.start,
            //    children: [

            Stack(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
            //   child: Container(
            //     color: Colors.white,
            //     height: screenHeight * 0.43,
            //     width: double.infinity,
            //     child: Image.network(
            //       widget.data.imageUrl.isNotEmpty? widget.data.imageUrl[1] :'',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),

              child:Container(
                height: 400,
                child: CarouselSlider(
                    items: widget.data.imageUrl.map((url){
                      return Builder(
                        builder:(BuildContext context){
                          return Container(
                            height: MediaQuery.of(context).size.width,
                            width: MediaQuery.of(context).size.width*410,
                            margin: EdgeInsets.symmetric(horizontal: 1),
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                            )
                          );
                        }
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 400,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                      enlargeCenterPage: true,
                      aspectRatio: 16/1,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,

                    )),
              ) ,

            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: screenHeight * 0.41),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        child: Center(
                          child: Text(
                            '===',
                            style: GoogleFonts.agdasima(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.green),
                          ),
                        )),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.data.heading,
                                        style: GoogleFonts.play(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        // onTap: ,
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  CupertinoColors.activeGreen,
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(5, 8),
                                                    color: Colors.green
                                                        .withOpacity(0.5),
                                                    blurRadius: 30,
                                                    blurStyle: BlurStyle.inner)
                                              ]),
                                          child: Text(
                                            'Book Now',
                                            style: GoogleFonts.play(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        widget.data.text,
                                        style: GoogleFonts.play(
                                            fontSize: 18, color: Colors.green),
                                      ),
                                      TextButton(
                                          onPressed: (){
                                            _showNumber();
                                          },
                                          child: Text('Number'),),
                                    ],
                                  ),
                                  Text(
                                    'Workstation: ${widget.data.workstation}',
                                    style: GoogleFonts.play(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Cabin : ${widget.data.cabin}',
                                    style: GoogleFonts.play(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Pentry : ${widget.data.pentry}',
                                    style: GoogleFonts.play(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Maintenance : ${widget.data.Maintenance}',
                                    style: GoogleFonts.play(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Metro Distance : ${widget.data.metrodistance}',
                                    style: GoogleFonts.play(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      'Facility: ${widget.data.containt}',
                                      style: GoogleFonts.play(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                      textScaler: TextScaler.noScaling,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )

        //    ],
        //  ),
        //
        //
        //
        //
        // )

        );
  }
}
