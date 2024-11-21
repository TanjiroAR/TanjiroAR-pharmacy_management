import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_management/app.dart';
import 'package:user_repository/user_repository.dart';

import 'blocs/bloc_observer.dart';

// import 'package:pharmacy_management/language/app_localizations_setup.dart';
// import 'package:pharmacy_management/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}

//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Pharmacy Management',
//       // theme: themeDark(),
//       locale: Locale('en'),
//       supportedLocales: AppLocalizationsSetup.supportedLocales,
//       localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
//       localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
//       onGenerateRoute: AppRoutes.onGenerateRoute,
//       initialRoute: AppRoutes.login,
//     );
//     //   MaterialApp(
//     //   title: 'Flutter Demo',
//     //   theme: ThemeData(
//     //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//     //     useMaterial3: true,
//     //   ),
//     //   home: const LoginScreen(),
//     // );
//   }
// }
