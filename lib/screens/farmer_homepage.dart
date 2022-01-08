import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotslash5/screens/farmer_sell.dart';
import 'package:dotslash5/screens/farmer_scan.dart';
import 'package:lottie/lottie.dart';

class Fhome extends StatefulWidget {
  const Fhome({Key? key}) : super(key: key);

  @override
  _FhomeState createState() => _FhomeState();
}

class _FhomeState extends State<Fhome> {
  @override
  Widget build(BuildContext context) {
    var balance=0;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Balance Text
          Container(
            height: 150,
            width: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [Colors.lightBlueAccent,Colors.blueAccent]),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40,left: 32,right: 32,bottom: 32),
              child: Column(
                children: [
                  const Text('Balance ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: ,
                    fontSize: 26,
                  )),
                  Text(balance.toString(),
                  style: const TextStyle(
                    fontSize: 24,
                  ),)
                  ,
                ],
              ),
            ),
          ),

          //First row
          Padding(
            padding: const EdgeInsets.only(top: 32.0,left: 55,right: 32),
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Fsell(),));
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.7),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_1rxvx0be.json'),
                            ),
                          ),
                          Text('Add a crop'),
                        ],
                      ),
                    ),
                  ),
                  //TODO sell the crop
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => Fscan(),));
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(0.7),
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                      ),
                                      child: Lottie.network('https://assets10.lottiefiles.com/private_files/lf30_tcuqw7ib.json')
                                    ),
                                  ),
                                  Text('Sell your crop'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //Second row
          Padding(
            padding: const EdgeInsets.only(left: 32,right: 32),
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Fsell(),));
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.7),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Lottie.network('https://assets6.lottiefiles.com/packages/lf20_Xmi2ep.json')
                            ),
                          ),
                          Text('My transaction history'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Fsell(),));
                            },
                            child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.7),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Lottie.network('https://assets1.lottiefiles.com/packages/lf20_ivftmpdk.json')
                            ),
                          ),
                          Text('Find a transport'),
                        ],
                      ),
                    ),
                  ),
                ],

              ),
            ),
          ),

        ],
      ),
    );
  }
}
