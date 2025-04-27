import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_hotel/core/routes/app_routes.gr.dart';
import 'package:smart_hotel/core/util/validator.dart';

import '../controllers/login_controller.dart';
import '../core/widgets/text_fields.dart';
import '../dependency_injection.dart' as di;


@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(di.sl<LoginController>());

    return Scaffold(
      backgroundColor: const Color(0xFF0D0C1D),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: AutofillGroup(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "sign In",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    InputFields(
                      controller: controller.emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                autoFill: const [AutofillHints.email],
                      validator: (value) {
                        return validateEmail(context, value?.trim());
                      },
                    ),
                    const SizedBox(height: 20),
                    InputFields(
                      obscured: true,
                      controller: controller.passwordController,
                      hintText: 'Password',
                      autoFill: const [AutofillHints.password],

                      validator: (value) {
                        return validatePassword(context, value?.trim());
                      },
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/email-check');
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.pinkAccent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.purpleAccent, Colors.pinkAccent],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          controller.login(context);
                        },
                        child: const Text(
                          'Log-in',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account ? ",
                          style: const TextStyle(color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign-up',
                              style: const TextStyle(color: Colors.pinkAccent),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      context.router.push(SignUpRoute());
                                    },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
