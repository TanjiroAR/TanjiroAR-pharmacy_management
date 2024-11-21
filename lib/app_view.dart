import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_management/blocs/auth_bloc/auth_bloc.dart';
import 'package:pharmacy_management/screens/auth/welcome_screen.dart';
import 'package:pharmacy_management/screens/home/home_screen.dart';
import 'package:pharmacy_management/style/themes/app_theme.dart';

import 'blocs/sign_in_bloc/sign_in_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmacy Management',
      theme: themeLight(),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.status == AuthStatus.auth) {
            return BlocProvider(
              create: (context) => SignInBloc(
                userRepository: context.read<AuthBloc>().userRepository,
              ),
              child: const HomeScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
