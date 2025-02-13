import 'package:flutter/material.dart';

import '../../../../hotel_booking_app.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.onTap, required this.currentIndex});

  final NavBarOnTap onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue.shade900,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: onTap,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: context.l10n.overview,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.hotel),
          label: context.l10n.hotels,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: context.l10n.favorites,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: context.l10n.account,
        ),
      ],
    );
  }
}
