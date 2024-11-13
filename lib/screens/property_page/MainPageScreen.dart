import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../detailspage.dart';
import 'package:bhoomi_app/property.dart'; // Import the Property model
import 'package:bhoomi_app/property_model.dart'; // Import the Property list
import 'package:get/get.dart';
import 'package:searchbar_animation/searchbar_animation.dart';


class Mainpagescreen extends StatefulWidget {
  @override
  State<Mainpagescreen> createState() => _MainpagescreenState();
}

class _MainpagescreenState extends State<Mainpagescreen> {
  final _formkey=GlobalKey<FormState>();

  final TextEditingController _name=TextEditingController();

  final TextEditingController _number=TextEditingController();

  final TextEditingController _query=TextEditingController();

  List<Property> _filteredProperties = [];

  @override
  void initState() {
    super.initState();
    // _filteredProperties = properties;
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: properties.map((properti){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              height: 300,
              // width: MediaQuery.of(context).size.width,
              width: 450,
              child: Card(
                elevation: 5,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),

                ),
                child: InkWell(
                  onTap: (){
                    Get.to(()=>DetailsPage(property: properti));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(properti.imageUrl,fit: BoxFit.cover,height: 200,width: 400,),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(properti.title,style: GoogleFonts.play(fontSize: 14,fontWeight: FontWeight.bold),),
                            Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CupertinoColors.activeGreen,
                                // boxShadow: [BoxShadow(offset: Offset(11, 8),color: CupertinoColors.activeGreen.withOpacity(10),blurRadius: 10)],

                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text('View Details',style: GoogleFonts.play(fontSize: 13,color: Colors.white),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15,top: 5),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Starting: ${properti.price}',style: GoogleFonts.play(fontSize: 14,),),
                              Text('City: ${properti.location}',style: GoogleFonts.play(fontSize: 14),)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            );
          }).toList(),
        )
        ),

    );
  }
}
