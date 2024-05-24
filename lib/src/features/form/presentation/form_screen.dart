import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  // Attribute
  // (keine)

  // Konstruktor
  const FormScreen({super.key});
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // State
  late TextEditingController _pwController;
  late TextEditingController _pwRepeatController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool clickable = false;

  // Methoden
  @override
  void initState() {
    super.initState();
    _pwController = TextEditingController();
    _pwRepeatController = TextEditingController();
  }

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          onChanged: () {
            setState(() {
              clickable = _formKey.currentState!.validate();
            });
          },
          child: Column(
            children: [
              TextFormField(
                validator: validateFirstName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Vorname"),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              TextFormField(
                validator: validateLastName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Nachname"),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              TextFormField(
                validator: validateAge,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Alter"),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              TextFormField(
                validator: validatePet,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Haustier"),
                    hintText: "Nur Hund, Katze und Vogel erlaubt"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("PLZ"),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validateZip,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _pwController,
                validator: validatePw,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Passwort"),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _pwRepeatController,
                validator: validatePwRepeat,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Passwort Wiederholen"),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: clickable
                    ? () {
                        // navigiere zu dem Hauptscreen
                      }
                    : null,
                child: const Text("Registrieren"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validatePw(String? input) {
    if (input == null || input == "") {
      return "Pflichtfeld";
    } else if (input.length >= 3) {
      return null;
    } else {
      return "Min. 3 Zeichen";
    }
  }

  String? validatePwRepeat(String? input) {
    if (_pwController.text == _pwRepeatController.text) {
      return null;
    } else {
      return "Passwörter stimmen nicht überein";
    }
  }

  String? validateFirstName(String? input) {
    // min. 5 Zeichen
    if (input == null || input == "") {
      return "Pflichtfeld";
    } else if (input.length >= 5) {
      return null;
    } else {
      return "Min. 5 Zeichen";
    }
  }

  String? validateLastName(String? input) {
    // min. 5 Zeichen
    if (input == null || input == "") {
      return "Pflichtfeld";
    } else if (input.length >= 5) {
      return null;
    } else {
      return "Min. 5 Zeichen";
    }
  }

  String? validateAge(String? input) {
    // 18-100
    if (input == null || input == "") {
      return "Pflichtfeld";
    }
    int? age = int.tryParse(input);

    if (age == null) {
      return "Eingabe darf nur numerisch sein.";
    } else if (age >= 18 && age <= 100) {
      return null;
    } else {
      return "Alter stimmt nicht";
    }
  }

  String? validatePet(String? input) {
    if (input == "Hund" || input == "Katze" || input == "Vogel") {
      return null;
    } else {
      return "Ungueltige Eingabe";
    }
  }

  String? validateZip(String? input) {
    if (input == null || input == "") {
      return "Pflichtfeld";
    }
    int? zip = int.tryParse(input);

    if (zip == null) {
      return "Eingabe darf nur numerisch sein.";
    } else if (input.length == 5) {
      return null;
    } else {
      return "PLZ stimmt nicht";
    }
  }

  @override
  void dispose() {
    _pwController.dispose();
    _pwRepeatController.dispose();
    super.dispose();
  }
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
