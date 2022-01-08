import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotslash5/screens/consumer_buy.dart';
import 'package:lottie/lottie.dart';

class Chome extends StatefulWidget {
  const Chome({Key? key}) : super(key: key);

  @override
  _ChomeState createState() => _ChomeState();
}

class _ChomeState extends State<Chome> {
  @override
  Widget build(BuildContext context) {
    var balance = 500;
    return Scaffold(
      backgroundColor: Colors.red.withOpacity(0.8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Balance Text
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('Balance ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          '₹ ' + balance.toString(),
                          style: const TextStyle(
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)))),
          //4 iconsn
          Container(
            color: Colors.white,
            child: Column(
              children: [
                //First row
                Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, left: 32, right: 32),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Cbuy(),
                                        ));
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.7),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Lottie.network(
                                        'https://assets2.lottiefiles.com/packages/lf20_yf4hb6ol.json'),
                                  ),
                                ),
                                Text('Buy a crop'),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Cbuy(),
                                                ));
                                          },
                                          child: Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    Colors.red.withOpacity(0.7),
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              child: Lottie.network(
                                                  'https://assets6.lottiefiles.com/packages/lf20_Xmi2ep.json')
                                          ),
                                        ),
                                        Text('My transaction history'),
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
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
          ))
        ],
      ),
    );
  }
}
