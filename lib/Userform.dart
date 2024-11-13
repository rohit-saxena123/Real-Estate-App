import 'package:flutter/material.dart';
import 'DBHelper.dart';
import 'DBHelper.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmployeeForm(),
    );
  }
}

class EmployeeForm extends StatefulWidget {
  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      // onWillPop: () async{
      //   Get.snackbar("Back Pressed", 'Going Back to Home screen');
      //   return true;
      //
      // },
      Scaffold(
        appBar: AppBar(
          title: Text('Employee Form'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: numberController,
                  decoration: InputDecoration(labelText: 'Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _insertEmployee();
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      );

  }

  void _insertEmployee() async {
    Employee employee = Employee(
      name: nameController.text,
      number: numberController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    await dbHelper.insertEmployee(employee);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Employee added successfully')),
    );
    // Clear the text fields
    nameController.clear();
    numberController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
