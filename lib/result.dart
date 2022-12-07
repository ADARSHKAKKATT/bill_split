import 'package:bill_split1/main.dart';
import 'package:flutter/material.dart';
class Bill1 extends StatefulWidget {
  double friends;
  String tax;
  double tip;
  String tot;


  Bill1({Key? key, required this.friends, required this.tax,required this.tip,required this.tot}) : super(key: key);

  @override
  State<Bill1> createState() => _Bill1State();
}

class _Bill1State extends State<Bill1> {
  double bill=0;
  @override
  void initState() {
    super.initState();
    taxcalc();
  }
  void taxcalc(){

    double taxamount=double.parse(widget.tot)*double.parse(widget.tax)/100;
    double finalbill=double.parse(widget.tot)+taxamount+ widget.tip/widget.friends;
    setState(() {
    bill=finalbill;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Column(

              children: [
                SizedBox(height: 30,),
                Row(
                  children: [
                    Text("Result",
                      style: TextStyle(
                        fontSize: 40,fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                Container(
                  // margin: EdgeInsets.only(left: 10,right: 10),
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    // borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 70),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text("Equally Divided",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              Text("\$ ${bill.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              )
                            ],
                          ),

                          SizedBox(width: 40,),
                          Column(
                            children: [
                              Text("Friends",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              Text("Tax",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              Text("Tip",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 40,),
                          Column(
                            children: [
                              Text(widget.friends.toString(),
                                style: TextStyle(
                                    fontSize: 30
                                ),
                              ),
                              Text(widget.tax,
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              Text("\$"+widget.tip.toString(),
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              )
                            ],
                          ),
                        ]
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Everybody Should Pay \$ ${bill.toStringAsFixed(2)}",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                    child: Text(
                      "Calculate Again",
                      style: TextStyle(fontSize: 30),
                    ),
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