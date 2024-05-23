import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  // Attribute
  // (keine)

  // Konstruktor
  const FormScreen({super.key});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateEmail,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Passwort"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validatePw,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
          ]),
        ),
      ),
    );
  }

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return 'E-Mail darf nicht leer sein';
    }
    if (input.length <= 5) {
      return 'E-Mail muss mehr als 5 Zeichen haben';
    }
    if (!input.contains('@')) {
      return 'E-Mail muss ein @-Zeichen enthalten';
    }
    if (!(input.endsWith('.com') || input.endsWith('.de'))) {
      return 'E-Mail muss mit .com oder .de enden';
    }
    return null; // Null bedeutet, dass die E-Mail gültig ist
  }

  String? validatePw(String? input) {
    if (input == null || input.isEmpty) {
      return 'Passwort darf nicht leer sein';
    }
    if (input.length < 6) {
      return 'Passwort muss mindestens 6 Zeichen lang sein';
    }
    if (input.length > 12) {
      return 'Passwort darf höchstens 12 Zeichen lang sein';
    }
    return null; // Null bedeutet, dass das Passwort gültig ist
  }
}
