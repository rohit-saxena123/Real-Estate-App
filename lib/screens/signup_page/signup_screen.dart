import 'package:bhoomi_app/main.dart';
import 'package:bhoomi_app/screens/home_page/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final  _formkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _rePassword = TextEditingController();


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Register();
  }


  Future<void> loadUserDetails() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name',_name.text.trim());
    await prefs.setString('number', _number.text.trim());
    await prefs.setString('email', _email.text.trim());
    await prefs.setString('password', _password.text.trim().toLowerCase());
    await prefs.setBool('isRegister',true);

  }


  Future<void> Register()async {

   final url = Uri.parse('https://bhoomitherealestate.com/client/PropertyForm/Register.php');

   // final requiest = await http.MultipartRequest('POST', url);
   // requiest.fields['name'] =_name.text;
   // requiest.fields['number'] = _number.text;
   // requiest.fields['email'] = _email.text;
   // requiest.fields['password'] = _password.text;

   final response = await http.post(url,
   body: {
     'name' :_name.text,
     '_number' :_number.text,
     'email':_email.text,
     'password' : _password.text,
   }
   );

   // var response = await requiest.send();
   if(response.statusCode == 200){
     Fluttertoast.showToast(msg: 'Registeration here',
     gravity: ToastGravity.BOTTOM,
       toastLength: Toast.LENGTH_SHORT,
       textColor: Colors.redAccent,
         backgroundColor: Colors.white,
       timeInSecForIosWeb: 1,
     );
   }else
     {
       Fluttertoast.showToast(msg: 'faild to send data',
         gravity: ToastGravity.BOTTOM,
         toastLength: Toast.LENGTH_SHORT,
         textColor: Colors.redAccent,
         backgroundColor: Colors.white,
         timeInSecForIosWeb: 1,
       );
     }

  }



  @override
  Widget build(BuildContext context) {
    var _obscureText = true;

    final width = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [



          Container(
            margin: EdgeInsets.only(left: 30,top: 70),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'Register',
                    style: GoogleFonts.play(fontSize: 24, color: Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>MainPage());
                  },
                  child: Text(
                    'Here',
                    style: GoogleFonts.play(fontSize: 24, color: Colors.green),
                  ),
                ),

              ],
            ),
          ),

          SizedBox(
            height: 50,
          ),

          Flexible(
            child: Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              // top: 0,

              // problam isme bottom overfloa baali oopar row lene se arhi hai or expende se work nhi krega

              child: Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        // boxShadow: [BoxShadow(color: Colors.green.shade100)]
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 600,
                      child: Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 300,
                                child: TextFormField(
                                  controller: _name,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.green,
                                        )),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Name',
                                    hintText: 'Enter your text',
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  validator: (valid) {
                                    if (valid == null || valid.isEmpty) {
                                      return 'please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: 300,
                                child: TextFormField(
                                  controller: _number,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.green)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Number',
                                    hintText: 'Enter your number',
                                    prefixIcon: Icon(
                                      Icons.call,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  validator: (valid) {
                                    if (valid == null || valid.isEmpty) {
                                      return 'please enter number';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: 300,
                                child: TextFormField(
                                  controller: _email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.green),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Email',
                                    hintText: 'Enter your email',
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  validator: (valid) {
                                    if (valid == null || valid.isEmpty) {
                                      return 'please enter email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                child: TextFormField(
                                  controller: _password,
                                  keyboardType: TextInputType.visiblePassword,
                                    obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.green),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Password',
                                    hintText: 'Password',
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.green,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (valid) {
                                    if (valid == null || valid.isEmpty) {
                                      return 'Please create password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                child: TextFormField(
                                  controller: _rePassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.green),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Re-Password',
                                    hintText: 'Re- Password',

                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                          _obscureText ? Icons.visibility : Icons.visibility_off,
                                          color: Colors.lightGreen),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (valid) {
                                    if (valid != _password.text || valid == null) {
                                      return 'Password do not match';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              // PasswordField(),
                              // // PasswordField(),
                              // Container(
                              //   width: 300,
                              //   child: TextFormField(
                              //     controller: _password,
                              //     keyboardType: TextInputType.visiblePassword,
                              //     decoration: InputDecoration(
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(10),
                              //       ),
                              //       labelText: 'Password',
                              //       hintText: 'Password',
                              //       prefixIcon: Icon(
                              //         Icons.lock,
                              //         color: Colors.grey,
                              //       ),
                              //       suffixIcon: IconButton(
                              //         icon: Icon(
                              //           _obscureText ? Icons.visibility : Icons.visibility_off,
                              //           color: Colors.green,
                              //         ),
                              //         onPressed: () {
                              //           setState(() {
                              //             _obscureText = !_obscureText;
                              //           });
                              //         },
                              //       ),
                              //     ),
                              //     obscureText: _obscureText,
                              //     validator: (valid) {
                              //       if (valid == null || valid.isEmpty) {
                              //         return 'Please create password';
                              //       }
                              //       return null;
                              //     },
                              //   ),
                              // ),
                              // SizedBox(height: 16,),
                              // // PasswordField(),
                              // Container(
                              //   width: 300,
                              //   child: TextFormField(
                              //     controller: _rePassword,
                              //     keyboardType: TextInputType.visiblePassword,
                              //     decoration: InputDecoration(
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(10),
                              //       ),
                              //       labelText: 'Re-Password',
                              //       hintText: 'Re- Password',
                              //       prefixIcon: Icon(
                              //         Icons.lock,
                              //         color: Colors.grey,
                              //       ),
                              //       suffixIcon: IconButton(
                              //         icon: Icon(
                              //             _obscureText ? Icons.visibility : Icons.visibility_off,
                              //             color:Colors.lightGreen
                              //         ),
                              //         onPressed: () {
                              //           setState(() {
                              //             _obscureText = !_obscureText;
                              //           });
                              //         },
                              //       ),
                              //     ),
                              //     obscureText: _obscureText,
                              //     validator: (valid) {
                              //       if (valid != _password.text || valid == null) {
                              //         return 'Password do not match';
                              //       }
                              //       return null;
                              //     },
                              //   ),
                              // ),

                              // submitdata
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 300,
                                child: ElevatedButton(



                                  onPressed: () async {
                                    // if(_formkey.currentState!.validate()) {
                                    //   await loadUserDetails();
                                    //   Register();
                                    //   Get.off(() => MainPage());
                                    //   Fluttertoast.showToast(msg: "Register Succes",
                                    //       toastLength: Toast.LENGTH_SHORT,
                                    //       backgroundColor: Colors.white,
                                    //       textColor: CupertinoColors.activeGreen,
                                    //       gravity: ToastGravity.BOTTOM);
                                    // }else {
                                    //   Fluttertoast.showToast(msg: "Register Faild",
                                    //       toastLength: Toast.LENGTH_SHORT,
                                    //       backgroundColor: Colors.white,
                                    //       textColor: Colors.red,
                                    //       gravity: ToastGravity.BOTTOM);
                                    // }
                                    Get.to(MainPage());

                                  },
                                  // child: _isLoading
                                  //     ? CircularProgressIndicator(
                                  //   valueColor: AlwaysStoppedAnimation<Color>(
                                  //       Colors.white),
                                  // )
                                  child: Text(
                                    'Register',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    minimumSize: Size(double.infinity, 50),
                                  ),
                                ),
                              ),
                            ],
                          ))),
                ),
              ),
            ),
          ),
        ]),
      ]),
    ));
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
    TextEditingController _password = TextEditingController();
    TextEditingController _rePassword = TextEditingController();

    return Container(
      width: 300,
      child: Column(
        children: [
          Container(
            child: TextFormField(
              controller: _password,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Password',
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              obscureText: _obscureText,
              validator: (valid) {
                if (valid == null || valid.isEmpty) {
                  return 'Please create password';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            child: TextFormField(
              controller: _rePassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Re-Password',
                hintText: 'Re- Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.lightGreen),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              obscureText: _obscureText,
              validator: (valid) {
                if (valid != _password.text || valid == null) {
                  return 'Password do not match';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
