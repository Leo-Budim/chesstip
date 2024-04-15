import 'package:chesstip/models/user.dart';
import 'package:chesstip/repositories/user_repository.dart';
import 'package:chesstip/screens/friends_screen.dart';
import 'package:chesstip/screens/history_screen.dart';
import 'package:chesstip/screens/play_screen.dart';
import 'package:chesstip/screens/settings_screen.dart';
import 'package:chesstip/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  User user = UserRepository.user;
  NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: 'R\$');
  int currentIndex = 0;
  final double iconSize = 20;
  final double selectedFontSize = 12;
  final double unselectedFontSize = 8;
  final screens = [
    const PlayScreen(),
    const HistoryScreen(),
    const FriendsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (value) => setState(() => currentIndex = value),
      selectedFontSize: selectedFontSize,
      unselectedFontSize: unselectedFontSize,
      showUnselectedLabels: false,
      selectedItemColor: Colors.green,
      items: [
        BottomNavigationBarItem(
            icon: SizedBox(
              width: iconSize,
              child: Image.asset(
                "assets/icons/chess-white.png",
              ),
            ),
            activeIcon: SizedBox(
                width: iconSize,
                child: Image.asset(
                  color: Colors.green,
                  "assets/icons/chess-black.png",
                )),
            label: "Jogar"),
        BottomNavigationBarItem(
            icon: SizedBox(
              width: iconSize,
              child: Image.asset(
                "assets/icons/historical-white.png",
              ),
            ),
            activeIcon: SizedBox(
              width: iconSize,
              child: Image.asset(
                color: Colors.green,
                "assets/icons/historical-black.png",
              ),
            ),
            label: "Histórico"),
        BottomNavigationBarItem(
            icon: SizedBox(
              width: iconSize,
              child: Image.asset(
                "assets/icons/friends-white.png",
              ),
            ),
            activeIcon: SizedBox(
              width: iconSize,
              child: Image.asset(
                color: Colors.green,
                "assets/icons/friends-black.png",
              ),
            ),
            label: "Amigos"),
        BottomNavigationBarItem(
            icon: SizedBox(
              width: iconSize,
              child: Image.asset("assets/icons/gear-white.png"),
            ),
            activeIcon: SizedBox(
              width: iconSize,
              child: Image.asset(
                color: Colors.green,
                "assets/icons/gear-black.png",
              ),
            ),
            label: "Configurações")
      ],
    );
  }
}
