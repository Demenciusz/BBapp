import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:zaliczenie/domain/firebase_auth_controller.dart';
import 'package:zaliczenie/pages/0loginRegisterPage/register_page.dart';
import 'package:zaliczenie/pages/0loginRegisterPage/widgets/textbutton.dart';
import 'package:zaliczenie/pages/widgets/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final textcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 56,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Image.asset('assets/dice.png', color: Colors.red),
                  width: 100,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    child: Text(
                  'LOGOWANIE',
                  style: TextStyle(fontSize: 30, color: Colors.red),
                )),
              ),
              MyTextField(
                  controller: emailController,
                  screenWidth: screenWidth,
                  hint: 'E-mail',
                  obscureText: false),
              MyTextField(
                  controller: passwordController,
                  screenWidth: screenWidth,
                  hint: 'Hasło',
                  obscureText: true),
              MyTextButton(
                  screenWidth: screenWidth,
                  onPressed: () {
                    AuthController().signIn(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context,
                        title: 'Błąd Logowania',
                        content: '');
                  },
                  content: 'LOGOWANIE'),
              MyTextButton(
                  screenWidth: screenWidth,
                  onPressed: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  }),
                  content: 'REJESTRACJA'),
            ],
          ),
        ),
      ),
    );
  }
}
