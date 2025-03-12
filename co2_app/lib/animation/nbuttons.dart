import 'package:flutter/material.dart';

class categoriss extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressed;

  const categoriss({super.key, required this.sObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // height: 70,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          height: 70,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 218, 205, 205).withOpacity(0.25)),
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color.fromARGB(255, 2, 28, 2),
                    Color.fromARGB(255, 38, 39, 38),
                    // Color.fromARGB(255, 9, 71, 4),
                  ]),
              borderRadius: BorderRadius.circular(15)),
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            height: 58,
            decoration: BoxDecoration(
                color: Color.fromARGB(19, 0, 0, 0).withOpacity(0.5),
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Colors.white, width: 0.2)),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      sObj["Name"],
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  width: 9,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Text(
                    "${sObj["percentage"]}%",
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
