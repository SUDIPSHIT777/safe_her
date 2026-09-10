import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:safe_her/features/home/ui/homepage.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _screens() {
    return const [HomePage(), HomePage(), HomePage(), HomePage(), HomePage()];
  }

  List<PersistentBottomNavBarItem> _items() {
    return [
      PersistentBottomNavBarItem(
        icon: const Center(child: Icon(Icons.home, color: Color(0xFFF9437A))),
      ),
      PersistentBottomNavBarItem(
        icon: const Center(
          child: Icon(Icons.notification_important, color: Color(0xFFF9437A)),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Center(
          child: Center(
            child: Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: Color(0xFFFF3B5C),
                shape: BoxShape.circle,
              ),
              child: const Center(child: Icon(Icons.sos, color: Colors.white)),
            ),
          ),
        ),
      ),

      PersistentBottomNavBarItem(
        icon: const Center(
          child: Icon(Icons.person_pin, color: Color(0xFFF9437A)),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Center(child: Icon(Icons.person, color: Color(0xFFF9437A))),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _controller.index == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (_controller.index != 0) {
            _controller.jumpToTab(0);
          }
        }
      },
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _screens(),
          items: _items(),
          handleAndroidBackButtonPress: false,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
          navBarStyle: NavBarStyle.simple,
        ),
      ),
    );
  }
}
