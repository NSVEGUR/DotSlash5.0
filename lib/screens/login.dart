import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotslash5/screens/farmer_homepage.dart';
import 'package:dotslash5/screens/middleman_homepage.dart';
import 'package:dotslash5/screens/consumer_homepage.dart';
import 'package:dotslash5/screens/transporter_homepage.dart';
class Login extends StatefulWidget {
  var user_type;
  Login(this.user_type);
  @override
  _LoginState createState() => _LoginState(user_type);
}

class _LoginState extends State<Login> {
  var user_type;
  _LoginState(this.user_type);
  @override
  Widget build(BuildContext context) {
    bool login = false;
    TextEditingController usr = new TextEditingController();
    TextEditingController pwd = new TextEditingController();
    TextEditingController cpwd = new TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36.0, left: 8),
                child: GestureDetector(
                  onTap: (){ Navigator.pop(context);},
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Row(
                children: [
                  (login == true)
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                login = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF8EC16F),
                                borderRadius: BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF8EC16F),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                login = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF8EC16F),
                                borderRadius: BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF8EC16F),
                                        fontSize: 20),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                  (login == true)
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                login = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF8EC16F),
                                borderRadius: BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF8EC16F),
                                        fontSize: 20),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                login = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF8EC16F),
                                borderRadius: BorderRadius.all(Radius.circular(28)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF8EC16F),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
              (login == true)
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: TextField(
                                    controller: usr,
                                    decoration: InputDecoration(
                                      hintText: " Email ",
                                      prefixIcon: Icon(Icons.person_rounded),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: TextField(
                                    controller: pwd,
                                    decoration: InputDecoration(
                                      hintText: " password ",
                                      prefixIcon: Icon(Icons.lock_rounded),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: TextField(
                                    controller: usr,
                                    decoration: InputDecoration(
                                      hintText: " Email  ",
                                      prefixIcon: Icon(Icons.person_rounded),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: TextField(
                                    controller: pwd,
                                    decoration: InputDecoration(
                                      hintText: " password ",
                                      prefixIcon: Icon(Icons.lock_rounded),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: TextField(
                                    controller: cpwd,
                                    decoration: InputDecoration(
                                      hintText: " Confirm password ",
                                      prefixIcon: Icon(Icons.lock_rounded),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
      floatingActionButton: GestureDetector(onTap: (){
        //TODO user login or signup
      },
        child: GestureDetector(
          onTap: (){
            if(user_type==0)
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Fhome(), ));
            else if(user_type==1)
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Mhome(), ));
            else if(user_type==2)
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Chome(), ));
            else
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Thome(), ));

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              (login==true)?
              Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey),
              ):
              Text(
                'Sign up',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0xFF2FB37B),
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
