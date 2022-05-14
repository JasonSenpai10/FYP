import 'package:flutter/material.dart';

class CustomButtonBlue extends StatelessWidget {
  const CustomButtonBlue({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.blue,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 25,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
