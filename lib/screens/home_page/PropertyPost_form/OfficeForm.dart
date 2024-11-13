import 'dart:io';

import 'package:bhoomi_app/main.dart';
import 'package:bhoomi_app/screens/home_page/office_dashboard/ImageScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class OfficeForm extends StatefulWidget {
  @override
  State<OfficeForm> createState() => _OfficeFormState();
}

class _OfficeFormState extends State<OfficeForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // File? _selectedImage;

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
  final TextEditingController _whatyousale = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _cabins = TextEditingController();
  final TextEditingController _meetingrooms = TextEditingController();
  final TextEditingController _lifts = TextEditingController();
  final TextEditingController _officetype = TextEditingController();
  final TextEditingController _lookingfor = TextEditingController();
  final TextEditingController _capacity = TextEditingController();
  final TextEditingController _budget = TextEditingController();
  final TextEditingController _floor = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  Future<void> getImage() async{
    final pickedimage = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedimage != null){
      setState(() {
        _selectedImage = File(pickedimage.path);
      });
    }
  }
  
  // yaha hume data send krna hai database mai to jese flutter mai krna hai UI ko leke bo sab krlo then form ka data is taraah se bhejna hia 
    Future<void> sendOffice() async {
    final url = Uri.parse('https://bhoomitherealestate.com/client/PropertyForm/Office_form.php');
    final request = http.MultipartRequest('POST', url);

    request.fields['location'] = _furnishing.text;
    request.fields['cabin'] = _cabins.text;
    request.fields['meeting_rooms'] = _meetingrooms.text;
    request.fields['lifts'] = _lifts.text;
    request.fields['type_of_office'] = _officetype.text;
    request.fields['looking_for'] = _lookingfor.text;
    request.fields['capacity'] = _capacity.text;
    request.fields['furnishing'] = _furnishing.text;
    request.fields['listed_by'] = _Listed_by.text;
    request.fields['builtp_area'] = _builtp_area.text;
    request.fields['carpet_area'] = _carpet_ara.text;
    request.fields['maintenance'] = _maintenance.text;
    request.fields['floor'] = _floor.text;
    request.fields['car_parking'] = _car_parking.text;
    request.fields['washrooms'] = _washrooms.text;
    request.fields['project_name']  = _project_name.text;
    request.fields['adtitle'] = _Ad_title.text;
    request.fields['whatusale'] = _whatyousale.text;
    request.fields['budget'] = _budget.text;


    if(_selectedImage != null){
      request.files.add(await http.MultipartFile.fromPath('image',_selectedImage!.path));
    }


    var response = await request.send();

    if(response.statusCode == 200){
      var responsecode = await response.stream.bytesToString();
      _successDialog();
      print('response data $response');
      print('statuscode ${response.statusCode}');
      print('responsecdeo $responsecode');
    }else {
      _showFaild();
      print('response data $response');

    }



    }

    void _successDialog() async {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Success'),
            content: Text('Form submited successfully your office show withing 20 hours so '),
          );
        });
    }

    void _showFaild()async {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Faild'),
            content: Text('due to some isseu form not submited so please check issues'),
          );
        });
    }


  
  
  
  void _showMeetingRooms() async{
final selectValue = await showDialog(
    context: context,
    builder: (context){
      return SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,'Available');
            },child: Text('Avaialble'),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,'Not Available');
            },child: Text('Not Available'),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,'Conrerence Available');
            },child: Text('Confrerence Available'),
          ),

        ],
      );
    });
