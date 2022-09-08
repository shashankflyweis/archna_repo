import 'package:archna_frontend/View/Home_screen.dart';
import 'package:flutter/material.dart';

import '../View/distortion_home.dart';
import '../View/thought_diary_screen/thought_diary_home.dart';
import '../situation_break_down/situation/situation_view.dart';
import 'color.dart';

class Bottom2 extends StatefulWidget {
  int? index;
  Bottom2({Key? key, this.index}) : super(key: key);

  @override
  State<Bottom2> createState() => _Bottom2State();
}

class _Bottom2State extends State<Bottom2> {
  int _currentIndex = 0;
  List pageData = [
    HomeScreen(),
    Distortion(),
    SituationView(),
    Thoughtdiary()
    // MainNetCoView(),
    // SurveyHomeView(),
    // HomeShopView(),
    // HomeShopView(),
    // OttHomeView()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pageData[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: appbg,
        // elevation: 30,

        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 15,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 13,
        selectedItemColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(
                "assets/images/nav1.png",
              )),
              label: "Home",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/nav2.png")),
              label: "Cognitive distortions",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/nav3.png")),
              label: 'Situation',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/nav4.png")),
              label: 'Thought diary',
              backgroundColor: Colors.green),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
