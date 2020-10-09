import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String label;
  final String hint;
  final IconData icon;

  Editor({this.controlador, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
