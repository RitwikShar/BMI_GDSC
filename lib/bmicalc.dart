import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:math' as math;

class BmiCalc extends StatefulWidget {
  const BmiCalc({super.key});

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  var heightCont = TextEditingController();
  var weightCont = TextEditingController();
  var bmiCont = TextEditingController();
  var res = '';

  // ignore: non_constant_identifier_names
  var Status = '';
  int count = 0;

  Color containerCol = const Color.fromARGB(255, 233, 229, 229);
  Color containerCol2 = const Color.fromARGB(255, 233, 229, 229);

  Color  metcol= const Color.fromARGB(255, 233, 229, 229);
  Color  inchcol = const Color.fromARGB(255, 233, 229, 229);
  Color  kgcol= const Color.fromARGB(255, 233, 229, 229);
  Color  lbscol = const Color.fromARGB(255, 233, 229, 229);
  

  Map<String, Color> colorMap = {
    'Normal': Colors.green,
    'Severely Underweight': const Color.fromARGB(255, 255, 17, 0),
    'Underweight': Colors.deepOrange,
    'Slightly Underweight': const Color.fromARGB(255, 255, 230, 0),
    'Overweight': Colors.deepOrange,
    'Slightly Overweight': const Color.fromARGB(255, 255, 230, 0),
    'Severely Overweight': const Color.fromARGB(255, 255, 60, 0),
    'Obese': const Color.fromARGB(255, 255, 17, 0),
    'Out of Range': const Color.fromARGB(255, 255, 0, 0),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'BMI Calculator',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 22),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.history,
                    color: Colors.black,
                  ),
                  iconSize: 30,
                ),
              ],
            ),
            body: SingleChildScrollView(
                child: Column(children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 233, 229, 229),
                            borderRadius: BorderRadius.circular(10)),
                        width: 170,
                        height: 140,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 4),
                              child: const Text(
                                'Age',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                '$count',
                                style: const TextStyle(fontSize: 40),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (count != 0) {
                                          count--;
                                        }
                                      });
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.purple),
                                    ),
                                    child: const Text(
                                      '-',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ), // add some space between the buttons
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (count <= 100) {
                                          count++;
                                        }
                                      });
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.purple),
                                    ),
                                    child: const Text(
                                      '+',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (containerCol2 == Colors.amber) {
                              containerCol2 =
                                  const Color.fromARGB(255, 233, 229, 229);
                              containerCol = Colors.amber;
                            } else {
                              containerCol = Colors.amber;
                            }
                          });
                        },
                        child: Container(
                          height: 65,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: containerCol,
                          ),
                          child: const Center(
                            child: Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (containerCol == Colors.amber) {
                                containerCol =
                                    const Color.fromARGB(255, 233, 229, 229);
                                containerCol2 = Colors.amber;
                              } else {
                                containerCol2 = Colors.amber;
                              }
                            });
                          },
                          child: Container(
                            height: 65,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: containerCol2,
                            ),
                            child: const Center(
                              child: Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )),
                    ])
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 250,
                            padding:
                                const EdgeInsets.only(top: 20, right: 20, left: 20),
                            child: TextField(
                              controller: heightCont,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 233, 229, 229),
                                  prefixIcon: Transform.rotate(
                                    angle: -math.pi / 4,
                                    child: SvgPicture.asset(
                                      "assets/ruler.svg",
                                      width: 4,
                                      height: 4,
                                    ),
                                  ),
                                  hintText: "Height",
                                  hintStyle: const TextStyle(
                                      fontFamily: 'Poppins', fontSize: 22),
                                  hoverColor: Colors.black,
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      // ignore: prefer_const_constructors
                                      borderSide: BorderSide(
                                          color: const Color.fromARGB(
                                              255, 233, 229, 229),
                                          width: 0)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    // ignore: prefer_const_constructors
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 233, 229, 229),
                                        width: 0),
                                  )),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                            GestureDetector(
                        onTap: () {
                          setState(() {
                            if (lbscol == Colors.amber) {
                              lbscol =
                                  const Color.fromARGB(255, 233, 229, 229);
                              kgcol = Colors.amber;
                            } else {
                              kgcol = Colors.amber;
                            }
                          });
                        },
                        child: Container(width: 50,height: 50,decoration: BoxDecoration(color: kgcol,borderRadius: BorderRadius.circular(20)),
                        child: const Center(child: Text('Cm',style: TextStyle(fontSize: 20),))),),
                           const SizedBox(width: 10,),
                          GestureDetector(
                        onTap: () {
                          setState(() {
                            if (kgcol == Colors.amber) {
                              kgcol =
                                  const Color.fromARGB(255, 233, 229, 229);
                              lbscol = Colors.amber;
                            } else {
                              lbscol = Colors.amber;
                            }
                          });
                        },
                        child: Container(width: 50,height: 50,decoration: BoxDecoration(color: lbscol,borderRadius: BorderRadius.circular(20)),
                        child: const Center(child: Text('m',style: TextStyle(fontSize: 20),))),),

                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 250,
                            padding:
                                const EdgeInsets.only(top: 20, right: 20, left: 20),
                            child: TextField(
                              controller: weightCont,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 233, 229, 229),
                                  //prefixIcon:
                                  prefixIcon: SvgPicture.asset("assets/scale.svg",
                                      width: 5, height: 5),
                                  hintText: "Weight",
                                  hintStyle: const TextStyle(
                                      fontFamily: 'Poppins', fontSize: 22),
                                  hoverColor: Colors.black,
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      // ignore: prefer_const_constructors
                                      borderSide: BorderSide(
                                          color: const Color.fromARGB(
                                              255, 233, 229, 229),
                                          width: 0)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    // ignore: prefer_const_constructors
                                    borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 233, 229, 229),
                                        width: 0),
                                  )),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        GestureDetector(
                        onTap: () {
                          setState(() {
                            if (metcol == Colors.amber) {
                              metcol =
                                  const Color.fromARGB(255, 233, 229, 229);
                              inchcol = Colors.amber;
                            } else {
                              inchcol = Colors.amber;
                            }
                          });
                        },
                        child: Container(width: 50,height: 50,decoration: BoxDecoration(color: inchcol,borderRadius: BorderRadius.circular(20)),
                        child: const Center(child: Text('Kgs',style: TextStyle(fontSize: 20),))),),
                        const SizedBox(width: 10,),
                        GestureDetector(
                        onTap: () {
                          setState(() {
                            if (inchcol == Colors.amber) {
                              inchcol =
                                  const Color.fromARGB(255, 233, 229, 229);
                              metcol = Colors.amber;
                            } else {
                              metcol = Colors.amber;
                            }
                          });
                        },
                        child: Container(width: 50,height: 50,decoration: BoxDecoration(color: metcol,borderRadius: BorderRadius.circular(20)),
                        child: const Center(child: Text('Lbs',style: TextStyle(fontSize: 20),))),),


                        ],
                      ),
                      //Container(
                      //child: Image.asset('assets/bmilogo.png',width: 200,height: 00,fit: BoxFit.contain,),
                      //)
                    ],
                  ),
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 30, right: 20, left: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      var wt = weightCont.text;
                      var ht = heightCont.text;
                      var iWt = int.parse(wt);
                      var iHt = int.parse(ht);
                      var excp = 'Data Incomplete';
                      var bmi = 10000 * (iWt / (iHt * iHt));

                      if (wt != '' || ht != '') {
                        res = bmi.toStringAsPrecision(4);
                      } else {
                        res = excp;
                      }
                      if (bmi > 18 && bmi < 25) {
                        Status = 'Normal';
                      } else if (bmi < 16) {
                        Status = 'Severely Underweight';
                      } else if (bmi > 16 && bmi < 17) {
                        Status = 'Underweight';
                      } else if (bmi > 17 && bmi < 18.5) {
                        Status = 'Slightly Underweight';
                      } else if (bmi > 25 && bmi < 30) {
                        Status = 'Overweight';
                      } else if (bmi > 30 && bmi < 35) {
                        Status = 'Slightly Overweight';
                      } else if (bmi > 35 && bmi < 40) {
                        Status = 'Severely Overweight';
                      } else if (bmi > 40) {
                        Status = 'Obese';
                      } else {
                        Status = 'Out of Range';
                      }

                      setState(() {
                        res = bmi.toStringAsPrecision(4);
                        // Status = '$Status';
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Center(
                        child: GradientText(
                          'Calculate',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          colors: const [
                            Colors.purple,
                            Colors.pink,
                            Color.fromARGB(255, 212, 6, 75),
                            Colors.purple
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      heightCont.text = '';
                      weightCont.text = '';
                      res = '';
                      Status = '';
                      count = 0;
                      containerCol = const Color.fromARGB(255, 233, 229, 229);
                      containerCol2 = const Color.fromARGB(255, 233, 229, 229);
                      inchcol=const Color.fromARGB(255, 233, 229, 229);
                      kgcol=const Color.fromARGB(255, 233, 229, 229);
                      metcol=const Color.fromARGB(255, 233, 229, 229);
                      lbscol=const Color.fromARGB(255, 233, 229, 229);
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Center(
                        child: GradientText(
                          'Reset',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          colors: const [
                            Colors.purple,
                            Colors.pink,
                            Color.fromARGB(255, 212, 6, 75),
                            Colors.purple
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text(
                "Your BMI Score:",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                width: 360,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 233, 229, 229),
                ),
                child: Column(children: [
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  Text(
                    res,
                    style: const TextStyle(
                        fontSize: 40, color: Color.fromARGB(255, 185, 9, 162)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    Status,
                    style: TextStyle(
                      color: colorMap[Status],
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                height: 280,
                width: 360,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 233, 229, 229),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.only(left: 25, top: 20),
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Category',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            width: 170,
                          ),
                          Text(
                            'BMI Range',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Severely Underweight',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 90),
                              Text(
                                '< 16',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Underweight',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 160),
                              Text(
                                '16-17',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Slightly Underweight',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 90),
                              Text(
                                '17-18.5',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Normal',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 200),
                              Text(
                                '18-25',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Slightly Overweight',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 110),
                              Text(
                                '25-30',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Overweight ',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 165),
                              Text(
                                '30-35',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Severely Overweight',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 100),
                              Text(
                                '35-40',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Obese',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 210),
                              Text(
                                '> 40',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)
              )
            ]
          )
        )
      )
    );
  }
}
