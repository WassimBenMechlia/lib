import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../core/widgets/text_fields.dart';

class ModifPassPage extends StatelessWidget {
  const ModifPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController newPassController = TextEditingController();
    final TextEditingController confirmPassController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0C1D),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Modifier le mot de passe",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                _buildTextField("Email", emailController),
                const SizedBox(height: 20),
                _buildTextField(
                  "Nouveau mot de passe",
                  newPassController,
                  obscure: true,
                ),
                const SizedBox(height: 20),
                InputFields(
                  obscured: true,
                  controller: confirmPassController,
                  hintText: 'Confirmer le mot de passe',
                ),

                const SizedBox(height: 30),
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
                      // logique de mise à jour du mot de passe
                    },
                    child: const Text(
                      'Modifier',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Retour à la page ",
                      style: const TextStyle(color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(color: Colors.pinkAccent),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/login');
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
    );
  }

  Widget _buildTextField(
    String hint,
    TextEditingController controller, {
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF1A1A2E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
