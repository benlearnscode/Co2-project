import "/loginpage.dart";
import "/signup.dart";
import "package:flutter/material.dart";
import 'package:flutter_animate/flutter_animate.dart';

class StarterPage extends StatefulWidget {
  static const routeName = "StartPage";
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assests/starterpage/one.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Animate(
                  effects: [
                    FadeEffect(curve: Curves.easeIn),
                    SlideEffect(duration: Duration(milliseconds: 1500))
                  ],
                  child: Text(
                    "Making it Count ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Animate(
                  effects: [
                    SlideEffect(
                      duration: Duration(milliseconds: 1500),
                    )
                  ],
                  child: Text(
                    "Track, reduce, and offset your carbon footprint with our innovative app designed for sustainable living.",
                    style: TextStyle(
                        color: Colors.white, height: 1.5, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Animate(
                  effects: [
                    FadeEffect(curve: Curves.easeIn, begin: .1, end: .9),
                    SlideEffect(duration: Duration(milliseconds: 1500))
                  ],
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 10, 90, 4),
                          Color.fromARGB(255, 64, 191, 0),
                          // Color.fromARGB(255, 9, 71, 4),
                        ])),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginPage.routeName);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(14),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Roboto-Light'),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Animate(
                  effects: [
                    FadeEffect(curve: Curves.easeIn),
                    SlideEffect(duration: Duration(milliseconds: 1500))
                  ],
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 10, 90, 4),
                          Color.fromARGB(255, 64, 191, 0),
                          // Color.fromARGB(255, 9, 71, 4),
                        ])),
                    child: MaterialButton(
                      minWidth: double.maxFinite,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => signupPage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: const Text(
                          "Sign-Up",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Roboto-bold'),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  child: Text(
                    "Just a small step as awarness",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
