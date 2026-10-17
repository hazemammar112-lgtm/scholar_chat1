import 'package:flutter/material.dart';

class CustemBotten extends StatelessWidget {
  CustemBotten({super.key, required this.Text1, required this.OnTap});
  String Text1;
  VoidCallback? OnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        OnTap!();
      },
      child: Container(
      
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        width: double.infinity,
        height: 40,
        child: Center(child: Text(Text1,)),
      ),
    );
  }
}
