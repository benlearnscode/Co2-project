import 'package:flutter/material.dart';

class StatusIndicattor extends StatelessWidget {
  final String title;
  final String value;
  final Color Statuscolor;
  final VoidCallback onPressed;

  const StatusIndicattor(
      {super.key,
      required this.title,
      required this.Statuscolor,
      required this.value,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(alignment: Alignment.topCenter, children: [
        Container(
          margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
          height: 68,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 218, 205, 205).withOpacity(0.25)),
              color: const Color.fromARGB(137, 45, 45, 45),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10))),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                value,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
            // height:68 ,
            width: 60,
            height: 1,
            decoration: BoxDecoration(
                border: Border.all(
                    color:
                        Color.fromARGB(255, 218, 205, 205).withOpacity(0.25)),
                color: const Color.fromARGB(137, 45, 45, 45),
                borderRadius: BorderRadius.circular(10)))
      ]),
    );
  }
}
