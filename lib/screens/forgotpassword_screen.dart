import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Colors.green[700],
                gradient: LinearGradient(
                    colors: [(Color.fromARGB(255, 11, 134, 64)), (Color.fromARGB(255, 27, 143, 48))],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Image.asset("assets/images/thinking.png", height: 120,),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: Text("Learn Java Programming", 
                  style: TextStyle(
                    fontSize : 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),

                ),
                Container(
                    margin: EdgeInsets.only(right: 30, top: 40),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ]),
            alignment: Alignment.center,
            child: TextField(
              cursorColor: Colors.green[700],
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.green[700],
                  ),
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),

          GestureDetector(
            onTap: () => {
              //Forgot Navigator
                  Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ForgotPassword()
                ))
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              height: 54,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [(Color.fromARGB(255, 11, 134, 64)), (Color.fromARGB(255, 27, 143, 48))],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              child: Text(
                "GO",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}