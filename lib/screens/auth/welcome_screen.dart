import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_management/context_extension.dart';
import 'package:pharmacy_management/screens/auth/sign_up_screen.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../blocs/sign_up_bloc/sign_up_bloc.dart';
import 'sign_in_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  Widget buildCircle({required Alignment alignment, required double sizeFactor, required Color color}) {
    return Align(
      alignment: alignment,
      child: Container(
        height: MediaQuery.of(context).size.width * sizeFactor,
        width: MediaQuery.of(context).size.width * sizeFactor,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = context.color;

    return Scaffold(
      backgroundColor: context.color.mainColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              buildCircle(
                alignment: const Alignment(20, -1.2),
                sizeFactor: 1,
                color: color.mainColor!,
              ),
              buildCircle(
                alignment: const Alignment(-2.7, -1.2),
                sizeFactor: 1 / 1.4,
                color: color.bluePinkDark!,
              ),
              buildCircle(
                alignment: const Alignment(2.7, -1.2),
                sizeFactor: 1 / 1.3,
                color: color.bluePinkLight!,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: TabBar(
                          controller: tabController,
                          unselectedLabelColor: color.textColor,
                          labelColor: color.textFormBorder,
                          tabs: const [
                            Tab(text: 'Sign In'),
                            Tab(text: 'Sign Up'),
                          ],
                          indicatorColor: color.textFormBorder,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            BlocProvider(
                              create: (context) => SignInBloc(
                                userRepository: context.read<AuthBloc>().userRepository,
                              ),
                              child: const SignInScreen(),
                            ),
                            BlocProvider(
                              create: (context) => SignUpBloc(
                                userRepository: context.read<AuthBloc>().userRepository,
                              ),
                              child: const SignUpScreen(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
