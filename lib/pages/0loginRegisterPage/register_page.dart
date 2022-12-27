import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/firebase_auth_controller.dart';
import 'package:zaliczenie/pages/0loginRegisterPage/widgets/dropdownbutton.dart';
import 'package:zaliczenie/pages/widgets/textbutton.dart';
import 'package:zaliczenie/pages/widgets/textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();
  final nameController = TextEditingController();
  int day = 1;
  int month = 1;
  int year = 1920;
  DropdownButton<dynamic>? dayDropdown() {
    if (month == 1 ||
        month == 3 ||
        month == 5 ||
        month == 7 ||
        month == 8 ||
        month == 10 ||
        month == 12) {
      return kDropdownButton(
        start: 1,
        end: 31,
        value: day,
        onChanged: ((value) {
          setState(() {
            day = value;
          });
        }),
      );
    } else if (month == 2) {
      if (year % 4 == 0) {
        return kDropdownButton(
          start: 1,
          end: 29,
          value: day,
          onChanged: ((value) {
            setState(() {
              day = value;
            });
          }),
        );
      } else {
        return kDropdownButton(
          start: 1,
          end: 28,
          value: day,
          onChanged: ((value) {
            setState(() {
              day = value;
            });
          }),
        );
      }
    } else {
      return kDropdownButton(
        start: 1,
        end: 30,
        value: day,
        onChanged: ((value) {
          setState(() {
            day = value;
          });
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  'REJESTRACJA',
                  style: TextStyle(fontSize: 30, color: Colors.red),
                )),
              ),
              MyTextField(
                  controller: emailController,
                  screenWidth: screenWidth,
                  hint: 'E-mail',
                  obscureText: false),
              MyTextField(
                  controller: nameController,
                  screenWidth: screenWidth,
                  hint: 'Nazwa użytkownika',
                  obscureText: false),
              MyTextField(
                  controller: passwordController1,
                  screenWidth: screenWidth,
                  hint: 'Hasło',
                  obscureText: true),
              MyTextField(
                  controller: passwordController2,
                  screenWidth: screenWidth,
                  hint: 'Powtórz hasło',
                  obscureText: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          child: Text(
                            'Dzień:',
                            textAlign: TextAlign.center,
                          ),
                          width: screenWidth * 0.2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: dayDropdown(),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          child: Text(
                            'Miesiąc:',
                            textAlign: TextAlign.center,
                          ),
                          width: screenWidth * 0.2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: kDropdownButton(
                            start: 1,
                            end: 12,
                            value: month,
                            onChanged: ((value) {
                              setState(() {
                                month = value;
                                day = 1;
                              });
                            })),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          child: Text(
                            'Rok:',
                            textAlign: TextAlign.center,
                          ),
                          width: screenWidth * 0.2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: kDropdownButton(
                            start: 1920,
                            end: 2022,
                            value: year,
                            onChanged: ((value) {
                              setState(() {
                                year = value;
                              });
                            })),
                      )
                    ],
                  )
                ],
              ),
              kTextButton(
                  screenWidth: screenWidth,
                  onPressed: (() async {
                    setState(() {
                      if (emailController.text.length < 4) {
                        showDialog(
                            context: context,
                            builder: ((context) => AlertDialog(
                                  title: Text('Błąd'),
                                  content: Text('Niepoprawny email!'),
                                  actions: [
                                    TextButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                        }),
                                        child: Text('OK'))
                                  ],
                                )));
                      } else if (passwordController1.text !=
                              passwordController2.text ||
                          passwordController1.text.length < 8) {
                        showDialog(
                            context: context,
                            builder: ((context) => AlertDialog(
                                  title: Text('Błąd'),
                                  content: Text(
                                      'Hasła nie są identyczne lub są za krótkie!'),
                                  actions: [
                                    TextButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                        }),
                                        child: Text('OK'))
                                  ],
                                )));
                      } else if (nameController.text.length < 4) {
                        showDialog(
                            context: context,
                            builder: ((context) => AlertDialog(
                                  title: Text('Błąd'),
                                  content: Text('Za krótka nazwa'),
                                  actions: [
                                    TextButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                        }),
                                        child: Text('OK'))
                                  ],
                                )));
                      } else {
                        try {
                          AuthController().register(
                            email: emailController.text,
                            password: passwordController1.text,
                            name: nameController.text,
                            birth: '$day/$month/$year',
                          );
                          Navigator.pop(context);
                        } catch (e) {
                          showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    title: Text('Błąd'),
                                    content: Text('Błąd podczas rejestracji'),
                                    actions: [
                                      TextButton(
                                          onPressed: (() {
                                            Navigator.pop(context);
                                          }),
                                          child: Text('OK'))
                                    ],
                                  )));
                        }
                      }
                    });
                  }),
                  content: 'ZAREJESTRUJ')
            ],
          ),
        ),
      ),
    );
  }
}
