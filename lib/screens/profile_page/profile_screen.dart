import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  var h,w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SafeArea(child:
    Scaffold(body:
    SingleChildScrollView(

        child: Column(children: [

          Stack(children: [
            Container(
              child:
              Padding(
                padding: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://media.gettyimages.com/id/1413884808/photo/business-colleagues-in-a-meeting-or-financial-advisor-or-lawyer-with-couple-explaining-options.jpg?s=1024x1024&w=gi&k=20&c=4hKaBCTUaRdCAA0YEJc7Q7Unrvnj1wyP-V152NZedKw=',
                    height: h * 0.2,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            InkWell(onTap: _pickImage,
              child: Container(
                height: 140,alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(left: 10,right: 10,top: h*0.1),
                child: _image == null?
                CircleAvatar(
                  radius: 50,
                  // _image == null
                  backgroundImage: NetworkImage(
                    'https://tse4.mm.bing.net/th?id=OIP.JDfT7V1NZ91EfaPYzW_rYQHaE8&pid=Api&P=0&h=180',
                  ),
                ): ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(height: 100,width: 100,
                      child: Image.file(_image!)),
                ),
              ),
            ),
            Container(margin: EdgeInsets.only(right: 15,top: 10),
                alignment: Alignment.topRight,
                child: Icon(Icons.edit,color: Colors.white,)),
          ],),


          Stack(children: [
            Container(margin: EdgeInsets.only(left: 15,top: 20),
                alignment: Alignment.topLeft,
                child: Text("Faizal Rizvi",style: TextStyle(fontSize:
                17,fontWeight: FontWeight.bold),)),
            //
            Container(alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(left: 15,top: 43),
                // alignment: Alignment.topLeft,
                child: Text("Property Dealer",style: TextStyle(fontSize:
                14),)),


            InkWell(onTap: (){

            },
              child: Container(alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 15,top: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(height: 40,width: 40,
                    color: Colors.green[800],child:
                    Icon(Icons.add,color: Colors.white,),),
                ),
              ),
            ),

          ],),
          SizedBox(height: 10,),
          Row(children: [

            Container(margin: EdgeInsets.only(left: 15),
                child: Icon(Icons.person_remove_alt_1_sharp,color: Colors.green[800],)),
            Text("   +91xxxxxxxxx")

          ],),

          SizedBox(height: 5,),
          Row(children: [

            Container(margin: EdgeInsets.only(left: 15),
                child: Icon(Icons.email,color: Colors.green[800],)),
            Text("   hr@gmail.com")

          ],),
          SizedBox(height: 10,),
          Row(children: [

            Container(margin: EdgeInsets.only(left: 15),
                child: Icon(Icons.location_on,color: Colors.green[800],)),
            Text("   Noida")

          ],),

          SizedBox(height: 10,),
          Row(children: [

            Container(margin: EdgeInsets.only(left: 15),
                child: Icon(Icons.add_home_work,color: Colors.green[800],)),
            Text("   Property Dealer")

          ],),

          Container(margin: EdgeInsets.only(left: 15,right: 15,top: 10),
              child: Text(" There are many variations ofpassages of lorem ipsum availab.but the majority have suffered.  "))





        ],)
      // Container(child:
      // Column(children: [
      //   SizedBox(height: 10,),
      //   InkWell(onTap: (){
      //     showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return Container(
      //           child: AlertDialog(
      //             title: Text('Rent profile',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      //             content: Text('A fox has been spotted in your area!'),
      //             actions: <Widget>[
      //               TextButton(
      //                 child: Text('OK'),
      //                 onPressed: () {
      //                   Navigator.of(context).pop();
      //                 },
      //               ),
      //             ],
      //           ),
      //         );
      //       },
      //     );
      //   },
      //
      //     child: Container(
      //         height: h * 0.1,
      //         width: double.infinity,
      //         child: Row(
      //           children: [
      //             Container( margin: EdgeInsets.only(left: 10,right: 10),
      //               height: 60,width: 60,
      //               child: ClipOval(
      //                 child: Image.network('https://img.freepik.com/premium-vector/vector-design-house-rent-icon-style_1134108-89092.jpg?w=740',
      //                   width: 100,
      //                   height: 100,
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //             ),
      //             Column(
      //               children: [
      //
      //                 Container(margin: EdgeInsets.only(top: 15),
      //                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Container(width: w *0.6,
      //                             child: Text("Rent profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
      //                         Container(margin: EdgeInsets.only(right: 5),
      //                             child: Text("  VIEW",style: TextStyle(color: Colors.grey,fontSize: 13),)),
      //                       ],
      //                     )),
      //                 Container(width: w *0.7,
      //                   alignment: Alignment.topLeft,
      //                   margin: EdgeInsets.only(top: 5),
      //                   child: Text(
      //                       "Create or update your renter profile",style: TextStyle(color: Colors.grey,fontSize: 12)),
      //                 ),
      //
      //               ],
      //             ),
      //           ],
      //         )),
      //   ),
      //
      //   Container(
      //       height: h * 0.1,
      //       width: double.infinity,
      //       child: Row(
      //         children: [
      //           Container( margin: EdgeInsets.only(left: 10,right: 10),
      //             height: 60,width: 60,
      //             child: ClipOval(
      //               child: Image.network(
      //                 'https://img.freepik.com/free-vector/investor-with-laptop-monitoring-growth-dividends-trader-sitting-stack-money-investing-capital-analyzing-profit-graphs-vector-illustration-finance-stock-trading-investment_74855-8432.jpg?w=740&t=st=1721892935~exp=1721893535~hmac=de615071cf287b94b940637a5ef889e4aaa65a07559a1c0a1df2b229f52d8dab',
      //                 width: 100,
      //                 height: 100,
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //           Column(
      //             children: [
      //               Container(margin: EdgeInsets.only(top: 15),
      //                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(width: w * 0.6,
      //                           child: Text("My Finance",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
      //                       Container(margin: EdgeInsets.only(right: 5),
      //                           child: Text("  VIEW",style: TextStyle(color: Colors.grey,fontSize: 13),)),
      //                     ],
      //                   )),
      //               Container(width: w * 0.7,
      //                 alignment: Alignment.topLeft,
      //                 margin: EdgeInsets.only(top: 5),
      //                 child: Text(
      //                     " Update your date and view your home loan approvals",style: TextStyle(color: Colors.grey,fontSize: 12)),
      //               ),
      //
      //             ],
      //           ),
      //         ],
      //       )),
      //
      //   Container(
      //       height: h * 0.1,
      //       width: double.infinity,
      //       child: Row(
      //         children: [
      //           Container( margin: EdgeInsets.only(left: 10,right: 10),
      //             height: 60,width: 60,
      //             child: ClipOval(
      //               child: Image.network(
      //                 'https://img.freepik.com/free-vector/apartment-rent-concept-illustration_114360-3893.jpg?w=740&t=st=1721892828~exp=1721893428~hmac=bcbc6c6c73a4f43e22df2af153864fbc3d49e5c7a38fc5d690e9ecc256bb5218',
      //                 width: 100,
      //                 height: 100,
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //           Column(
      //             children: [
      //               Container(margin: EdgeInsets.only(top: 15),
      //                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(width: w * 0.6,
      //                           child: Text("Guides",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
      //                       Container(margin: EdgeInsets.only(right: 5),
      //                           child: Text("  VIEW",style: TextStyle(color: Colors.grey,fontSize: 13),)),
      //                     ],
      //                   )),
      //               Container(width: w * 0.7,
      //                 alignment: Alignment.topLeft,
      //                 margin: EdgeInsets.only(top: 5),
      //                 child: Text(
      //                     "View our comprehensive guides and take control of your property journey",style: TextStyle(color: Colors.grey,fontSize: 12)),
      //               ),
      //
      //             ],
      //           ),
      //         ],
      //       )),
      //
      //   Container(
      //       height: h * 0.1,
      //       width: double.infinity,
      //       child: Row(
      //         children: [
      //           Container( margin: EdgeInsets.only(left: 10,right: 10),
      //             height: 60,width: 60,
      //             child: ClipOval(
      //               child: Image.network(
      //                 'https://img.freepik.com/free-vector/house-sale-hand-drawn-design_23-2148647001.jpg?w=740&t=st=1721892731~exp=1721893331~hmac=19f7570ab103a6c241d5a483cbaa087d37ad2c9a8d444c690430566c8afc9ed4',
      //                 width: 100,
      //                 height: 100,
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //           Column(
      //             children: [
      //               Container(margin: EdgeInsets.only(top: 15),
      //                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(width: w * 0.6,
      //                           child: Text("Explore Suburbs",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
      //                       Container(margin: EdgeInsets.only(right: 5),
      //                           child: Text("  VIEW",style: TextStyle(color: Colors.grey,fontSize: 13),)),
      //                     ],
      //                   )),
      //               Container(width: w * 0.7,
      //                 alignment: Alignment.topLeft,
      //                 margin: EdgeInsets.only(top: 5),
      //                 child: Text(
      //                     "Create or update your renter profile",style: TextStyle(color: Colors.grey,fontSize: 12)),
      //               ),
      //
      //             ],
      //           ),
      //         ],
      //       )),
      //
      //   Container(
      //       height: h * 0.1,
      //       width: double.infinity,
      //       child: Row(
      //         children: [
      //           Container( margin: EdgeInsets.only(left: 10,right: 10),
      //             height: 60,width: 60,
      //             child: ClipOval(
      //               child: Image.network(
      //                 'https://img.freepik.com/free-vector/house-rent-abstract-concept-vector-illustration-booking-house-online-best-rental-property-real-estate-service-accommodation-marketplace-rental-listing-monthly-rent-abstract-metaphor_335657-1954.jpg',
      //                 width: 100,
      //                 height: 100,
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //           Column(
      //             children: [
      //               Container(margin: EdgeInsets.only(top: 15),
      //                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(width: w * 0.6,
      //                           child: Text("Rental application",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
      //                       Container(margin: EdgeInsets.only(right: 5),
      //                           child: Text("  VIEW",style: TextStyle(color: Colors.grey,fontSize: 13),)),
      //                     ],
      //                   )),
      //               Container(width: w * 0.7,
      //                 alignment: Alignment.topLeft,
      //                 margin: EdgeInsets.only(top: 5),
      //                 child: Text(
      //                     "Check the status and view your renal",style: TextStyle(color: Colors.grey,fontSize: 12)),
      //               ),
      //
      //             ],
      //           ),
      //         ],
      //       )),
      //
      //   InkWell(onTap: (){
      //     Get.to(() => return_to_home());
      //   },
      //     child: Container(
      //         height: 90,
      //         width: double.infinity,
      //         child: Row(
      //           children: [
      //             Container( margin: EdgeInsets.only(left: 10,right: 10),
      //               height: 60,width: 60,
      //               child: ClipOval(
      //                 child: Image.network(
      //                   'https://assets-news.housing.com/news/wp-content/uploads/2022/02/09115440/Rent-receipt-Why-is-it-needed-for-HRA-exemption-FB-1200x700-compressed.jpg',
      //                   width: 100,
      //                   height: 100,
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //             ),
      //             Column(
      //               children: [
      //                 Container(margin: EdgeInsets.only(top: 15),
      //                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Container(width: 150,
      //                             child: Text("My rental listings",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)),
      //                         Container(margin: EdgeInsets.only(left: 60),
      //                             child: Text("  VIEW",style: TextStyle(color: Colors.grey,fontSize: 13),)),
      //                       ],
      //                     )),
      //                 Container(width: 250,
      //                   alignment: Alignment.topLeft,
      //                   margin: EdgeInsets.only(top: 5),
      //                   child: Text(
      //                       "Create or update your renter profile",style: TextStyle(color: Colors.grey,fontSize: 12)),
      //                 ),
      //
      //               ],
      //             ),
      //           ],
      //         )),
      //   ),
      //
      //
      //
      //
      //
      //
      //
      // ],),),
    ),));
  }
}
