import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zaliczenie/pages/widgets/textfield.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.photo,
                  size: MediaQuery.of(context).size.width * 0.30,
                ),
              ),
              MyTextField(
                controller: nameController,
                screenWidth: MediaQuery.of(context).size.width * 0.8,
                hint: 'Nazwa',
                obscureText: false,
              ),
              Text('Data urodzenia:'),
              Text('Opis:'),
              TextField(
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
