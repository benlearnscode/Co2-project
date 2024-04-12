import 'package:flutter/material.dart';

class Segmentbuttonfor extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isActive;
  const Segmentbuttonfor(
      {super.key,
      required this.title,
      required this.isActive,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                border: Border.all(
                    color:
                        Color.fromARGB(255, 218, 205, 205).withOpacity(0.25)),
                color: const Color.fromARGB(137, 45, 45, 45),
                borderRadius: BorderRadius.circular(10))
            : null,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
