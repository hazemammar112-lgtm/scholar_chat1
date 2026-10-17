import 'package:flutter/material.dart';

class CustemTextfeld extends StatelessWidget {
  CustemTextfeld({
    super.key,
    required this.HitnText,
    this.OnChanged,
    this.obscureText = false,
  });
  String HitnText;
  Function(String)? OnChanged;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return "this field is required";
        }
      },
      onChanged: OnChanged,
      decoration: InputDecoration(
          hintText: HitnText,
          hintStyle: TextStyle(
              color: const Color.fromARGB(255, 190, 170, 170)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder()),
    );
  }
}