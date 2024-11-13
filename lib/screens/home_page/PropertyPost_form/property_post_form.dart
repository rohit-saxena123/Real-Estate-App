import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';

// import 'dart:js_interop';

import 'package:bhoomi_app/main.dart';
import 'package:bhoomi_app/screens/home_page/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PropertyPostForm extends StatefulWidget {
  @override
  State<PropertyPostForm> createState() => _PropertyPostFormState();
}

class _PropertyPostFormState extends State<PropertyPostForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  File? _selectedImages;

  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _furnishing = TextEditingController();
  final TextEditingController _Listed_by = TextEditingController();
  final TextEditingController _builtp_area = TextEditingController();
  final TextEditingController _carpet_ara = TextEditingController();
  final TextEditingController _maintenance = TextEditingController();
  final TextEditingController _car_parking = TextEditingController();
  final TextEditingController _washrooms = TextEditingController();
  final TextEditingController _project_name = TextEditingController();
  final TextEditingController _Ad_title = TextEditingController();
  final TextEditingController whatyousale = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _cabins = TextEditingController();
  final TextEditingController _meetingrooms = TextEditingController();
  final TextEditingController _lifts = TextEditingController();
  final TextEditingController _officetype = TextEditingController();
  final TextEditingController _lookingfor = TextEditingController();
  final TextEditingController _capacity = TextEditingController();
  final TextEditingController _budget = TextEditingController();
  final TextEditingController _floor = TextEditingController();

  final picker = ImagePicker();

  Future<void> _pickImage() async {

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImages = File(pickedFile.path);
      });
    }
  }
  // List<File> _selectedImages = [];
  //
  // Future<void> _pickImages() async {
  //   final picker = ImagePicker();
  //   final pickedFiles = await picker.pickMultiImage();
  //
  //   if (pickedFiles != null) {
  //     setState(() {
  //       _selectedImages = pickedFiles.map((file) => File(file.path)).toList();
  //     });
  //   }
  // }



  // List<File> _multipleimages =[];



  Future<void> sendData() async {
    try {

      // if(_selectedImages.isEmpty) return;

      // ye url baha se liya gya hai jaha phpfile host hui hai baha se ye poora url get ho jayega okhe boss
      final url = Uri.parse('https://bhoomitherealestate.com/client/PropertyForm/Property_form.php');
      var request = http.MultipartRequest('POST', url);

      // Form fields ko request ke body mein add karo
      request.fields['furnishing'] = _furnishing.text;
      request.fields['listed_by'] = _Listed_by.text;
      request.fields['builtuparea'] = _builtp_area.text;
      request.fields['carpetarea'] = _carpet_ara.text;
      request.fields['maintenance'] = _maintenance.text;
      request.fields['carparking'] = _car_parking.text;
      request.fields['washrooms'] = _washrooms.text;
      request.fields['projectname'] = _project_name.text;
      request.fields['adtitle'] = _Ad_title.text;
      request.fields['whatyousale'] = whatyousale.text;
      request.fields['location'] = _location.text;
      request.fields['cabins'] = _cabins.text;
      request.fields['meeting_rooms'] = _meetingrooms.text;
      request.fields['lifts'] = _lifts.text;
      request.fields['office_type'] = _officetype.text;
      request.fields['looking_for'] = _lookingfor.text;
      request.fields['office_capacity'] = _capacity.text;
      request.fields['budget'] = _budget.text;
      request.fields['floor'] = _floor.text;

      // yaha log krake check krna hai ki kya kya data ja rha hai ya koi bhi nhi ja rha hai

      print('Form Data: ${request.fields}');



      if(_selectedImages !=null) {
        request.files.add(await http.MultipartFile.fromPath('image', _selectedImages!.path));
      }
      //
      //
      // for (var image in _selectedImages) {
      //   request.files.add(await http.MultipartFile.fromPath('images[]', image.path));
      // }

      // Send the request

      var response = await request.send();

      if (response.statusCode == 200) {
        var responsecode = await response.stream.bytesToString();
        print('Response code: $responsecode');
        print('statuscode ${response.statusCode}');
        Fluttertoast.showToast(
          msg: "Data sent successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          textColor: Colors.green,
        );

        _Success(); // Ensure this function shows a dialog or UI element
      } else {
        var responseBody = await response.stream.bytesToString();
        print('Failed with statusCode ${response.statusCode}');
        print('Response body: $responseBody');
        print('statusCode ${response.statusCode}');
        Fluttertoast.showToast(
          msg: "Failed to send data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          textColor: Colors.red,
        );

        _Faild(); // Ensure this function shows a dialog or UI element
      }
    } catch (e) {
      print('Error: $e');
      Fluttertoast.showToast(
        msg: "Error: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        textColor: Colors.red,
      );
    }
  }

  void _Success(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Success'),
            content: Text('your data send and wait 20 horse for review your property'),
            actions: [

              TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, child: Text('Okhe',style: GoogleFonts.play()),
              )
            ],
          );
        });
  }
  void _Faild(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Failed s'),
            content: Text('some reason here to faild send data '),
            actions: [
              TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Okhe')),
            ],
          );
        });
  }
  void _showListed() async{
    final selectValue = await
    showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            children: <Widget>[
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Owner');
                },child: Text('Owner'),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Dealer');
                },child: Text('Dealer'),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Builder');
                },child: Text('Builder'),
              ),
            ],
          );
        });
    if(selectValue != null){
      setState(() {
        _Listed_by.text = selectValue;
      });
    }
  }
  void _showmainten() async{
    final selectValue = await

    showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            children: <Widget>[
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Including all');
                },child: Text('Including all'),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'included some');
                },child: Text('included some'),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Not included');
                },child: Text('Not included'),
              ),
            ],
          );
        });
    if(selectValue != null){
      setState(() {
        _maintenance.text = selectValue;
      });
    }
  }
  void _showcarpark() async{
    String? selectValue = await
    showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            children: <Widget>[
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Available ');
                },child: Text('Available'),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Not Available');
                },child: Text('Not Available'),
              ),
            ],
          );
        });
    if(selectValue != null){
      setState(() {
         _car_parking.text= selectValue;
      });
    }
  }
  void _showFloor() async {
    final selectValue = await showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Ground Floor');
                  },child: Text('Ground Floor'),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Top Floor');
                },child: Text('Top Floor'),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Other Floor');
                },child: Text('Other Floor'),
              )
            ],
            
          );
        });
    if(selectValue != null){
      _floor.text = selectValue;
    }
  }
