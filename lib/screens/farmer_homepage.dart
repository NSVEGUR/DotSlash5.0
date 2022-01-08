import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotslash5/screens/farmer_sell.dart';
import 'package:dotslash5/screens/farmer_scan.dart';

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
          Text('Balance '),
          Text(balance.toString()),
          //TODO add new crop   cropscanning
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
                      child: Icon(Icons.add,size: 40,),
                    ),
                  ),
                  Text('Add a crop'),
                ],
              ),
            ),
          ),
          //TODO sell the crop
          Padding(
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
                      child: Icon(Icons.add,size: 40,),
                    ),
                  ),
                  Text('Add a crop'),
                ],
              ),
            ),
          ),
          //TODO history
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
                      child: Icon(Icons.add,size: 40,),
                    ),
                  ),
                  Text('Add a crop'),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
