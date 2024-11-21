import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_management/context_extension.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../style/fonts/font_family_helper.dart';
import '../../style/fonts/font_weight_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                context.read<AuthBloc>().add(const LogoutRequested());
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        backgroundColor: context.color.textFormBorder,
        foregroundColor: context.color.textColor,
      ),
      body: PageView(
        controller: _pageController,
        // physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          Center(child: Text("الرئيسية Page")),
          Center(child: Text("المخزن Page")),
          Center(child: Text("الاعدادات Page")),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text(
              'الرئيسية',
              style: TextStyle(
                fontFamily: FontFamilyHelper.cairoArabic,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.store),
            title: const Text(
              'المخزن',
              style: TextStyle(
                fontFamily: FontFamilyHelper.cairoArabic,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text(
              'الاعدادات',
              style: TextStyle(
                fontFamily: FontFamilyHelper.cairoArabic,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _changeItem,
        backgroundColor: context.color.textFormBorder,
        selectedItemColor: context.color.textColor,
      ),
    );
  }

  void _changeItem(int value) {
    setState(() {
      _currentIndex = value;
      _pageController.jumpToPage(value);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
