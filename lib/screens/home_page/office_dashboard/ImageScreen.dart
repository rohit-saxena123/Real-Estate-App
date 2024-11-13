import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ImageScreen extends StatefulWidget {
  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _images = []; // Multiple images list

  bool imageSelected() {
    return _images != null && _images!.isNotEmpty;
  }

  // Function to pick multiple images
  Future<void> pickImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      setState(() {
        _images = selectedImages;
      });
    } else {
      Fluttertoast.showToast(
        msg: "No images selected!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  // Function to upload selected images
  Future<void> sendImages() async {
    if (!imageSelected()) {
      _showFailed('Please select at least one image before uploading.');
      return;
    }

    // Create MultipartRequest to send images
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://bhoomitherealestate.com/client/PropertyForm/upload_images.php'),
    );

    // Add each selected image to the request
    for (var image in _images!) {
      var pic = await http.MultipartFile.fromPath("images", image.path);
      request.files.add(pic);
      print('Image Path: ${image.path}');
    }

    // Send the request to server
    try {
      var response = await request.send();
      final respStr = await response.stream.bytesToString();
      print('Server Response: $respStr');

      if (response.statusCode == 200) {
        _showSuccess('Images uploaded successfully!');
      } else {
        _showFailed('Failed to upload images. Try again!');
      }
    } catch (e) {
      _showFailed('Error occurred: $e');
    }
  }

  // Success dialog
  void _showSuccess(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            )
          ],
        );
      },
    );
  }

  // Failed dialog
  void _showFailed(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Failed'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Upload'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),

            // Display selected images in a horizontal list
            Center(
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: _images != null && _images!.isNotEmpty
                    ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _images!.length,
                  itemBuilder: (context, index) {
                    return Image.file(
                      File(_images![index].path),
                      fit: BoxFit.cover,
                    );
                  },
                )
                    : Center(child: Text('No images selected')),
              ),
            ),

            SizedBox(height: 30),

            // Upload button
            Center(
              child: InkWell(
                onTap: () {
                  if (imageSelected()) {
                    sendImages();
                    Fluttertoast.showToast(
                      msg: 'Uploading...',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      textColor: Colors.greenAccent,
                      backgroundColor: Colors.white,
                      timeInSecForIosWeb: 1,
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: 'No images selected!',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      textColor: Colors.redAccent,
                      backgroundColor: Colors.white,
                      timeInSecForIosWeb: 1,
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        color: Colors.green.withOpacity(0.2),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Upload',
                      style: GoogleFonts.play(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pickImages();
          },
          backgroundColor: Colors.white,
          child: Icon(Icons.add, color: Colors.greenAccent),
        ),
      ),
    );
  }
}
