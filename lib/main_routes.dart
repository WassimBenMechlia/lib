import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smart_hotel/core/routes/app_routes.gr.dart';
import 'package:smart_hotel/screens/bookings_page.dart';
import 'package:smart_hotel/screens/chat_screen.dart';
import 'package:smart_hotel/screens/home_page.dart';
import 'package:smart_hotel/screens/profile_page.dart';


@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [HomeRoute(), ProfileRoute(), ChatRoute(), BookingsRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          bottomNavigationBar: SafeArea(
            child: Container(
              //height: 68.h,
              height: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  topLeft: Radius.circular(18),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                child: BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.white,
                  iconSize: 22,
                  onTap: (index) {
                    tabsRouter.setActiveIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      label: "home",
                      icon: Icon(Icons.home_outlined),
                      backgroundColor: Colors.white,
                      activeIcon: Icon(Icons.home_filled),
                    ),
                    BottomNavigationBarItem(
                      label: "Booking",
                      icon: Icon(Icons.book_online),
                      backgroundColor: Colors.white,
                      activeIcon: Icon(Icons.book_outlined),
                    ),
                    BottomNavigationBarItem(
                      label: "Chat",
                      icon: Icon(Icons.chat_bubble),
                      backgroundColor: Colors.white,
                      activeIcon: Icon(Icons.chat),
                    ),
                    BottomNavigationBarItem(
                      label: "Profile",
                      icon: Icon(Icons.person_2_outlined,color: Colors.black,),
                      backgroundColor: Colors.white,
                      activeIcon: Icon(Icons.person),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(child: IndexedStack(
            index: tabsRouter.activeIndex,
            children: [
              HomePage(),
              BookingsPage(),
              ChatScreen(),
              ProfileScreen()
            ],
          )),
        );
      },
    );
  }
}
