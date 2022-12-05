import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaliczenie/cubit/page/page_cubit.dart';
import 'package:zaliczenie/cubit/photo/photo_cubit.dart';
import 'package:zaliczenie/cubit/photo/photo_state.dart';
import 'package:zaliczenie/domain/profile_manager.dart';
import 'package:zaliczenie/pages/widgets/textfield.dart';

import '../widgets/floating_button.dart';

class BlocHelper extends StatelessWidget {
  const BlocHelper(
      {required this.uid, required this.description, required this.name});
  final String uid;
  final String description;
  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoCubit(),
      child: EditProfilePage(
        uid: uid,
        description: description,
        name: name,
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    required this.uid,
    required this.description,
    required this.name,
  });
  final String uid;
  final String description;
  final String name;
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  FilePickerResult? fileResult;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    nameController.text = widget.name;
    descriptionController.text = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingButton(
        icon: Icons.save,
        function: () async {
          ProfileMenager menager = ProfileMenager();
          if (nameController.text.length >= 4) {
            await menager.editUserName(
                name: nameController.text.trim(), uid: widget.uid);
          }
          if (descriptionController.text.length > 0) {
            await menager.editProfilDescription(
                uid: widget.uid,
                description: descriptionController.text.trim());
          }
          if (fileResult != null) {
            await menager.editPhoto(uid: widget.uid, result: fileResult);
          }
          Navigator.pop(context);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () async {
                    fileResult = await ProfileMenager().pickPhoto();
                    fileResult == null
                        ? print('null')
                        : BlocProvider.of<PhotoCubit>(context).changeBool();
                  },
                  child: BlocBuilder<PhotoCubit, PhotoState>(
                    builder: (context, state) {
                      if (BlocProvider.of<PhotoCubit>(context).hasPhotoValue) {
                        return CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.3,
                          backgroundImage:
                              Image.file(File(fileResult!.paths[0].toString()))
                                  .image,
                          child: fileResult == null
                              ? CircularProgressIndicator()
                              : null,
                        );
                      } else {
                        return Icon(
                          Icons.photo,
                          size: MediaQuery.of(context).size.width * 0.30,
                        );
                      }
                    },
                  ),
                ),
              ),
              MyTextField(
                controller: nameController,
                screenWidth: MediaQuery.of(context).size.width * 0.8,
                hint: 'Nazwa',
                obscureText: false,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: descriptionController,
                  maxLines: null,
                  maxLength: 1000,
                  decoration: InputDecoration(
                    hintText: 'Opis',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/* 
FloatingActionButton(
        onPressed: () async {
          ProfileMenager menager = ProfileMenager();
          if (nameController.text.length >= 4) {
            await menager.editUserName(
                name: nameController.text.trim(), uid: widget.uid);
          }
          if (descriptionController.text.length > 0) {
            await menager.editProfilDescription(
                uid: widget.uid,
                description: descriptionController.text.trim());
          }
          if (fileResult != null) {
            await menager.editPhoto(uid: widget.uid, result: fileResult);
          }
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
      */