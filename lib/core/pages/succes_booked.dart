import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

class SuccesBooked extends StatelessWidget {
  const SuccesBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/success.json'),
          const Text('Succesfully Booked'),
          ElevatedButton(
            onPressed: () {
              context.route.navigateName('main');
            },
            child: const Text('Go to Home'),
          ),
        ],
      ),
    );
  }
}
