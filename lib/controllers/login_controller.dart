import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_hotel/core/routes/app_routes.gr.dart';

import '../core/util/pref_utils.dart';
import '../dependency_injection.dart' as di;
import '../services/login_service.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final AuthService authService;

  LoginController(this.authService);

  PrefUtils prefUtils = di.sl<PrefUtils>();

  void login(BuildContext context) async {
    isLoading.value = true;
    if (!formKey.currentState!.validate() ?? false) return;
    final success = await authService.login(
      emailController.text,
      passwordController.text,
    );
    isLoading.value = false;
    success.fold(
      (exception) {
        Get.snackbar("Error", "Invalid credentials");
      },
      (success) {
        prefUtils.setUser(success);
        prefUtils.setToken(success.tokens?.accesstoken ?? "");
        context.router.replace(MainRoute());
      },
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void logOut(BuildContext context) {
    prefUtils.logout();
    context.router.replace(LoginRoute());
  }
}
