import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/top.png',
                width: size.width * 0.5,
              ),
            ),
            Positioned(
              bottom: 0,
              right: -20,
              child: Image.asset(
                'assets/images/bottom.png',
                width: size.width * 0.8,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200.0, left: 64),
                  child: Text(
                    'Welcome to',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0, top: 8),
                  child: Text(
                    'AGRI CONNECT',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Color(0xFF236248)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
                  child: Text(
                    'its an app that connects farmers , middleman , traders and customers',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:56),
                  child: Text('Join as',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xFF236248)),),
                ),
                //login buttons
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:8,horizontal: 50),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFE0FFF2),
                          borderRadius: BorderRadius.all(Radius.circular(20))


                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Text('Farmer',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey),),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25))
                              ),
                              child: Icon(Icons.arrow_forward_rounded ,color:Color(0xFF2FB37B)
                                ,size: 30, ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>login()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:8,horizontal: 50),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFE0FFF2),
                          borderRadius: BorderRadius.all(Radius.circular(20))


                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Text('Trader',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey),),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25))
                              ),
                              child: Icon(Icons.arrow_forward_rounded ,color:Color(0xFF2FB37B)
                                ,size: 30, ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:8,horizontal: 50),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFE0FFF2),
                          borderRadius: BorderRadius.all(Radius.circular(20))


                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Text('Consumer',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey),),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25))
                              ),
                              child: Icon(Icons.arrow_forward_rounded ,color:Color(
                                  0xFF2FB37B)
                                ,size: 30, ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
