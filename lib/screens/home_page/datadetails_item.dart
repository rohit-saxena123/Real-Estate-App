import 'package:bhoomi_app/screens/home_page/Adapter_office.dart';
import 'package:bhoomi_app/screens/home_page/datalist_page.dart';
import 'package:bhoomi_app/screens/home_page/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchbar_animation/const/colours.dart';
import 'package:url_launcher/url_launcher.dart';

class DatadetailsItem extends StatefulWidget {
  final home_property data;



  DatadetailsItem({
    required this.data,
  });

  @override
  State<DatadetailsItem> createState() => _DatadetailsItemState();
}

class _DatadetailsItemState extends State<DatadetailsItem> {
  GlobalKey _forkey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _query = TextEditingController();
  final TextEditingController _controllername = TextEditingController();
  final TextEditingController _controllernumber = TextEditingController();


  void _launcher() async {
    var phoneNumber = '919650017061'; // Phone number with country code

    var whatsappUrl = 'https://wa.me/$phoneNumber';

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  // void _launcher()async {
  //   // var phonenumber = '919650017061';
  //
  //   final url = Uri.parse('https://wa.me/919650017061');
  //   //
  //
  //   if(await canLaunchUrl(url)){
  //     await launchUrl(url);
  //   }else {
  //     throw 'colud not launch $url';
  //   }
  //
  //       }

  // void _launcher() async {
  //   var phoneNumber = '919650017061'; // Number with country code without any spaces or special characters
  //   var whatsappUrl = 'https://wa.me/$phoneNumber';
  //
  //   if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
  //     await launchUrl(Uri.parse(whatsappUrl));
  //   } else {
  //     throw 'Could not launch $whatsappUrl';
  //   }
  // }

        void _showNumber(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('ViewNumber',style: GoogleFonts.play(),),
            content: Text('+91 9650017061'),
          );
        });
  }

  void _showBook() {
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
              height: 400,
              child:Form(
                  key: _forkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(child: Text('For Confirmation',style: GoogleFonts.play(fontWeight: FontWeight.bold,fontSize: 18,),)),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _controllername,
                        decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter name',
                            contentPadding: EdgeInsets.only(left: 10),
                            labelStyle: TextStyle(color: CupertinoColors.activeGreen),
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2)
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2)

                            )
                        ),
                      ),
                      SizedBox(height: 8,),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _controllernumber,
                        decoration: InputDecoration(
                            labelText: 'Number',
                            hintText: 'Enter number',
                            contentPadding: EdgeInsets.only(left: 10),
                            labelStyle: TextStyle(color: CupertinoColors.activeGreen),
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2)
                            ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2)

                          )
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green.shade400,
                            boxShadow: [BoxShadow(
                              offset: Offset(8, 5),
                              color: CupertinoColors.activeGreen.withOpacity(0.4),
                              blurRadius: 10,
                            )]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('Book',style: GoogleFonts.play(fontSize: 15,color: Colors.white),),
                        ),
                      )

                    ],

                  )
              )
          );
        });
  }
  void _showQuery() {
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            height: 400,
            child:Form(
              key: _forkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(child: Text('Query Form',style: GoogleFonts.play(fontWeight: FontWeight.bold,fontSize: 20,),)),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _name,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter name',
                        contentPadding: EdgeInsets.only(left: 10),
                        labelStyle: TextStyle(color: CupertinoColors.activeGreen),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      )

                      ),

                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _number,
                      decoration: InputDecoration(
                          labelText: 'Number',
                          hintText: 'Enter number',
                          contentPadding: EdgeInsets.only(left: 10),
                          labelStyle: TextStyle(color: CupertinoColors.activeGreen),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2)
                          ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _query,
                      decoration: InputDecoration(
                          labelText: 'Query',
                          hintText: 'Enter your query',
                          contentPadding: EdgeInsets.only(left: 10),
                          labelStyle: TextStyle(color: CupertinoColors.activeGreen),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2)
                          ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green.shade400,
                        boxShadow: [BoxShadow(
                          offset: Offset(8, 5),
                          color: CupertinoColors.activeGreen.withOpacity(0.4),
                          blurRadius: 10,
                        )]
                      ),



                     child: Padding(
                       padding: const EdgeInsets.all(10),
                       child: Text('Submit',style: GoogleFonts.play(fontSize: 15,color: Colors.white),),
                     ),
                    )
                    
                  ],

                )
            )
          );
        });

        }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Office Spaces',style: GoogleFonts.play(),),
            actions: [
             InkWell(
                 onTap: (){
                 _launcher();
                 Fluttertoast.showToast(msg: 'msg',toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,backgroundColor: CupertinoColors.activeGreen,textColor: Colors.white,timeInSecForIosWeb: 2);
               },
                 child: Padding(
                   padding: const EdgeInsets.only(right: 20) ,
                   child: Image.asset('assets/whatsapp.png',height: 20,width: 20,),
                 )),
            ],
          ),


          body: Stack(
            children: <Widget>[
              Hero(
                tag: 'hero-tag${widget.data.hashCode}',
                child: Container(
                  height: 400,
                  child: CarouselSlider(
                      items:widget.data.imageUrl.map((url){
                        return Builder(
                            builder: (BuildContext context){
                              return Container(
                                height: 400,
                                width: MediaQuery.of(context).size.width*430,
                                margin: EdgeInsets.symmetric(horizontal: 1),
                                child: Image.network(
                                  url,
                                  fit: BoxFit.cover,
                                ),
                              );
                            });
                      }).toList(),
                      options: CarouselOptions(
                        height: 400,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        pauseAutoPlayOnTouch: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayInterval:Duration(seconds: 4),
                        pauseAutoPlayOnManualNavigate: true,
                        autoPlayAnimationDuration: Duration(seconds: 5),

                      )),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: screenHeight * 0.33),
                      // Adjust the margin to overlay slightly
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(2),
                          topLeft: Radius.circular(30)
                        )
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(80),
                        //   topRight: Radius.circular(20),
                        // ),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text('₹ ${widget.data.budget}',
                                    style: GoogleFonts.play(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Column(
                                children: [

                                  ElevatedButton(
                                      onPressed: (){
                                        _showNumber();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColours.transparent
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9),
                                        child: Text('View number',style: GoogleFonts.play(fontWeight: FontWeight.bold,color: Colors.white),),
                                      )),

                                      // child: I('View number',style: GoogleFonts.play(color: Colors.blue),))


                                  ]
                              ),
                            ],
                          ),
                          // Add more widgets as needed
                        ],
                      ),
                    ),

                       Container(

                        color: Colors.white,


                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.data.name,
                                    style: GoogleFonts.play(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      widget.data.place,
                                      style: GoogleFonts.play(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text(
                                    'Location: ${widget.data.location}',
                                    style: GoogleFonts.play(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text('Car Parking: ${widget.data.carpark}',style: GoogleFonts.play(fontSize: 16),),
                                  SizedBox(height: 8,),
                                  Text('Cabins: ${widget.data.cabins}',style: GoogleFonts.play(fontSize: 16),),
                                  SizedBox(height: 8,),
                                  Text('Meeting Rooms: ${widget.data.meetingrooms}',style: GoogleFonts.play(fontSize: 16),),
                                  SizedBox(height: 8,),
                                  Text('Lift: ${widget.data.lift}',style: GoogleFonts.play(fontSize: 16),),
                                  SizedBox(height: 8,),
                                  Text('Office Type: ${widget.data.typeoffice}',style: GoogleFonts.play(fontSize: 16),),
                                  SizedBox(height: 8,),
                                  Text('Looking For: ${widget.data.lookingfor}',style: GoogleFonts.play(fontSize: 16),),
                                  SizedBox(height: 8,),
                                  Text('Work Station: ${widget.data.officecapacity}',style: GoogleFonts.play(fontSize: 16),),
                                  SizedBox(height: 8,),
                                  Text('Furnishing: ${widget.data.furnishing}',style: GoogleFonts.play(fontSize: 16),),
                                  SizedBox(height: 8,),
                                  Text('Sqft: ${widget.data.sqft}',style: GoogleFonts.play(fontSize: 16),),
                                  SizedBox(height: 8,),
                                  Text('Washrooms: ${widget.data.washrooms}',style: GoogleFonts.play(fontSize: 16),),
                                  SizedBox(height: 8,),
                                  Text('Budget: ${widget.data.budget}',style: GoogleFonts.play(fontSize: 16),),
                                  SizedBox(height: 8,),
                                  Text('Floor: ${widget.data.floor}',style: GoogleFonts.play(fontSize: 16),),

                                  SizedBox(height: 20,),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: (){
                                          _showQuery();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green
                                          ),
                                          child: Text('For Query',style: GoogleFonts.play(
                                            color: Colors.white,
                                          ),),),
                                        ElevatedButton(
                                          onPressed: (){
                                            _showBook();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green
                                          ),
                                          child: Text('Book Now',style: GoogleFonts.play(
                                            color: Colors.white,
                                          ),),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
