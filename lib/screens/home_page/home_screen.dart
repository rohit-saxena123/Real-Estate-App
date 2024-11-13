import 'dart:convert';

import 'package:bhoomi_app/screens/home_page/Adapter_office.dart';
import 'package:bhoomi_app/screens/home_page/Office_details.dart';
import 'package:bhoomi_app/screens/home_page/PropertyPost_form/property_post_form.dart';
import 'package:bhoomi_app/screens/home_page/datadetails_item.dart';
import 'package:bhoomi_app/screens/home_page/datalist_page.dart';
import 'package:bhoomi_app/screens/home_page/office_dashboard/Office_section.dart';
import 'package:bhoomi_app/screens/home_page/property_listing_page/Model_property_listing/property_model.dart';
import 'package:bhoomi_app/screens/home_page/property_listing_page/PropertyDetails_Page.dart';
import 'package:bhoomi_app/screens/home_page/property_listing_page/chooseFile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:http/http.dart' as http;



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future<List<property_listing>> fetchData() async{
  //
  //   try{
  //
  //     // return [
  //     //   PropertyListing(furnishing: 'Furnished', id: '1'),
  //     //   PropertyListing(furnishing: 'Semi-Furnished', id: '2'),
  //     // ];
  //     final response = await http.get(Uri.parse('https://bhoomitherealestate.com/client/PropertyForm/property_listing.php'));
  //
  //     if(response.statusCode == 200){
  //       List<dynamic> data =json.decode(response.body);
  //       return data.map((json) => property_listing.fromJson(json)).toList();
  //
  //
  //
  //     }else {
  //       throw Exception('failed to load data ');
  //
  //     }
  //
  //   }catch(e){
  //
  //   }
  //
  //
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<List<property_listing>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://bhoomitherealestate.com/client/PropertyForm/property_listing.php'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => property_listing.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Print the error for debugging purposes
      print('Error: $e');
      // Return an empty list or handle it based on your requirement
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final isVisibleText = false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColorLight: Colors.green[800],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.green[800],
          )),
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Text('Hello',
                                  style: GoogleFonts.play(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )),
                              Text(' Dear',
                                  style: GoogleFonts.play(
                                    color: Colors.green[800],
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 130,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 10),
                          enlargeCenterPage: true,
                        ),
                        items: [
                          Card(
                            elevation: 0.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  height: 155,
                                  width: 270,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "https://estateacresjaipur.com/admin/uploads/18773664181574619179hero-1.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  // decoration:BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(20),
                                  //   gradient: LinearGradient(
                                  //     colors: [Colors.black,Colors.white30],
                                  //     end: Alignment.bottomLeft,
                                  //     begin: Alignment.topLeft,
                                  //   ),
                                  //   image: DecorationImage(
                                  //     image: NetworkImage("https://tse2.mm.bing.net/th?id=OIP.qZp-dM-14rttj86O0jVR0AHaE8&pid=Api&P=0&h=180"),
                                  //     fit: BoxFit.cover,
                                  //     colorFilter: ColorFilter.mode(
                                  //         Colors.black.withOpacity(0.3),
                                  //         BlendMode.darken)
                                  //   )
                                  //
                                  //
                                  //
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.white12,
                                            Colors.black
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight)),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Luxury Apartment ',
                                          style: GoogleFonts.play(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Luxury apartment bo bhi apke budget mai ',
                                          style: GoogleFonts.play(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Card(
                            elevation: 0.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: 260,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "https://estateacresjaipur.com/admin/uploads/717218338879037309hero-3.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  // decoration:BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(20),
                                  //   gradient: LinearGradient(
                                  //     colors: [Colors.black,Colors.white30],
                                  //     end: Alignment.bottomLeft,
                                  //     begin: Alignment.topLeft,
                                  //   ),
                                  //   image: DecorationImage(
                                  //     image: NetworkImage("https://tse2.mm.bing.net/th?id=OIP.qZp-dM-14rttj86O0jVR0AHaE8&pid=Api&P=0&h=180"),
                                  //     fit: BoxFit.cover,
                                  //     colorFilter: ColorFilter.mode(
                                  //         Colors.black.withOpacity(0.3),
                                  //         BlendMode.darken)
                                  //   )
                                  //
                                  //
                                  //
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.white12,
                                            Colors.black
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight)),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Best Houese ',
                                          style: GoogleFonts.play(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Elevate Your Life with Our Prestigious Luxury House.',
                                          style: GoogleFonts.play(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Card(
                            elevation: 0.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: 260,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "https://tse3.mm.bing.net/th?id=OIP.TDmmc4A7TjeH5oe4qNXgpQHaEJ&pid=Api&P=0&h=180",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  // decoration:BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(20),
                                  //   gradient: LinearGradient(
                                  //     colors: [Colors.black,Colors.white30],
                                  //     end: Alignment.bottomLeft,
                                  //     begin: Alignment.topLeft,
                                  //   ),
                                  //   image: DecorationImage(
                                  //     image: NetworkImage("https://tse2.mm.bing.net/th?id=OIP.qZp-dM-14rttj86O0jVR0AHaE8&pid=Api&P=0&h=180"),
                                  //     fit: BoxFit.cover,
                                  //     colorFilter: ColorFilter.mode(
                                  //         Colors.black.withOpacity(0.3),
                                  //         BlendMode.darken)
                                  //   )
                                  //
                                  //
                                  //
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.white12,
                                            Colors.black
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight)),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'House',
                                          style: GoogleFonts.play(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Transform Your Workspace with Our Premium Luxury House Solutions.',
                                          style: GoogleFonts.play(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Card(
                          //   elevation: 0.5,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          //   child: Stack(
                          //     children: [
                          //       Container(
                          //         height: 150,
                          //         width: 260,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(20),
                          //           image: DecorationImage(
                          //               image: NetworkImage(
                          //                 "https://tse4.mm.bing.net/th?id=OIP.6wf_kvC0ZQil4uabrLsyFgHaFE&pid=Api&P=0&h=180",
                          //               ),
                          //               fit: BoxFit.cover),
                          //         ),
                          //         // decoration:BoxDecoration(
                          //         //   borderRadius: BorderRadius.circular(20),
                          //         //   gradient: LinearGradient(
                          //         //     colors: [Colors.black,Colors.white30],
                          //         //     end: Alignment.bottomLeft,
                          //         //     begin: Alignment.topLeft,
                          //         //   ),
                          //         //   image: DecorationImage(
                          //         //     image: NetworkImage("https://tse2.mm.bing.net/th?id=OIP.qZp-dM-14rttj86O0jVR0AHaE8&pid=Api&P=0&h=180"),
                          //         //     fit: BoxFit.cover,
                          //         //     colorFilter: ColorFilter.mode(
                          //         //         Colors.black.withOpacity(0.3),
                          //         //         BlendMode.darken)
                          //         //   )
                          //         //
                          //         //
                          //         //
                          //       ),
                          //       Container(
                          //         decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20),
                          //             gradient: LinearGradient(
                          //                 colors: [
                          //                   Colors.white12,
                          //                   Colors.black
                          //                 ],
                          //                 begin: Alignment.topLeft,
                          //                 end: Alignment.bottomRight)),
                          //       ),
                          //       Align(
                          //         alignment: Alignment.centerRight,
                          //         child: Padding(
                          //           padding: EdgeInsets.all(15),
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.end,
                          //             children: [
                          //               Text(
                          //                 'Best Office ',
                          //                 style: GoogleFonts.play(
                          //                     fontSize: 18,
                          //                     color: Colors.white,
                          //                     fontWeight: FontWeight.bold),
                          //               ),
                          //               Text(
                          //                 'Step into Sophisticated Luxury with Our Premier Office Offerings.',
                          //                 style: GoogleFonts.play(
                          //                   fontSize: 14,
                          //                   color: Colors.white,
                          //                 ),
                          //                 textAlign: TextAlign.end,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),

                      SizedBox(height: 10,),

                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            'Category',
                            style: GoogleFonts.play(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => Office_section());
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.8),
                                        Colors.green
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(8, 4),
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.3),
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Icon(
                                      Icons.home_work,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Office',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.8),
                                      Colors.green
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(8, 4),
                                      blurRadius: 20,
                                      color: Colors.black.withOpacity(0.3),
                                    )
                                  ],
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Icon(
                                      Icons.apartment,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      'Apartment',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // agar user login hai to bo direct chala jaye post property mai
                                // else
                                //  agar user login nhi hai to bo pehle login hoga then
                                Get.to(() =>chooseFile());
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 70,
                                width: 150,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.8),
                                        Colors.green
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(8, 4),
                                        blurRadius: 20,
                                        color: Colors.black.withOpacity(0.3),
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.person,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                      '    Post Property',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Office Space Property',
                              style: GoogleFonts.play(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black87),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                'View All',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              )),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(
                          decelerationRate: ScrollDecelerationRate.normal
                        ),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: datalist.map((data) {
                            return Container(
                              width: 200, // Adjust width as needed
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => DatadetailsItem(data: data));
                            
                                    // Navigator.pushReplacement(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           DatadetailsItem(data: data)),
                                    // );
                                  },
                                  child: Hero(
                                    
                                    tag: 'hero-tag$data',
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.network(
                                            data.imageUrl[0] ,
                                            fit: BoxFit.cover,
                                            height: 140,
                                            width:
                                            MediaQuery.of(context).size.width,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    data.name,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    data.place,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                '₹ ${ data.budget}',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 80,
                                                    height: 30,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Scaffold()),
                                                        );
                                                      },
                                                      child: Text(
                                                        'View Details',
                                                        style: TextStyle(
                                                            fontSize: 9,color:Colors.green),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      Container(
                        height: 310,
                        width: 400,
                        color: Colors.grey[300],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(13),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Office, Apartment Available',
                                      style: GoogleFonts.play(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'There we have many type Apartment,Office, ',
                                      style: GoogleFonts.play(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Stack(children: [
                              // Image
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Image.network(
                                  'https://img.freepik.com/premium-photo/green-office-chair-with-green-plant-corner_657790-14851.jpg?w=1060',
                                  // 'https://media.gettyimages.com/id/1413884808/photo/business-colleagues-in-a-meeting-or-financial-advisor-or-lawyer-with-couple-explaining-options.jpg?s=1024x1024&w=gi&k=20&c=4hKaBCTUaRdCAA0YEJc7Q7Unrvnj1wyP-V152NZedKw=',
                                  height: 200,
                                  width: 384,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Container(
                              //   height: 220,
                              //   width: 384,
                              //   color: Colors.black.withOpacity(0.5), // Adjust opacity here
                              // ),

                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 200,
                                    width: 374,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                heightFactor: 3,
                                child: Text(
                                  'FOR OFFICE, APARTMENT',
                                  style: GoogleFonts.play(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight
                                          .bold // White color for visibility
                                      ),
                                ),
                              ),

                              Align(
                                heightFactor: 2,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Text(
                                    '" Our company offers the best office spaces with modern amenities, situated in prime locations. We provide spaces designed to perfectly meet your business needs."',
                                    style: GoogleFonts.play(
                                        fontSize: 14, color: Colors.white),
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              )
                              // Blur effect with white overlay
                            ]),
                            // Animated Text
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(
                          decelerationRate: ScrollDecelerationRate.normal,

                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: officelist.map((office) {
                            return Container(
                              height: 300,
                              width: 200,
                              margin: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    office.imageUrl.isNotEmpty ? office.imageUrl[0] :'',
                                      // "https://tse3.mm.bing.net/th?id=OIP.d6OjfMXER5gNoEScufjlTwHaDf&pid=Api&P=0&h=180",
                                      ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  // Gradient overlay with opacity
                                  Container(
                                    height: 300,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.8)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomLeft,
                                      ),
                                    ),
                                  ),
                                  // Text at the bottom
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            office.heading,
                                            style: GoogleFonts.play(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            office.text,
                                            style: GoogleFonts.play(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),

                                          //  Offstage(offstage:true,
                                          //      child: Column(
                                          //        crossAxisAlignment: CrossAxisAlignment.start,
                                          //        children: [
                                          //          Text('data'),
                                          //          Text('data'),
                                          //          Text('data'),
                                          //          Text('data'),
                                          //        ],
                                          //      )

                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => OfficeDetails(
                                            data: office,
                                          ));
                                    },
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      heightFactor: 9,
                                      widthFactor: 4.7,
                                      child: Transform.translate(
                                        offset: Offset(17, 8),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.green,
                                          radius: 20,
                                          child: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(), // <-- Add toList() here
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      // Material(
                      //   elevation: 0.5,
                      //   borderRadius: BorderRadius.circular(10),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(10),
                      //     child: Center(
                      //       child: Container(
                      //         width: MediaQuery.of(context).size.width,
                      //         padding: EdgeInsets.all(16.0),
                      //         decoration: BoxDecoration(
                      //             gradient: LinearGradient(
                      //               colors: [
                      //                 Colors.black87,
                      //                 Colors.green
                      //               ],
                      //               begin: Alignment.topLeft,
                      //               end: Alignment.bottomRight,
                      //             ),
                      //             borderRadius: BorderRadius.circular(10),
                      //             boxShadow: [
                      //               BoxShadow(
                      //                 offset: Offset(5, 5),
                      //                 blurRadius: 5,
                      //                 color:
                      //                     Colors.green.withOpacity(0.4),
                      //               )
                      //             ]),
                      //         child: Column(
                      //           children: [
                      //             Text(
                      //               'Office Space Excellence',
                      //               style: GoogleFonts.play(
                      //                 fontSize: 22,
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Colors.white,
                      //               ),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //             Text(
                      //               'Bhoomi The Real Estate',
                      //               style: GoogleFonts.play(
                      //                   fontSize: 20,
                      //                   color: Colors.white),
                      //             ),
                      //             Text(
                      //               'At Bhoomi The Real Estate, we take pride in offering the finest office spaces in the most sought-after sectors. Our commitment is to provide exceptional office environments that perfectly align with your business needs and aspirations.',
                      //               style: GoogleFonts.play(
                      //                   fontSize: 16,
                      //                   color: Colors.white),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // //   some content with image;
                      //
                      // SizedBox(
                      //   height: 60,
                      // ),
                      //
                      // // problam yaha hai ki ye screen ko hold krke rkha hai ise theek krna hoga

                      // SingleChildScrollView(
                      //   scrollDirection: Axis.vertical,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [

                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Office Spaces',
                          style: GoogleFonts.play(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      )),
                      Container(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        // height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: FutureBuilder<List<property_listing>>(
                          future: fetchData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else {
                              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                                return Container(
                                  // height: MediaQuery.of(context).size.height, // Provide height constrain
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      reverse: true,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        var property = snapshot.data![index];
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(
                                                () => PropertydetailsPage(property: property),
                                                transition: Transition.fadeIn);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.grey.shade300,
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color:
                                                        Colors.grey.shade300),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                height: 240,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8,
                                                              left: 5,
                                                              right: 5),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          // boxShadow: [BoxShadow(offset: Offset(10,10))]
                                                        ),
                                                        child: Image.network(
                                                          property.image,
                                                          height: 170,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          fit: BoxFit.fitWidth,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10),
                                                          child: Text(
                                                            property.adtitle,
                                                            style: GoogleFonts.play(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          property.projectname,
                                                          style:
                                                              GoogleFonts.play(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18),
                                                        ),
                                                      ],
                                                    ),
                                                    Flexible(
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Maintenance: ${property.maintenance}',
                                                                  style: GoogleFonts.play(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                  'sqft:${property.builtparea}',
                                                                  style: GoogleFonts
                                                                      .play(
                                                                          fontSize:
                                                                              10),
                                                                ),
                                                              ],
                                                            ))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                );
                              } else {
                                return Center(child: Text('No Data Found'));
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  )),
              // Image// Animated Text
            ],
          ),
        ),
      ),
    );
  }
}
