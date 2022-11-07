import 'package:flutter/material.dart';
import 'package:zaliczenie/domain/firebase_auth_controller.dart';
import '../../cubit/page/page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        //color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [HeadDrawer(), BodyDrawer()],
        ),
      ),
    );
  }
}

class HeadDrawer extends StatelessWidget {
  const HeadDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 200,
      width: double.infinity,
      child: Center(
        child: Image.asset(
          'assets/dice.png',
          color: Colors.white,
          width: 128,
        ),
      ),
    );
  }
}

class BodyDrawer extends StatelessWidget {
  const BodyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ButtonDrawer(
              text: 'Menu Główne',
              onPressed: () => BlocProvider.of<PageCubit>(context).homePage()),
          ButtonDrawer(
            text: 'Mój Profil',
            onPressed: () => BlocProvider.of<PageCubit>(context).profilePage(),
          ),
          ButtonDrawer(
            text: 'Czat',
            onPressed: () => BlocProvider.of<PageCubit>(context).chatPage(),
          ),
          ButtonDrawer(
            text: 'Rzut Kośćmi',
            onPressed: () => BlocProvider.of<PageCubit>(context).dicePage(),
          ),
          ButtonDrawer(
            text: 'Karty Postaci',
            onPressed: () =>
                BlocProvider.of<PageCubit>(context).charactersPage(),
          ),
          ButtonDrawer(
              text: 'Wyloguj',
              onPressed: (() {
                AuthController().signOut();
              }))
        ],
      ),
    );
  }
}

class ButtonDrawer extends StatelessWidget {
  const ButtonDrawer({required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: TextButton(
        style: ButtonStyle(),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            color: Colors.red,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
