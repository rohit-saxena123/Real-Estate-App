import 'package:bhoomi_app/main.dart';
import 'package:bhoomi_app/screens/home_page/property_listing_page/Model_property_listing/property_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertydetailsPage extends StatelessWidget {
  final property_listing property;

  PropertydetailsPage({
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Container(
                color: Colors.white,
              ),

             Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          property.image,
                          fit: BoxFit.cover,

                      ),

                    ),


            Positioned(
              top: 370,
              child: Container(

                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft:Radius.circular(30)),
                  color: Colors.white
                ),
                child: Center(child: Text('===',style: GoogleFonts.play(fontWeight: FontWeight.bold,color: CupertinoColors.activeGreen),)),
              ),
            ),
              
              Positioned(
                top: 30,
                left: 20,
                child: IconButton(
                    onPressed: (){
                      Get.off(()=>MainPage());

                    },
                    icon: Icon(Icons.arrow_circle_left_sharp,color: CupertinoColors.activeGreen,size: 30,),),
              )
              
            ],
          ),
        ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        property.adtitle,
                        style: GoogleFonts.play(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(

                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(color: Colors.green.shade500)]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('BookNow',style: GoogleFonts.play(fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                      )

                    ],
                  ),
                  SizedBox(height: 10,),
                  SizedBox(height: 15,),
                  Text('Project: ${property.projectname}',style: GoogleFonts.play(fontSize: 18),),
                  SizedBox(height: 5,),
                  Text('Car Parking: ${property.carparking}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 5,),
                  Text('Listed By: ${property.listed_by}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Location: ${property.location}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Cabins: ${property.cabins}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Meeting Rooms: ${property.meeting_rooms}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Lift: ${property.lifts}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Type off Office: ${property.office_type}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Lookin for: ${property.looking_for}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Office Capacity (seats): ${property.office_capacity}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Furnishing: ${property.furnishing}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Builtup area(sqft): ${property.builtparea}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Carpet Area: ${property.carpetarea}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Maintenance: ${property.maintenance}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Floor Preference: ${property.floor}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Washrooms: ${property.washrooms}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Project Name: ${property.projectname}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Budget: ${property.budget}',style: GoogleFonts.play(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('About of you Office: ${property.whatusale}',style: GoogleFonts.play(fontSize: 16),),



                ],
              ),

              ),
            ),
          )
        ],
      )
      // Stack(
      //   children:[
      //    Container(
      //      color: Colors.white,
      //    ),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Container(
      //             height: 400,
      //             width: MediaQuery.of(context).size.width,
      //             child: Image.network(
      //               property.image,
      //               fit: BoxFit.cover,
      //
      //           ),
      //         ),
      //
      //
      //
      //         Positioned(
      //           top: 350,
      //           child: Expanded(
      //             child: SingleChildScrollView(
      //               scrollDirection: Axis.vertical,
      //               child: Container(
      //                 width: MediaQuery.of(context).size.width,
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.only(
      //                       topRight: Radius.circular(40),
      //                       topLeft: Radius.circular(40)),
      //                 ),
      //                child: Padding(
      //                   padding: const EdgeInsets.all(10),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       SizedBox(height: 10,),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           Text(
      //                             property.adtitle,
      //                             style: GoogleFonts.play(
      //                               fontSize: 20,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                           Container(
      //
      //                             margin: EdgeInsets.symmetric(horizontal: 15),
      //                             decoration: BoxDecoration(
      //                                 borderRadius: BorderRadius.circular(10),
      //                                 boxShadow: [BoxShadow(color: Colors.greenAccent)]
      //                             ),
      //                             child: Padding(
      //                               padding: const EdgeInsets.all(10),
      //                               child: Text('BookNow'),
      //                             ),
      //                           )
      //
      //                         ],
      //                       ),
      //                       SizedBox(height: 15,),
      //                       Text('Project: ${property.projectname}',style: GoogleFonts.play(fontSize: 18),),
      //                       SizedBox(height: 5,),
      //                       Text('Car Parking: ${property.carparking}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 5,),
      //                       Text('Listed By: ${property.listed_by}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Location: ${property.location}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Cabins: ${property.cabins}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Meeting Rooms: ${property.meeting_rooms}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Lift: ${property.lifts}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Type off Office: ${property.office_type}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Lookin for: ${property.looking_for}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Office Capacity (seats): ${property.office_capacity}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Furnishing: ${property.furnishing}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Builtup area(sqft): ${property.builtuparea}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Carpet Area: ${property.carpetarea}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Maintenance: ${property.maintenance}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Floor Preference: ${property.floor}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Washrooms: ${property.washrooms}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Project Name: ${property.projectname}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('About of you Office: ${property.whatyousale}',style: GoogleFonts.play(fontSize: 16),),
      //                       SizedBox(height: 10,),
      //                       Text('Budget: ${property.budget}',style: GoogleFonts.play(fontSize: 16),),
      //
      //
      //                     ],
      //                   ),
      //                 ),
      //
      //
      //               ),
      //
      //
      //
      //             ),
      //           ),
      //
      //         ),
      //       ],
      //     )
      //
      //
      //     // SingleChildScrollView(
      //     //   scrollDirection: Axis.vertical,
      //     //   child: Column(
      //     //     crossAxisAlignment: CrossAxisAlignment.start,
      //     //     children: [
      //     //
      //     //     ],
      //     //   ),
      //     //
      //     //
      //     // )
      //
      //
      //
      //   ],
      // ),
    );
  }
}
