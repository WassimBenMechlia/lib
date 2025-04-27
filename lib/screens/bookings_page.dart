import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:smart_hotel/core/widgets/app_appbar.dart';

@RoutePage()
class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6FF),
      appBar: AppAppbar(title: "Booking"),
      body: const Center(
        child: Text(
          "You have no bookings yet",
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }
}
