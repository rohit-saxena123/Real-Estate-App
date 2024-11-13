import 'package:bhoomi_app/main.dart';
import 'package:bhoomi_app/screens/home_page/home_screen.dart';
import 'package:bhoomi_app/screens/signup_page/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreen extends StatefulWidget {
  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool _obscureText = true;
  bool _isLoading = false;

  void _showLoading() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  // final _formkey= GlobalKey<FormState>();

  final _formkey = GlobalKey<FormState>();

  final TextEditingController _number = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> loginSData(BuildContext context) async {
    String number = _number.text;
    String password = _password.text;


    SharedPreferences Prefs = await SharedPreferences.getInstance();
    String? matchnumber = Prefs.getString('number')?.trim();
    String? matchpassword = Prefs.getString('password')?.trim();
    if (number.toLowerCase().trim() ==
            matchnumber?.toLowerCase().trim() &&
        password.trim().toLowerCase() ==
            matchpassword?.toLowerCase().trim()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: CupertinoColors.activeGreen,
        content: Text(
          'successfully Login...',
          style: GoogleFonts.play(fontSize: 16, color: Colors.white),
        ),
      ));
      Get.to(() => MainPage());
      Fluttertoast.showToast(
        msg: 'Login successfully..',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        textColor: CupertinoColors.activeGreen,
        backgroundColor: Colors.white,
      );
      print('form is valid ${_number}');
      print('form is valid ${_password}');
    } else {
      Fluttertoast.showToast(
        msg: 'Login faild some Issue..',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        textColor: CupertinoColors.systemRed,
        backgroundColor: Colors.black,
      );
      print('form is invalid ');
    }
  }

  // Future<void> LoginData () async {
  //
  //   final url = Uri.parse('https://bhoomitherealestate.com/client/PropertyForm/login.php');
  //   final request =  await http.post(url
  //   ,body: {
  //     'number':_number.text,
  //       }
  //
  //   );
  //
  //
  //
  //   if(request.statusCode==200){
  //     Fluttertoast.showToast(msg: 'loggin successfully',
  //     toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       textColor: Colors.white,
  //       backgroundColor: Colors.green,
  //       timeInSecForIosWeb: 1
  //     );
  //   }else {
  //     Fluttertoast.showToast(msg: 'Something wrongs',
  //     toastLength:Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       textColor: Colors.white,
  //       backgroundColor: Colors.red
  //     );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              key: _formkey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (_isLoading) CircularProgressIndicator(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: InkWell(
                          onTap: (){
                            Get.to(HomeScreen());
                          },
                          child: Image.asset(
                            'assets/logoicon/bhoomilogo.png',
                            height: 80,
                            width: 180,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20, left: 10),
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.play(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    IntlPhoneField(
                      keyboardType: TextInputType.number,
                      controller: _number,
                      decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle:
                              TextStyle(color: CupertinoColors.systemGrey2),
                          hintText: 'Enter your phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: CupertinoColors.systemGrey3),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: CupertinoColors.systemGrey3),
                          )),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                    SizedBox(
                      height: 20,
                     ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: CupertinoColors.systemGrey2, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: CupertinoColors.systemGrey2, width: 2),
                        ),
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: CupertinoColors.systemGrey2),
                        hintText: 'Enter your password',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.lock_outline_rounded,
                            color: CupertinoColors.systemGrey2,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.play(
                              fontSize: 16, color: CupertinoColors.systemGrey2),
                          textAlign: TextAlign.right,
                        )),

                    Center(
                      child: InkWell(
                        onTap: () async {
                          Get.to(MainPage());
                          // if(_formkey.currentState!.validate()){
                          //   await LoginData();
                          //   Get.to(()=>PropertyPostForm());
                          // }else {
                          //   Fluttertoast.showToast(msg: 'Some issue here',
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.BOTTOM,
                          //     timeInSecForIosWeb: 1,
                          //     textColor: Colors.red,
                          //     backgroundColor: Colors.black
                          //
                          //
                          //   );
                          // }

                          // if (_formkey.currentState!.validate()) {
                          //   // Get.off(()=>MainPage());
                          //   loginSData(context);
                          //   print('form is valid ${_number}');
                          //   print('form is valid ${_password}');
                          // } else {
                          //   print('form is invalid');
                          //   print('register ${'number'}');
                          //   Fluttertoast.showToast(
                          //     msg: 'some issue',
                          //     timeInSecForIosWeb: 1,
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.BOTTOM,
                          //     textColor: Colors.white,
                          //     backgroundColor: CupertinoColors.activeGreen,
                          //   );
                          // }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: CupertinoColors.activeGreen,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Login',
                                style: GoogleFonts.play(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have account? ",
                            style: GoogleFonts.play(
                                fontSize: 14,
                                color: CupertinoColors.systemGrey2),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          InkWell(
                              onTap: () {
                                Get.to(() => SignupScreen());
                              },
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.play(
                                    fontSize: 14,
                                    color: CupertinoColors.activeGreen),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      obscureText: _obscureText,
    );
  }
}
