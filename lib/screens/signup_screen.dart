import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_java_program/screens/login_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  late bool _success;
  late String _userEmail;

  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _success = false;
      });
    }

    if (_success) {
      Fluttertoast.showToast(
        msg: "SignUp Successful!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[700]?.withOpacity(0.7),
        textColor: Colors.black,
        fontSize: 16.0
    );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
    }else{
      Fluttertoast.showToast(
        msg: "SignUp failed! Try Again",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[700]?.withOpacity(0.7),
        textColor: Colors.black,
        fontSize: 16.0
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Colors.green[700],
                gradient: LinearGradient(colors: [
                  (Color.fromARGB(255, 11, 134, 64)),
                  (Color.fromARGB(255, 27, 143, 48))
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Image.asset(
                    "assets/images/thinking.png",
                    height: 120,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: Text(
                    "Learn Java Programming",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 30, top: 40),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 40),
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
              controller: _nameController,
              cursorColor: Colors.green[700],
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.green[700],
                  ),
                  hintText: "Enter Full Name",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          //   padding: EdgeInsets.only(left: 20, right: 20),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(50),
          //       color: Colors.grey[200],
          //       boxShadow: [
          //         BoxShadow(
          //             offset: Offset(0, 10),
          //             blurRadius: 50,
          //             color: Color(0xffEEEEEE))
          //       ]),
          //   alignment: Alignment.center,
          //   child: TextField(
          //     cursorColor: Colors.green[700],
          //     decoration: InputDecoration(
          //         icon: Icon(
          //           Icons.phone,
          //           color: Colors.green[700],
          //         ),
          //         hintText: "Enter Phone Number",
          //         enabledBorder: InputBorder.none,
          //         focusedBorder: InputBorder.none),
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
              controller: _emailController,
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
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
              controller: _passwordController,
              obscureText: true,
              cursorColor: Colors.green[700],
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: Colors.green[700],
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          GestureDetector(
            onTap: () async {
              //Signup Navigator
              _register();
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              height: 54,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  (Color.fromARGB(255, 11, 134, 64)),
                  (Color.fromARGB(255, 27, 143, 48))
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              child: Text(
                "SIGN UP",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 40),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Already Have Account?",
                style: TextStyle(fontSize: 20),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()))
                },
                child: Text(
                  "Login Now",
                  style: TextStyle(fontSize: 20, color: Colors.green[700]),
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
