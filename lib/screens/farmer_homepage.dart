import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotslash5/screens/farmer_sell.dart';
import 'package:dotslash5/screens/farmer_scan.dart';
import 'package:lottie/lottie.dart';
import 'package:alan_voice/alan_voice.dart';

class Fhome extends StatefulWidget {
  const Fhome({Key? key}) : super(key: key);

  @override
  _FhomeState createState() => _FhomeState();
}

class _FhomeState extends State<Fhome> {
  @override
  _FhomeState()
  {
    AlanVoice.addButton("d502206a3c6c981f50997663ba88498a2e956eca572e1d8b807a3e2338fdd0dc/stage",buttonAlign:AlanVoice.BUTTON_ALIGN_LEFT);
    AlanVoice.onCommand.add((command) {
    debugPrint("got new command ${command.toString()}");
  });
  }

  Widget build(BuildContext context) {
    var balance = 2500;
    return Scaffold(
      backgroundColor: Colors.green.withOpacity(0.8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Balance Text
          const SizedBox(height: 80,),
          // Container(
          //   height: 150,
          //   width: 200,
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topRight,
          //         end: Alignment.bottomLeft,
          //         colors: [Colors.lightBlueAccent, Colors.blueAccent]),
          //     borderRadius: BorderRadius.all(Radius.circular(20)),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //         top: 40, left: 32, right: 32, bottom: 32),
          //     child: Column(
          //       children: [
          //         const Text('Balance ',
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 26,
          //             )),
          //         Text(
          //           balance.toString(),
          //           style: const TextStyle(
          //             fontSize: 24,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

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
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: const Text('Balance ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          '₹ '+balance.toString(),
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
            decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
            )
          ),
          Container(
            color: Colors.white,
            child: Column(
            children: [
            //First row
            Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 32, right: 32),
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
                                      builder: (context) => Fsell(),
                                    ));
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.7),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Lottie.network(
                                    'https://assets5.lottiefiles.com/packages/lf20_1rxvx0be.json'),
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Fscan(),
                                            ));
                                      },
                                      child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.green.withOpacity(0.7),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Lottie.network(
                                              'https://assets10.lottiefiles.com/private_files/lf30_tcuqw7ib.json')),
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
              padding: const EdgeInsets.only(left: 14.0),
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
                                    builder: (context) => Fsell(),
                                  ));
                            },
                            child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.7),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Lottie.network(
                                    'https://assets6.lottiefiles.com/packages/lf20_Xmi2ep.json')),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Fsell(),
                                  ));
                            },
                            child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.7),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Lottie.network(
                                    'https://assets1.lottiefiles.com/packages/lf20_ivftmpdk.json')),
                          ),
                          Text('Find a transport'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],),),
          Expanded(child: Container(color: Colors.white,))

        ],
      ),
    );
  }
}