if(selectValue != null){
  _meetingrooms.text = selectValue;
}
  }

  void _showOfficetype() async {
    final selectValue = await showDialog(context: context, builder: (context){
      return SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,'Ready to move');
            },child: Text('Ready to move'),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,'Co-Working');
            },child: Text('Co-Working'),
          ),
        ],
      );
    });
    if(selectValue != null){
      _officetype.text = selectValue;
    }
  }

  void _showlifts() async {
    final selectValue = await showDialog(context: context, builder: (context){
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
        ],
      );
    });
    if(selectValue != null){
      _lifts.text = selectValue;
    }
  }



  void _showlookingFor() async {
    final selectValue = await showDialog(context: context, builder: (context){
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
          ),
        ],
      );
    });
    if(selectValue != null){
      _lookingfor.text = selectValue;
    }
  }

  void _showFurnishing() async {
    final selectValue = await showDialog(context: context, builder: (context){
      return SimpleDialog(
        children: [
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
    });
    if(selectValue != null){
      _furnishing.text = selectValue;
    }
  }


  void _showListedby() async {
    final selectValue = await showDialog(context: context, builder: (context){
      return SimpleDialog(
        children: [
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
          )
        ],
      );
    });
    if(selectValue != null){
      _Listed_by.text = selectValue;
    }
  }

  void _showmaintenace() async {
    final selectValue = await showDialog(context: context, builder: (context){
      return SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,'Including all');
            },child: Text('Including all'),
          ),

          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,'Included some');
            },child: Text('Included some'),
          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,'Not Included');
            },child: Text('Not Included'),
          ),
        ],
      );
    });
    if(selectValue != null){
      _maintenance.text = selectValue;
    }
  }

  void _showfloor() async {
    final selectValue = await showDialog(context: context, builder: (context){
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
          ),
        ],
      );
    });
    if(selectValue != null){
      _floor.text = selectValue;
    }
  }

  void _showCarparking() async {
    final selectValue = await showDialog(context: context, builder: (context){
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
        ],
      );
    });
    if(selectValue != null){
      _car_parking.text = selectValue;
    }
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Including Some details',
          style: GoogleFonts.play(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.activeGreen),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: (){
                  Get.to(()=>ImageScreen());
                }, icon: Icon(Icons.forward)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                // location
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _location,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    contentPadding: EdgeInsets.only(left: 15),
                    hintText: 'Type.. office loaction?',
                    prefix: Padding(
                      padding:  EdgeInsets.all(3),
                      child: Icon(Icons.location_on_outlined,color: CupertinoColors.activeGreen,),
                    ),
                    labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                    )
                  ),
                  validator: (value){
                    if(value ==null || value.isEmpty){
                      return 'please enter ';
                    }return null;
                  },
                ),
                // Cabin
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _cabins,
                  decoration: InputDecoration(
                      labelText: 'Cabins',
                      contentPadding: EdgeInsets.only(left: 15),
                      hintText: 'No. of Cabins?',
                      labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      )
                  ),
                    validator: (value){
                    if(value == null || value.isEmpty){
                      return 'please enter';
                    }return null;
                    },
                ),
                // meeting Rooms,
                GestureDetector(
                  onTap: (){
                    _showMeetingRooms();
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _meetingrooms,
                      decoration: InputDecoration(
                          labelText: 'Meeting Rooms',
                          contentPadding: EdgeInsets.only(left: 15),
                          hintText: 'meeting rooms',
                          labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please enter';
                        }return null;
                      },
                    ),
                  ),
                ),
                // lifts
                GestureDetector(
                  onTap: (){
                    _showlifts();
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _lifts,
                      decoration: InputDecoration(
                          labelText: 'Lifts',
                          contentPadding: EdgeInsets.only(left: 15),
                          hintText: 'enter lift',
                          labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please enter';
                        }return null;
                      },
                    ),
                  ),
                ),
                // type of office
                GestureDetector(
                  onTap: (){
                    _showOfficetype();
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _officetype,
                      decoration: InputDecoration(
                          labelText: 'Type of Office',
                          contentPadding: EdgeInsets.only(left: 15),
                          hintText: 'Office',
                          labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please enter';
                        }return null;
                      },
                    ),
                  ),
                ),
                // looking for
                GestureDetector(
                  onTap: (){
                    _showlookingFor();
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _lookingfor,
                      decoration: InputDecoration(
                          labelText: 'Lookin for',
                          contentPadding: EdgeInsets.only(left: 15),
                          hintText: 'looking for',
                          labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please enter';
                        }return null;
                      },
                    ),
                  ),
                ),
                // office capacity
                 TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _capacity,
                      decoration: InputDecoration(
                          labelText: 'Capacity',
                          contentPadding: EdgeInsets.only(left: 15),
                          hintText: 'No. of Seats?',
                          labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          )
                      ),
                   validator: (value){
                     if(value == null || value.isEmpty){
                       return 'please enter';
                     }return null;
                   },
                    ),


                // furnished
                GestureDetector(
                  onTap: (){
                    _showFurnishing();
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _furnishing,
                      decoration: InputDecoration(
                          labelText: 'Furnishing',
                          contentPadding: EdgeInsets.only(left: 15),
                          hintText: 'Furnishing Available ?',
                          labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please enter';
                        }return null;
                      },
                    ),
                  ),
                ),
                // listed by
                GestureDetector(
                  onTap: (){
                    _showListedby();
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _Listed_by,
                      decoration: InputDecoration(
                          labelText: 'Listed By',
                          contentPadding: EdgeInsets.only(left: 15),
                          hintText: 'Listed By',
                          labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please enter';
                        }return null;
                      },
                    ),
                  ),
                ),
                // builtup area
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _builtp_area,
                  decoration: InputDecoration(
                      labelText: 'Builtp area',
                      contentPadding: EdgeInsets.only(left: 15),
                      hintText: 'Builtep Area',
                      labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      )
                  ),
                ),
                // carpet area
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _carpet_ara,
                  decoration: InputDecoration(
                      labelText: 'Carpet Area',
                      contentPadding: EdgeInsets.only(left: 15),
                      hintText: 'Carpet Area',
                      labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'please enter';
                    }return null;
                  },
                ),
                // maintenance 
                GestureDetector(
                  onTap: (){
                    _showmaintenace();
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _maintenance,
                      decoration: InputDecoration(
                          labelText: 'Maintenance',
                          contentPadding: EdgeInsets.only(left: 15),
                          hintText: 'Included or not?',
                          labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          )
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'please enter';
                        }return null;
                      },
                    ),
                  ),
                ),
                // Floor
                GestureDetector(
                  onTap: (){
                    _showfloor();
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _floor,
                      decoration: InputDecoration(
                          labelText: 'Floor',
                          contentPadding: EdgeInsets.only(left: 15),
                          hintText: 'Enter Floor',
                          labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          )
                      ),
                      validator: (value){
                        if(value ==  null || value.isEmpty){
                          return 'please enter';
                        }return null;
                      },
                    ),
                  ),
                ),
                // Car preferance
                GestureDetector(
                  onTap: (){
                    _showCarparking();
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _car_parking,
                      decoration: InputDecoration(
                          labelText: 'Car Parking',
                          contentPadding: EdgeInsets.only(left: 15),
                          hintText: 'Available or not ?',
                          labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                          )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please enter';
                        }return null;
                      },
                    ),
                  ),
                ),
                // washrooms
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _washrooms,
                  decoration: InputDecoration(
                      labelText: 'Washrooms',
                      contentPadding: EdgeInsets.only(left: 15),
                      hintText: 'No. of washrooms',
                      labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'please enter';
                    }return null;
                  },
                ),
                // project name
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _project_name,
                  decoration: InputDecoration(
                      labelText: 'Project Name',
                      contentPadding: EdgeInsets.only(left: 15),
                      hintText: 'Enter Project Name',
                      labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'please enter';
                    }return null;
                  },
                ),
                // Ad_title
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _Ad_title,
                  decoration: InputDecoration(
                      labelText: 'Ad_title',
                      contentPadding: EdgeInsets.only(left: 15),
                      hintText: 'Ad_title',
                      labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'please enter';
                    }return null;
                  },
                ),
                //what you sale
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _whatyousale,
                  decoration: InputDecoration(
                      labelText: 'What you sale',
                      contentPadding: EdgeInsets.only(left: 15),
                      hintText: 'describe your office space',
                      labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'please enter';
                    }return null;
                  },
                ),
                Text('Office Budget',style: GoogleFonts.play(fontSize: 18,fontWeight: FontWeight.bold),),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _budget,
                  decoration: InputDecoration(
                      labelText: 'Budget',
                      contentPadding: EdgeInsets.only(left: 15),
                      hintText: 'Enter Budget ',
                      labelStyle: GoogleFonts.play(color: CupertinoColors.activeGreen),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: CupertinoColors.activeGreen,width: 2),
                      )
                  ),
                  validator: (value){
                    if(value ==  null || value.isEmpty){
                      return 'please enter';
                    }return null;
                  },
                ),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                  getImage();
                  },
                  child: Container(
                    height: 200,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CupertinoColors.systemGrey2,
                    ),
                    child: Center(
                      child: _selectedImage!=null?
                       Image.file(File(_selectedImage!.path),
                         fit: BoxFit.cover,
                       ):Text('No Image Selected',style: GoogleFonts.play(),),
                    ),
                  ),
                ),
                SizedBox(height: 40,),

                ElevatedButton(
                    onPressed: (){
                      print('logcat message');
                      if(_formkey.currentState!.validate()){
                        if(_selectedImage!=null){
                          sendOffice();
                          Get.to(()=>MainPage());
                        }

                          Fluttertoast.showToast(msg: 'image sucess',toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,timeInSecForIosWeb: 1);
                        Fluttertoast.showToast(msg: 'data send ',toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,timeInSecForIosWeb: 1);
                        print('deta send');
                      }else {
                        print('deta not send');
                        Fluttertoast.showToast(msg: 'data not send ',toastLength: Toast.LENGTH_SHORT,gravity:ToastGravity.BOTTOM,timeInSecForIosWeb: 1);
                      }
                     
                },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text('submit',style: GoogleFonts.play(fontSize: 20,color: Colors.white),
                    ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
