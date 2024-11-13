import 'package:bhoomi_app/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child:FutureBuilder(
            future: joke_service().jockobject(),
            builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator();
              }else if(snapshot.hasError){
                return Text('Error: ${snapshot.hasError}');

              }else{
                return Padding(
                    padding: EdgeInsets.all(20),
                  child: Text(snapshot.data??'No joke Available ',
                  textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),

                );
              }
            }

        )
             ),
      // body: Center(
      //   child: FutureBuilder<String>(
      //     future: joke_api_services().firstobject() ,
      //     builder: (context,  snapshot) {
      //       if(snapshot.connectionState==ConnectionState.waiting){
      //         return CircularProgressIndicator();
      //
      //       }else if(snapshot.hasError){
      //         return Text('Error: ${snapshot.error}');
      //
      //       }else{
      //         return Padding(
      //             padding: EdgeInsets.all(20),
      //           child: Text(snapshot.data ?? 'No joke available',
      //           textAlign: TextAlign.center,
      //             style:TextStyle(fontSize: 20),
      //           ),
      //
      //
      //
      //         );
      //       }
      //
      //     },
      //   )
      //
      // ),
    ),
  );
  }

}