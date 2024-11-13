import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';



class MapScreen extends StatefulWidget{
  @override
  State<MapScreen> createState() => _MapScreenState();

}

class _MapScreenState extends State<MapScreen> {
late WebViewController _viewController;
bool isConnect = true;
final String WebUrl="https://www.google.co.in/maps/@28.6287837,77.3814697,16z/data=!5m1!1e2?entry=ttu";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(WebView.platform == null){
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  void checkConnectivity()async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      isConnect = connectivityResult != ConnectivityResult.none;

    });
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result){
      setState(() {
        isConnect = result != ConnectivityResult.none;
      });
      if(isConnect){
        _viewController.reload();
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


  body:isConnect?
      Padding(
        padding: const EdgeInsets.only(top: 7),
        child: WebView(
          initialUrl: WebUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webviewcontroller){
            _viewController = webviewcontroller;
          },
        ),
      ):Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('assets/animation/networkanim.json',height: 200,width: 200),
        SizedBox(height: 5,),
        Center(child: Text('Oops Netwrok issue',style: GoogleFonts.play(fontSize: 18,),))
      ],
    ),
  )


      // isConnect?
  //     Padding(
  //         padding: EdgeInsets.only(top: 1),
  //     child: WebView(
  //       initialUrl: WebUrl,
  //       javascriptMode: JavascriptMode.unrestricted,
  //       onWebViewCreated: (WebViewController webviewController){
  //         _viewController = webviewController;
  //       },
  //     ),
  //     ):Center()
  //
    );
  }
}