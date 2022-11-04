import 'package:flutter/material.dart';
import 'package:zaliczenie/cubit/page_cubit.dart';
import 'package:zaliczenie/pages/0loginRegisterPage/login_page.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';
import 'package:zaliczenie/pages/1homePage/home_page.dart';

Widget PageMenager() {
  return BlocBuilder<PageCubit, PageState>(
    builder: (context, state) {
      if (state is HomePageState) {
        return HomePage();
      } else if (state is ProfilePageState) {
        return LoginPage();
      } else {
        return LoginPage();
      }
    },
  );
}
