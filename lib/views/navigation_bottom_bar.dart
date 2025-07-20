import 'package:flutter/material.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Profile/profile.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/Tabbar%20of%20Comments/all_comments.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/comments.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/home/home.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/questions/questions.dart';
import 'package:internship_task_1/views/bottom%20bar%20screens/Videos/training%20videos.dart';
import 'package:internship_task_1/views/login.dart';
import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    Home(),
    Questions(),
    TrainingVideos(),
    Comments(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Screen_height = MediaQuery.of(context).size.height;
    final Screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Color(0xff339D44),
        unSelectedColor: Color(0xffD4D4D4),
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedIconSize: 28,
        unselectedIconSize: 24,
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.top,
        onTap: _onItemTapped,
        customBottomBarItems: [
          CustomBottomBarItems(
            label: '',
            assetsImagePath: 'assets/images/homeIcon.png',
            isAssetsImage: true,
          ),
          CustomBottomBarItems(
            label: '',
            assetsImagePath: 'assets/images/questionmarkIcon.png',
            isAssetsImage: true,
          ),
          CustomBottomBarItems(
            label: '',
            assetsImagePath: 'assets/images/ytIcon.png',
            isAssetsImage: true,
          ),
          CustomBottomBarItems(
            label: '',
            assetsImagePath: 'assets/images/commentIcon.png',
            isAssetsImage: true,
          ),
          CustomBottomBarItems(
            label: '',
            assetsImagePath: 'assets/images/profileIcon.png',
            isAssetsImage: true,
          ),
        ],
      ),
    );
  }
}
