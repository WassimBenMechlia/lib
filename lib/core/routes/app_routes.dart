// // lib/core/routes/app_routes.dart
// import 'package:get/get.dart';
// import 'package:smart_hotel/core/widgets/nav_wrapper_bar.dart';
// import 'package:smart_hotel/home_page.dart';
// import 'package:smart_hotel/screens/edit_profile_page.dart';
// import 'package:smart_hotel/screens/email_check.dart';
// import 'package:smart_hotel/screens/login_page.dart';
// import 'package:smart_hotel/screens/modif_pass.dart';
// import 'package:smart_hotel/screens/signup_page.dart';
// import 'package:smart_hotel/screens/verify_code_page.dart';
//
// class AppRoutes {
//   static const String login = '/login';
//   static const String signup = '/signup';
//   static const String emailCheck = '/email-check';
//   static const String verifyCode = '/verify-code';
//   static const String modifPass = '/modif-pass';
//   static const String home = '/home';
//   static const String navbar = '/navbar';
//   static const String editProfile = '/editProfile';
//
//   static final routes = [
//     GetPage(name: login, page: () => const LoginPage()),
//     GetPage(name: signup, page: () => const SignUpPage()),
//     GetPage(name: emailCheck, page: () => const EmailCheckPage()),
//     GetPage(name: verifyCode, page: () => const VerifyCodePage()),
//     GetPage(name: modifPass, page: () => const ModifPassPage()),
//     GetPage(name: home, page: () => const HomePage()),
//     GetPage(name: navbar, page: () => const BottomNavWrapper()),
//     GetPage(name: editProfile, page: () => const EditProfilePage()),
//   ];
// }

import 'package:auto_route/auto_route.dart';
import 'app_routes.gr.dart';
import 'auto_route_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: LoginRoute.page,
      initial: true,
      guards: [GetInitialRoute()],
    ),
    AutoRoute(
      page: MainRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: BookingsRoute.page),
        AutoRoute(page: ChatRoute.page),
      ],
    ),
    AutoRoute(
      page: SignUpRoute.page,

    ),
  ];
}
