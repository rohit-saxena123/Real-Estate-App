import 'package:bhoomi_app/EMI_Calculator/EMI_calculator_provider.dart';
import 'package:bhoomi_app/SplashScreen/splash_screen.dart';
import 'package:bhoomi_app/Userform.dart';
import 'package:bhoomi_app/map_file/map_home_screen.dart';
import 'package:bhoomi_app/map_file/map_screen.dart';
// import 'package:bhoomi_app/screens/activity_page/activity_screen.dart';
import 'package:bhoomi_app/screens/home_page/home_screen.dart';
import 'package:bhoomi_app/screens/login_screen/login_home_screen.dart';
import 'package:bhoomi_app/screens/profile_page/profile_screen.dart';
import 'package:bhoomi_app/screens/property_page/MainPageScreen.dart';
import 'package:bhoomi_app/screens/signin_page/signin_screen.dart';
import 'package:bhoomi_app/screens/signup_page/signup_screen.dart';
import 'package:bhoomi_app/services/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:searchbar_animation/const/colours.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(
      // MultiProvider(
      //     providers: [
      //       ChangeNotifierProvider(create: (_)=>EmiCalculatorProvider()),
      //     ],

     // child:
      MyApp());
     //  ),

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: SplashScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Future<void> logout(BuildContext context)async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.clear();

    Get.to(()=>LoginHomeScreen());
  }


  static List<Widget> _selectIndex = <Widget>[
    HomeScreen(),
    Mainpagescreen(),
    ProfileScreen(),
    // ActivityScreen(),

  ];


  static List<String> _title=[
    'Home',
    'Property',
    // 'Activity',
    'Profile',

  ];

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

 Future<void> _launcheryoutube () async {
   final url = Uri.parse('https://www.youtube.com/@bhoomitherealestateservice3921');
   if(await canLaunchUrl(url)){
     await launchUrl(url);
   }else {
     throw 'could not launch $url';
   }
 }

 Future<void> _launchfacebook() async {
   final rohit =  Uri.parse('https://www.facebook.com/Bhoomitherealestate/');
   if(await canLaunchUrl(rohit)){
     await launchUrl(rohit);
   }else {
     throw 'could not launch $rohit';
   }
 }

 Future<void> _launchinsta() async {
   final insta = Uri.parse('https://www.instagram.com/bhoomi_the_real_estate/');
   if(await canLaunchUrl(insta)){
     await launchUrl(insta);
   }else {
     throw 'could not launch $insta';
   }
 }

 Future<void> _launchwebsite() async {
   final website = Uri.parse('https://bhoomitherealestate.com/');
   // final website = Uri.parse('https://estateacresjaipur.com/');
   if(await canLaunchUrl(website)){
     await launchUrl(website);
   }else {
     throw 'could not launcher $website';
   }
 }


 // 916386539630

 Future<void> _DirectCall() async {
   final call = Uri.parse('tel:+916386539630'); // No spaces in phone number
   if (await canLaunchUrl(call)) {
     await launchUrl(call);
   } else {
     print('Could not launch $call');
   }
 }


  // for drawer

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title[currentIndex]),

          leading: Padding(

            padding: EdgeInsets.only(left: 10),
            child: Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Navigator.of(context);
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu_open,
                    color: Colors.green[800],
                  ));
            }),
          ),
          actions: [
           IconButton(
               onPressed: (){
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>MapScreen()));
               }, icon: Icon(Icons.location_on_outlined,color: Colors.green[800],),
           ),
            PopupMenuButton(
                iconColor: Colors.green[800],
                color: AppColours.transparent,
                icon: Icon(Icons.more_horiz),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                     Get.to(()=>Scaffold(),transition: Transition.leftToRightWithFade);
                    },
                    child: Text('Setting'),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Get.to(()=>Scaffold(),transition: Transition.leftToRightWithFade);
                    },
                    child: Text('Help'),
                  ),
                 PopupMenuItem(
                   onTap: (){
                     Get.to(()=>LoginHomeScreen());
                   },
                     child: Text("Go Back"),),

                ]),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text('BHOOMI',style:GoogleFonts.play(fontWeight: FontWeight.bold,color: Colors.white) ,),
                      accountEmail: Text('Bhoomi@gmail.com',style: GoogleFonts.play(fontSize: 15),),
                      currentAccountPicture: CircleAvatar(
                        radius: 35,
                        // backgroundImage:AssetImage('assets/lottie/jaipurlogo.jpeg'),
                        backgroundImage: NetworkImage(
                            'https://tse1.mm.bing.net/th?id=OIP.JKK1xa-fXf4tzTHMkQS93wHaED&pid=Api&P=0&h=180'),
                      ),
                      decoration: BoxDecoration(color: Colors.green),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 150),
                        child: Text('Social media',style: GoogleFonts.play(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),
                    SizedBox(height: 20,),
                    Container(

                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 350,
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: _launchwebsite,
                            child: Container(

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.link_sharp,color: Colors.green[800],),
                                  SizedBox(width: 10,),
                                  Text('Visit our website',style: GoogleFonts.play(fontSize: 15,color: Colors.green[800]),),
                                  Spacer(flex: 1,),
                                  Icon(Icons.keyboard_arrow_right,color: Colors.green[800],),

                                ],
                              ),
                              margin: EdgeInsets.all(10),
                            ),
                          ),
                          InkWell(
                            // onTap: (){
                            //   Fluttertoast.showToast(msg: "please proivde link",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT);
                            // },
                            onTap: _launchfacebook,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.facebook_outlined),
                                  SizedBox(width: 10,),
                                  Text('Facebook',style: GoogleFonts.play(fontSize: 15,color: Colors.green[800]),),
                                  Spacer(flex: 1,),
                                  Icon(Icons.keyboard_arrow_right,color: Colors.green[800]),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            // onTap: (){
                            //   Fluttertoast.showToast(msg: "please proivde link",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,timeInSecForIosWeb: 1);
                            // },
                            onTap: _launchinsta,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.language,color:Colors.green[800],),
                                  SizedBox(width: 10,),
                                  Text('Instagram',style: GoogleFonts.play(fontSize: 15,color:Colors.green[800]),),
                                  Spacer(flex: 1,),
                                  Icon(Icons.keyboard_arrow_right,color: Colors.green[800],),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              _launcheryoutube();
                            //   Fluttertoast.showToast(msg: "please attached link",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,timeInSecForIosWeb: 1);
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.slow_motion_video_outlined,color: Colors.green[800],),
                                  SizedBox(width: 10,),
                                  Text('You Tube',style: GoogleFonts.play(fontSize: 15,color: Colors.green[800]),),
                                  Spacer(flex: 1,),
                                  Icon(Icons.keyboard_arrow_right,color: Colors.green[800],),
                                ],
                              ),
                            ),
                          ),

                          Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text('Settings ___________',style: GoogleFonts.play(fontSize: 18,),)),

                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.settings),
                                SizedBox(width: 10,),
                                Text('Setting',style: GoogleFonts.play(fontSize: 15,color:Colors.green[800]),),
                                Spacer(flex: 1,),
                                Icon(Icons.keyboard_arrow_right,color: Colors.green[800],),

                              ],
                            ),
                          ),

                          Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text('Contact Us _________',style: GoogleFonts.play(fontSize: 18,),)),

                          InkWell(
                            onTap: (){
                              _DirectCall();
                              Fluttertoast.showToast(msg: 'Call Forwared',gravity: ToastGravity.BOTTOM,toastLength:Toast.LENGTH_SHORT);
                            },
                          child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Icon(Icons.call),
                          SizedBox(width: 10,),
                          Text('Contact US',style: GoogleFonts.play(fontSize: 15,color:Colors.green[800]),),
                          Spacer(flex: 1,),
                          Icon(Icons.keyboard_arrow_right,
                          color: Colors.green[800],),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),


                    Spacer(),
                    ListTile(
                      title: Text('LogOut'),
                      leading: Icon(Icons.logout),
                      selected: _selectIndex==1,
                      selectedTileColor: Colors.green[800],
                      onTap: (){
                       setState(() {
                         _selectIndex==1;
                       });
                        logout(context);
                      },
                    ),
                    SizedBox(height: 20,),
                  ],

            ),
          ),
        ),
        body: Center(
          child: _selectIndex.elementAt(currentIndex),
        ),
        bottomNavigationBar: ClipRRect(

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            color: Colors.green[800],
            // color: Colors.transparent,
            width: MediaQuery.of(context).size.width * 0.10,

            height: 70,
            child: SalomonBottomBar(
              currentIndex: currentIndex,
              onTap: _onTap,
              duration: Duration(seconds: 1 ),
              selectedItemColor: Colors.white.withOpacity(0.5),
              selectedColorOpacity: 0.5,
              items: [
                SalomonBottomBarItem(
                    icon: Icon(
                      Icons.dashboard_sharp,
                      color: Colors.white,
                    ),
                    title: Text('Dashboard')),
                SalomonBottomBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text('Property')),

                SalomonBottomBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text('Profile')),

                // SalomonBottomBarItem(
                //     icon: Icon(
                //       Icons.access_time_filled,
                //       color: Colors.white,
                //     ),
                //     title: Text('Activity')),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void main(){
    runApp(GetMaterialApp(
      home: MainPage(),
    ));
  }
}
