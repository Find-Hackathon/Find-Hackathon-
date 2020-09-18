import 'package:FindHackathon/Views/Screen/HackathonPage/outline_field_oval.dart';

import '../../Widgets/bottom_navigation_bar.dart';
import '../../Widgets/outline_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import '../../Widgets/fat_button.dart';
import '../../Widgets/space_seperator.dart';
import 'hackathon_upload_page_view_model.dart';
import '../../../Core/Extension/context_extension.dart';

class HackathonUpload extends StatefulWidget {
  HackathonUpload({Key key}) : super(key: key);

  @override
  _HackathonUploadState createState() => _HackathonUploadState();
}

class _HackathonUploadState extends State<HackathonUpload> {
  HackathonUploadModel _viewModel = HackathonUploadModel();

  File _image;

  @override
  Widget build(BuildContext context) {
    Future getImageLocale() async {
      var imageGalery =
          await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = imageGalery;
        print('Image path $_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      var resim = await (await uploadTask.onComplete).ref.getDownloadURL();
      _viewModel.resimUrl = resim.toString();
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Hackathon added'),
          ),
        );
      });
    }

    return Scaffold(
      extendBody: true,
      appBar: buildAppBarHackathonUpload(context),
      body: SingleChildScrollView(
        child: Builder(
          builder: (context) => SizedBox(
            height: context.height - 80,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpaceSeperator(),
                buildRowGetImage(context, getImageLocale),
                SpaceSeperator(),
                bodyForm(context),
                SpaceSeperator(),
                buildRowSumbitButton(uploadPic, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildRowGetImage(BuildContext context, Future getImageLocale()) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1,
              child: InkWell(
                onTap: () {
                  getImageLocale();
                },
                child: Container(
                  child: (_image != null)
                      ? Image.file(_image, fit: BoxFit.fill)
                      : Icon(
                          Icons.cloud_upload,
                          size: context.height / 5,
                        ),
                ),
              )),
        ),
      ],
    );
  }

  Row buildRowSumbitButton(
      Future uploadPic(BuildContext context), BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FatButton(
          text: "SUMBIT",
          onPressed: () async {
            try {
              await uploadPic(context);
              _viewModel.createOrganizatiom();
            } catch (e) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Could not add hackathon'),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  AppBar buildAppBarHackathonUpload(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context,
              MaterialPageRoute(builder: (context) => NavigationBar()));
        },
      ),
      centerTitle: true,
      title: Text(
        "Hackathon Upload",
        style: TextStyle(
          fontSize: 25,
          color: Color(0xFF7BE495),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding bodyForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _viewModel.formKeyHackathonUploadModel,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlieField(
              labelText: "Hackathon",
              onChanged: (data) => _viewModel.name = data,
            ),
            SpaceSeperator(),
            OutlieField(
              onChanged: (data) => _viewModel.description = data,
              labelText: "Hackathon Açıklaması",
            ),
          ],
        ),
      ),
    );
  }
}
