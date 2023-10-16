import 'package:doctor_appointment/core/pages/appintments/book_appintment.dart';
import 'package:doctor_appointment/core/pages/doctor/doctor_details.dart';
import 'package:doctor_appointment/core/pages/home/home_layout.dart';
import 'package:doctor_appointment/core/pages/login/login_view.dart';
import 'package:doctor_appointment/core/pages/succes_booked.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginView(),
        'main': (context) => const HomeLayout(),
        'doc_details': (context) => const DoctorDetailsView(),
        'book_appointment': (context) => const BoookAppintment(),
        'success_booked': (context) => const SuccesBooked(),
      },
    );
  }
}


// todo succes sayfasi navigation duzelt 