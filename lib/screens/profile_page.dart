import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_hotel/core/widgets/app_appbar.dart';

import '../controllers/login_controller.dart';
import '../dependency_injection.dart' as di;

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(di.sl<LoginController>());

    return Column(
      children: [
        const SizedBox(height: 10),
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            'https://randomuser.me/api/portraits/women/44.jpg',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Nada Ali',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 30),
        _buildMenuItem(
          Icons.edit,
          "Edit Profile",
          //onTap: () => Get.toNamed(AppRoutes.editProfile),
        ),
        _buildMenuItem(Icons.settings, "Settings"),
        _buildMenuItem(Icons.notifications_none, "Notification"),
        _buildMenuItem(Icons.favorite_border, "Favorite"),
        _buildMenuItem(Icons.help_outline, "Help"),
        _buildMenuItem(
          Icons.logout,
          "Log Out",
          color: Colors.red,
          onTap: () => controller.logOut(context),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title, {
    Color? color,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.indigo),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: color ?? Colors.black),
      ),
      onTap: onTap ?? () {},
    );
  }
}
