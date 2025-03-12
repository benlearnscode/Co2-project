import 'dart:ffi';
import 'package:co2emisson/animation/nbuttons.dart';
import 'package:co2emisson/carbonsummary/carbonsummary.dart';
import 'package:co2emisson/utils/helpers.dart';
import 'animation/statusindicatorr.dart';

import 'animation/hompage_segments.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Homepage extends StatefulWidget {
  static const routename = "homepage";
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isSub = true;
  List Subarr = [
    // {"Name": "Electricity", "percentage": "1", },
    // {"Name": "Food", "percentage": "2"},
    // {"Name": "Transport", "percentage": "3"}
  ];
  List Subarr22 = [
    {"Name": "Electricity", "percentage": "1", "route": "ElectrcityHome"},
    {"Name": "Food", "percentage": "2", "route": "FoodHome"},
    {"Name": "Transport", "percentage": "3", "route": "TransportHome"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 223, 223),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(255, 33, 33, 33),
              size: 32,
            ),
          ),
          Container(
            // height: 20,
            // width: 20,
            child: const Text(
              'CARBON TRACKER ',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          )
        ]),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // image: DecorationImage(
                  //     image: AssetImage('assests/starterpage/two.jpg'),
                  //     fit: BoxFit.cover),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                padding: const EdgeInsets.all(15),
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Track Your",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text('Surroundings',
                            style:
                                TextStyle(color: Colors.black, fontSize: 40)),
                      ),
                      SizedBox(height: 8)
                    ]),
              ),
              const SizedBox(height: 12),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Current Summary :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 33, 33, 33),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: StatusIndicattors(),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // Container(
                    //   margin:
                    //       EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //       color: Colors.black54,
                    //       borderRadius: BorderRadius.circular(15)),
                    //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: Segmentbuttonfor(
                    //           title: "--------",
                    //           isActive: isSub,
                    //           onPressed: () {
                    //             setState(() {
                    //               isSub = !isSub;
                    //             });
                    //           },
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),

                    // Container(
                    //     alignment: Alignment.centerLeft,
                    //     padding: EdgeInsets.only(left: 20, bottom: 10),
                    //     child: Text(
                    //       "Insert data:",
                    //       style: TextStyle(
                    //           fontSize: 17, fontWeight: FontWeight.w400),
                    //     )),

                    ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Subarr22.length,
                      itemBuilder: (context, index) {
                        var sObj = Subarr22[index] as Map? ?? {};

                        return categoriss(
                            sObj: sObj,
                            onPressed: () {
                              Navigator.of(context).pushNamed(sObj["route"]);
                            });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Scopes of Co2 emission :",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 174, 176, 177),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Scope 1 emissions :",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                          "               Scope 1 covers emissions from sources that an organisation owns or controls directly – for example from burning fuel in our fleet of vehicles (if they’re not electrically-powered)."),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        " Scope 2 emissions :",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                          "               Scope 2 are emissions that a company causes indirectly and come from where the energy it purchases and uses is produced. For example, the emissions caused when generating the electricity that we use in our buildings would fall into this category."),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        " Scope 3 emissions",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                          "              Scope 3 encompasses emissions that are not produced by the company itself and are not the result of activities from assets owned or controlled by them, but by those that it’s indirectly responsible for up and down its value chain. An example of this is when we buy, use and dispose of products from suppliers. Scope 3 emissions include all sources not within the scope 1 and 2 boundaries."),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Text(
                  "overall graph of carbon emission rate :",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container StatusIndicattors() {
    return Container(
      // height: 430,
      decoration: const BoxDecoration(
          // color: Color.fromARGB(19, 163, 20, 176).withOpacity(0.5),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 42, 46, 42),
                Color.fromARGB(255, 72, 84, 66),
                // Color.fromARGB(255, 9, 71, 4),
              ]),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, bottom: 60),

            // circular graph
            child: GestureDetector(
              onTap: () async {
                var data = await getData();
                setState(() {
                  Subarr = data;
                });
              },
              child: CircularPercentIndicator(
                header: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Text(
                    "Tons of CO2",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
                animation: true,
                animationDuration: 1000,
                radius: 120,
                lineWidth: 40,
                percent: 0.4,
                progressColor: Colors.green,
                backgroundColor: Colors.lightGreen,
                circularStrokeCap: CircularStrokeCap.round,
                center: TextButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamed(carbonsummary.routeName);
                  },
                  child: Text(
                    " 40% ",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          //bottom indicators

          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                children: [
                  Expanded(
                    child: StatusIndicattor(
                      title: "Electricity",
                      value: "12% I",
                      Statuscolor: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: StatusIndicattor(
                      title: "Food",
                      value: "20% D",
                      Statuscolor: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: StatusIndicattor(
                      title: "Transport",
                      value: "1% I",
                      Statuscolor: Colors.red,
                      onPressed: () {},
                    ),
                  )
                ],
                // children: Subarr.map(
                //   (e) => Expanded(
                //     child: StatusIndicattor(
                //       title: e["Name"],
                //       value: "${e['percentage']}%",
                //       Statuscolor: Colors.red,
                //       onPressed: () {
                //         Navigator.of(context).pushNamed(e["route"]);
                //       },
                //     ),
                //   ),
                // ).toList(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
