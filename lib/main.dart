import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaliczenie/pages/5charactersPage/characters_page.dart';
import 'package:zaliczenie/pages/0loginRegisterPage/register_page.dart';
import 'package:zaliczenie/pages/1homePage/home_page.dart';
import 'package:zaliczenie/pages/0loginRegisterPage/login_page.dart';
import 'package:zaliczenie/pages/0loginRegisterPage/register_page.dart';
import 'package:zaliczenie/pages/2profilePage/profile_page.dart';
import 'cubit/page/page_cubit.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PageCubit(),
        child: const PageBuilder(),
      ),
    );
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BlocBuilder<PageCubit, PageState>(builder: ((context, state) {
            String uid;
            if (state is HomePageState) {
              return HomePage();
            } else if (state is ProfilePageState) {
              return ProfilePage();
            } else if (state is CharactersPageState) {
              return CharactersPage();
            }
            return HomePage();
          }));
        } else {
          return LoginPage();
        }
      },
    );
  }
}
