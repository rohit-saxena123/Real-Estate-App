import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupwithxamppScreen extends StatefulWidget {
  @override
  State<SignupwithxamppScreen> createState() => _SignupwithxamppScreenState();
}

class _SignupwithxamppScreenState extends State<SignupwithxamppScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> submitData() async {
    final url = Uri.parse('http://192.168.1.24/bhoomi_app_api/student/formwithxampp.php');
    final response = await http.post(
      url,
      body: {
        'name': _nameController.text,
        'mobile': _mobileController.text,
        'password': _passController.text,
        'email': _emailController.text,
      },
    );
    // if (response.statusCode == 200) {
    //   final jsonResponse = response.body;
    //   print(jsonResponse);
    //   _showSuccessDialog();
    //   _clearForm();
    // } else {
    //   _showErrorDialog();
    // }

    if(response.statusCode==200){
      final jsonResponse = response.body;
      print(jsonResponse);
      _showSuccessDialog();
      _clearForm();
    }else{
      _showErrorDialog();

    }

  }

  // void _showSuccessDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Success'),
  //         content: Text('Data submitted successfully!'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void _showSuccessDialog(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Success'),
            content: Text('Data Submited successfully'),
            actions: <Widget>[
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('okhe')),
            ],
          );
        });
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Failed to submit data. Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _clearForm() {
    _nameController.clear();
    _mobileController.clear();
    _passController.clear();
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Data to Server'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),



              // TextFormField(
              //   controller: _mobileController,
              //   keyboardType: TextInputType.phone,
              //   decoration: InputDecoration(labelText: 'Mobile'),
              //   validator: (value) {
              //     if (value == null || value.trim().isEmpty) {
              //       return 'Please enter your mobile number';
              //     }
              //     return null;
              //   },
              // ),

              TextFormField(
                controller: _mobileController,
                obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile',
                ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),


              TextFormField(
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return 'please enter your password';
                  }
                  return null;

                },

              ),

              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Flexible(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      submitData();
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
