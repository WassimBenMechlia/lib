import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hotel/core/routes/app_routes.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(child: Text(title)),
      backgroundColor: Colors.deepPurple,
      leading: IconButton(
        onPressed: () {
          //Get.toNamed(AppRoutes.navbar);
        },
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
