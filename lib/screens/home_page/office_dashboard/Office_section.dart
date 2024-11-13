import 'dart:convert';

import 'package:bhoomi_app/screens/home_page/Adapter_office.dart';
import 'package:bhoomi_app/screens/home_page/office_dashboard/OfficeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class Office_section extends StatefulWidget{
  @override
  State<Office_section> createState() => _Office_sectionState();
}

class _Office_sectionState extends State<Office_section> {

  // final Future<office_file> _officedata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }




  Future<List<office_file>> fetchData() async {
    final response =  await http.get(Uri.parse('https://bhoomitherealestate.com/client/PropertyForm/Office_form.php'));

    if(response.statusCode == 200){
      List<dynamic> office = json.decode(response.body);
      return office.map((json) => office_file.fromjson(json)).toList();

      print('response ${response.statusCode}');
      print('result ${response.body}');
      _showSuccess();
    }else {
      print('some error ${response.body}');
      _showError();
      return [];
    }

  }

  // List<office_file> officedata=[];
  // Future<List<office_file>> fetchData() async {
  //   final response = await http.get(
  //       Uri.parse('https://bhoomitherealestate.com/client/PropertyForm/Office_form.php')
  //   );
  //
  //   if (response.statusCode == 200) {
  //     // List<dynamic> office = json.decode(response.body);
  //     List<dynamic> office = response.body['office_file'];
  //     List<office_file> officeFiles = office.map((json) => office_file.fromjson(json)).toList();
  //
  //     print('response ${response.statusCode}');
  //     print('result ${response.body}');
  //     _showSuccess();
  //
  //     // Return the list after all processing
  //     return officeFiles;
  //   } else {
  //     print('some error ${response.body}');
  //     _showError();
  //
  //     // Return an empty list in case of error
  //     return [];
  //   }
  // }

  // Future<List<office_file>> fetchData() async {
  //   try {
  //     final response = await http.get(Uri.parse(
  //         'https://bhoomitherealestate.com/client/PropertyForm/property_listing.php'));
  //
  //     if (response.statusCode == 200) {
  //       List<dynamic> data = json.decode(response.body);
  //       return data.map()
  //     } else {
  //       throw Exception('Failed to load data: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     // Print the error for debugging purposes
  //     print('Error: $e');
  //     // Return an empty list or handle it based on your requirement
  //     return [];
  //   }
  // }


  void _showSuccess() async {
    showDialog(context: context,
        builder: (context){
      return AlertDialog(
        title: Text('Success'),
        content: Text('datasend SuccessFully'),
      );
        });
  }
  
  void _showError() async{
    showDialog(context: context, 
        builder: (context){
      return AlertDialog(
        title: Text('Fialed'),
        content: Text('there is some issue '),
      );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<office_file>>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<List<office_file>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading state
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Error state
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Data Available')); // Empty state
          } else {
            final officeList = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: officeList.length,
              itemBuilder: (BuildContext context, int index) {
                final data = officeList[index];
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Text(data.listed_by),  // Assuming office_file has a 'name' property
                      subtitle: Text('${data.location} - ${data.budget}'), // Assuming office_file has 'location' and 'price' properties
                    ),
                    Divider(), // Optional: Adds a divider between items
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

}