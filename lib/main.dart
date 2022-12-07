import 'package:bill_split1/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirstState();
}

class FirstState extends State<FirstPage> {
  double slider = 0;
  String tax = "";
  double tip = 0;
  String tot = "";

  myButton(String a) {
    return Expanded(
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(20),
            ),
            onPressed: () {
              if (a == "-") {
                setState(() {
                  tot = "";
                });
              } else {
                setState(() {
                  tot += a;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                a,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Split Bill",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  // borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 70),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              "$tot",
                              style: TextStyle(
                                fontSize: 50,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: [
                            Text(
                              "Friends",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "Tax",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "Tip",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "$slider",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "${tax}%",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "\$${tip}",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "How many friends ?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              /*Container(
                  color: Colors.orangeAccent,
                  height: 50,
                  width: double.maxFinite,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Calculate Again ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),*/
              Slider(
                  max: 20,
                  min: 0,
                  inactiveColor: Colors.grey,
                  activeColor: Colors.orangeAccent,
                  divisions: 20,
                  value: slider,
                  onChanged: (value) {
                    setState(() {
                      slider = value;
                    });
                  }),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.yellow,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "TIP",
                              style: TextStyle(fontSize: 50),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /*CircleAvatar(
                                radius:  30,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),*/
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (tip == 0) {
                                    tip = 0;
                                  } else {
                                    tip--;
                                  }
                                });
                              },
                              child: Icon(Icons.remove),
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              "\$${tip}",
                              style: TextStyle(fontSize: 40),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  tip++;
                                });
                              },
                              child: Icon(Icons.add),
                              backgroundColor: Colors.grey,
                            ),
                            /*CircleAvatar(
                                radius:  30,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                    Icons.add,
                                  color: Colors.black,
                                ),
                              ),*/
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(40)),
                    width: 400,
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                tax = value;
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 50),
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Tax in %"),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
               SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  myButton("1"),
                  myButton("2"),
                  myButton("3"),
                ],
              ),
              Row(
                children: [
                  myButton("4"),
                  myButton("5"),
                  myButton("6"),
                ],
              ),
              Row(
                children: [
                  myButton("7"),
                  myButton("8"),
                  myButton("9"),
                ],
              ),
              Row(
                children: [
                  myButton("."),
                  myButton("0"),
                  myButton("-"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.maxFinite,
                height: 60,
                color: Colors.deepOrange,

                child: ElevatedButton(

                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            Bill1(friends:slider,tax:tax,tip:tip,tot:tot)));

                  },
                  child: Text(
                    "Split Bill",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
