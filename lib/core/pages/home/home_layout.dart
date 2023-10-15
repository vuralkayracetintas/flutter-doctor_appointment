import 'package:doctor_appointment/core/pages/appintments/appintments_view.dart';
import 'package:doctor_appointment/core/pages/home/home_page_view.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedPage = 0;

  static final List<Widget> _selectPage = <Widget>[
    const HomePageView(),
    const AppintmentsView()
  ];
  void selectedPageFunc(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _selectPage.elementAt(selectedPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: selectedPageFunc,
        selectedItemColor: Colors.orange,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'AppIntments',
          )
        ],
      ),
    );
  }
}