void _showDialog() async{
    String? selectValue = await showDialog<String>(
        context: context,
        builder: (context){
          return SimpleDialog(
            children:<Widget> [
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Un-Furnished');
                },child: Text('Un-Furnished'),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Semi-Furnished');
                },child: Text('Semi-Furnished'),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Fully-Furnished');
                },child: Text('Fully-Furnished'),
              )
            ],
          );
        }
        );
    if(selectValue != null){
      setState(() {
        _furnishing.text=selectValue;
      });
    }



}
void _showmeetingR() async {
    final selectValue = await showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Available');
                },child: Text('Available'),
              ),

              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Not Available');
                },child: Text('Not Available'),

              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Conference Available');
                },child: Text('Conference Available'),
              )
            ],
          );
        });
    if (selectValue != null){
      _meetingrooms.text = selectValue;
    }
}
void _showlookfor() async {
    String? selectValue = await showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Rent');
                },child: Text('Rent'),
              ),
            SimpleDialogOption(
              onPressed: (){
                Navigator.pop(context,'Lease');
              },child: Text('Lease'),
            )
            ],
          );

        });
    if(selectValue != null){
      _lookingfor.text = selectValue;
    }
  }
  void _showLifts() async {
    String? selectValue =  await showDialog(
        context: context,
        builder: (context){
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Lift Available');
                },child: Text('Lift Available '),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context,'Lift not Available');
                },child: Text('Lift not Available'),
              )
            ],
          );
        });

    if(selectValue !=null){
      _lifts.text = selectValue;
    }

  }
  void _showOfficetype() async {
    String? selectValue = await showDialog(context: context, builder: (context){
      return SimpleDialog(
        children: [
          SimpleDialogOption(onPressed: (){ Navigator.pop(context,'Ready to move');},child: Text('Ready to move'),),
          SimpleDialogOption(onPressed:(){ Navigator.pop(context,'Co-working');},child: Text('Co-working'),),
        ],
      );
    });
    if(selectValue != null){
      _officetype.text = selectValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Include some details',
            style: GoogleFonts.play(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          // actions: [
          //
          //
          //   // IconButton(onPressed:(){
          //   //   showModalBottomSheet(
          //   //       context: context,
          //   //       builder: (context){
          //   //         return Container(
          //   //           height: height,
          //   //           width:  width,
          //   //           child: Text('BottomLayout'),
          //   //         );
          //   //       });
          //   // },
          //   //     icon: Icon(Icons.keyboard_double_arrow_up_outlined))
          // ],
        ),

        body: Stack(
            children: [
          SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    //
                    // location

                    TextFormField(
                      controller: _location,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Location',
                        hintText: 'Type.. office location ?',
                        contentPadding: EdgeInsets.only(left: 10),
                        labelStyle: TextStyle(color: CupertinoColors.activeGreen),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.green,width: 2),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                        ),
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'Please Enter';
                        } return null;
                      },
                      
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // cabin
                    TextFormField(
                      controller: _cabins,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Cabins',
                        hintText: 'No. of Cabin ?',
                        contentPadding: EdgeInsets.only(left: 10),
                        labelStyle: TextStyle(color: CupertinoColors.activeGreen),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color:CupertinoColors.activeGreen,width: 2 ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                        ),
                      ),
                      validator: (value){
                        if(value ==null || value.isEmpty){
                          return 'Please Enter';
                        } return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // meeting rooms
                    GestureDetector(
                      onTap: (){
                        _showmeetingR();
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _meetingrooms,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'Meeting Rooms',
                            hintText: 'Available or not ',
                            contentPadding: EdgeInsets.only(left: 10),
                            labelStyle: TextStyle(color: CupertinoColors.activeGreen),
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2,),
                            ),
                          ),
                          validator:  (value){
                            if(value ==  null || value.isEmpty){
                              return 'Please Enter ';
                            }return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // lift

                    GestureDetector(
                      onTap: (){
                        _showLifts();
                      },
                      child: AbsorbPointer(

                        child: TextFormField(
                          controller: _lifts,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText : 'Lift',
                            hintText: 'Available or not ?',
                            contentPadding: EdgeInsets.only(left: 10),
                            labelStyle: TextStyle(color: CupertinoColors.activeGreen),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                            )
                          ),

                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Please Enter details';
                            }return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // floor preference
                    // InkWell(
                    //   onTap: _showDialog,
                    //   child:
                    // office type
                    GestureDetector(
                      onTap: (){
                        _showOfficetype();
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _officetype,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Type of Office ',
                            hintText: 'Ready to move, Co-working, ?',
                            contentPadding: EdgeInsets.only(left: 10),
                            labelStyle: TextStyle(wordSpacing: 1,color: CupertinoColors.activeGreen),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                            )
                          ),
                          validator:  (value){
                            if (value == null || value.isEmpty){
                              return 'Please Enter details';
                            }return null;
                          },
                        ),
                      ),
                    ),

                    // loooking for
                    SizedBox(
                      height: 10,
                    ),

                    GestureDetector(
                      onTap: (){
                        _showlookfor();
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _lookingfor,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'Looking for ',
                              hintText: 'Rent Lease',
                              contentPadding: EdgeInsets.only(left: 10),
                              labelStyle: TextStyle(wordSpacing: 1,color: CupertinoColors.activeGreen),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                              )
                          ),
                          validator:  (value){
                            if(value == null || value.isEmpty){
                              return 'Please Enter details';
                            }return null;
                          },

                        ),
                      ),
                    ),

                    // office capacity
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _capacity,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: CupertinoColors.activeGreen),
                        labelText: 'Office Capacity',
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Number of Seats',
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: CupertinoColors.activeGreen,)
                        )
                      ),
                    ),



                    SizedBox(
                      height: 10,
                    ),

                      // furnishsing

                      GestureDetector(
                        onTap: _showDialog,
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _furnishing,
                            keyboardType: TextInputType.text,
                            textDirection: TextDirection.ltr,
                            decoration: InputDecoration(
                                labelText: 'Furnishing',
                                hintText: 'Enter Furnishing',
                                contentPadding: EdgeInsets.only(left: 10),
                                labelStyle:TextStyle(color: CupertinoColors.activeGreen) ,
                                border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 0.2,
                                      color: Colors.green,
                                      style: BorderStyle.none),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.green,width: 2),
                                ),


                            ),
                            validator: (value){
                              if(value==null ||value.isEmpty){
                                return "please enter furnishing";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),

                    // ),
                    SizedBox(
                      height: 10,
                    ),

                    // Listed by



                    GestureDetector(
                      onTap: (){
                        _showListed();
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _Listed_by,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'Listed By',
                              hintText: 'Owner, Builder, Dealer',
                              contentPadding: EdgeInsets.only(left: 10),
                              labelStyle:TextStyle(color: CupertinoColors.activeGreen) ,
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),

                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.green,
                                    style: BorderStyle.none),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: CupertinoColors.activeGreen,width:2 ),
                              )
                          ),
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return "please enter";
                            }return null;
                          },
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    // sqft

                    TextFormField(
                      controller: _builtp_area,
                      keyboardType: TextInputType.text,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                          labelText: 'builtup area',
                          labelStyle:TextStyle(color: CupertinoColors.activeGreen) ,
                          hintText: 'Enter builtep (sqft)',
                          contentPadding: EdgeInsets.only(left: 10),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 0.2,
                                color: Colors.green,
                                style: BorderStyle.none),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.green,width: 2),
                          )
                      ),
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return "Please Enter";
                        }return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // carpet area
                    TextFormField(
                      controller: _carpet_ara,
                      keyboardType: TextInputType.text,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                          labelText: 'Carpet Area',
                          hintText: 'Enter Carpet Area',
                          contentPadding: EdgeInsets.only(left: 10),
                          labelStyle:TextStyle(color: CupertinoColors.activeGreen) ,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 0.2,
                                color: Colors.green,
                                style: BorderStyle.none),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.green,width: 2),
                          )
                      ),
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return "Please Enter";
                        }return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // maintenance

                    GestureDetector(
                      onTap: (){
                        _showmainten();
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _maintenance,
                          keyboardType: TextInputType.text,
                          textDirection: TextDirection.ltr,
                          decoration: InputDecoration(
                              labelText: 'maintenance',
                              hintText: 'Including all , some included, or not ?',
                              contentPadding: EdgeInsets.only(left: 10),
                              labelStyle:TextStyle(color: CupertinoColors.activeGreen) ,
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    width: 0.2,
                                    color: Colors.green,
                                    style: BorderStyle.none),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.green,width: 2),
                              )
                          ),
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return "Please Enter";
                            }return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // floor yaha hai
                    GestureDetector(
                      onTap: (){
                        _showFloor();
                      },
                      child: AbsorbPointer(

                        child: TextFormField(
                          controller: _floor,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: CupertinoColors.activeGreen),
                            labelText: 'Floor Preference',
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: 'Ground Florr,Top floor ,other',
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.greenAccent,width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // car parking
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        _showcarpark();
                      },
                      child:AbsorbPointer(
                        child: TextFormField(
                          controller: _car_parking,
                          keyboardType: TextInputType.text,
                          textDirection: TextDirection.ltr,
                          decoration: InputDecoration(
                              labelText: 'car parking',
                              hintText: 'Vailable or not ?',
                              contentPadding: EdgeInsets.only(left: 10),
                              labelStyle:TextStyle(color: CupertinoColors.activeGreen) ,
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    width: 0.2,
                                    color: Colors.green,
                                    style: BorderStyle.none),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.green,width: 2),
                              )
                          ),
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return "Please Enter";
                            }return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // washrooms

                    TextFormField(
                      controller: _washrooms,
                      keyboardType: TextInputType.text,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                          labelText: 'Washrooms',
                          hintText: 'number of washrooms',
                          contentPadding: EdgeInsets.only(left: 10),
                          labelStyle:TextStyle(color: CupertinoColors.activeGreen) ,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 0.2,
                                color: Colors.green,
                                style: BorderStyle.none),
                          ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.green,width: 2),
                        )
                      ),
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return "Please Enter";
                        }return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // project name

                    TextFormField(
                      controller: _project_name,
                      keyboardType: TextInputType.text,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                          labelText: 'project name',
                          hintText: 'Enter Project name',
                          contentPadding: EdgeInsets.only(left: 10),
                          labelStyle:TextStyle(color: CupertinoColors.activeGreen) ,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 0.2,
                                color: Colors.green,
                                style: BorderStyle.none),
                          ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.green,width: 2),
                        )
                      ),
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return "Please Enter";
                        }return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _Ad_title,
                      keyboardType: TextInputType.text,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                          labelText: 'Ad_title',
                          hintText: 'Enter title',
                          contentPadding: EdgeInsets.only(left: 10),
                          labelStyle:TextStyle(color: CupertinoColors.activeGreen) ,
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 0.2,
                                color: Colors.green,
                                style: BorderStyle.none),
                          ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.green,width: 2),
                      )
                      ),
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return "Please Enter";
                        }return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // apne offce space ke liye ek description

                    TextFormField(
                      controller: whatyousale,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'what are you selling',
                        hintText: 'Describe what you are selling',
                        contentPadding: EdgeInsets.only(left: 10),
                          labelStyle:TextStyle(color: CupertinoColors.activeGreen) ,
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.green,width: 2),

                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.green,width: 2),
                        )

                      ),
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return "Please Enter";
                        }return null;
                      },
                    ),
                    SizedBox(height: 30,),


                    Center(child: Text('Office Budget',style: GoogleFonts.play(fontSize: 16,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 20,),


                    TextFormField(
                      controller: _budget,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: CupertinoColors.activeGreen),
                          labelText: 'Budget(monthly)',
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: 'Enter Amount/Budget',
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: CupertinoColors.activeGreen,)
                          )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter details';
                        }return null;
                      },
                    ),

                    SizedBox(height: 30,),

                    InkWell(
                      onTap: _pickImage,
                      // onTap: _pickImages,
                      child: Container(
                        height: 220,
                        width: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [BoxShadow( color: CupertinoColors.systemGrey2)],
                        ),
                        child: Center(
                          child: _selectedImages !=null?
                              Image.file(File(_selectedImages!.path),
                              fit: BoxFit.cover,
                              ):Text('No Image Selected'),
                      ),
                    ),
                    ),
                    SizedBox(height: 60,),
                    InkWell(
                      onTap:()async {
                        if(_formkey.currentState!.validate()){
                          if(_selectedImages != null) {
                            await sendData();
                            Get.off(() => MainPage());
                            }else {
                            Fluttertoast.showToast(msg: "please check",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              textColor: Colors.green,);
                          }
                        }
                      } ,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CupertinoColors.activeGreen,
                            boxShadow: [BoxShadow(offset: Offset(5,8),color: Colors.green.withOpacity(0.5),blurRadius: 30,blurStyle: BlurStyle.inner)]
                        ),
                        child: Text('Submit',style: GoogleFonts.play(fontSize: 14,color: Colors.white),),
                      ),
                    ),

                    SizedBox(height: 50,),


                  ],
                ),
              ),
            ),
          ),

          Positioned(
            right: 16,
              bottom: 50,
              child:  FloatingActionButton(
                backgroundColor: CupertinoColors.activeGreen,
                onPressed: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context){
                        return Container(
                          height: height,
                          width: width,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Center(child: Text('Choose your property section',style: GoogleFonts.play(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),)),
                                ),

                                SizedBox(height: 20,),
                                Container(

                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text('If you want your property is show on home page so click here ',style: GoogleFonts.play(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                    ),),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green.shade300,
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 10),

                                ),
                                SizedBox(height:10 ,),
                                Container(

                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text('If you want your property is show on home page so click here ',style: GoogleFonts.play(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                    ),),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green.shade300,
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 10),

                                ),
                                SizedBox(height: 10,),
                                Container(

                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text('If you want your property is show on home page so click here ',style: GoogleFonts.play(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                    ),),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green.shade300,
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 10),

                                ),

                              ],
                            ),
                          ),
                        );
                      }
                  );
                },child: Icon(Icons.keyboard_double_arrow_up_outlined,size: 30,color: Colors.white,),
              ),
          )

        ]),


      ),

    );

  }



  



}
