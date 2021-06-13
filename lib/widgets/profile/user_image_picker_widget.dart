import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class UserImagePickerWidget extends StatefulWidget {
  @override
  _UserImagePickerWidgetState createState() => _UserImagePickerWidgetState();
}

class _UserImagePickerWidgetState extends State<UserImagePickerWidget> {
  File _pickedImage;

  void _pickImage() async {
    final pickedImageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage:
            _pickedImage != null ? FileImage(_pickedImage) : null,
          ),
          FlatButton.icon(
            textColor: Theme.of(context).primaryColor,
            onPressed: _pickImage,
            icon: Icon(Icons.image),
            label: Text('Add Image'),
          ),
        ],
      ),
    );
  }
}
