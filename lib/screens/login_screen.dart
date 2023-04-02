import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_java_program/screens/signup_screen.dart';
import 'package:learn_java_program/screens/forgotpassword_screen.dart';
import 'package:learn_java_program/screens/home_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  bool _success = false;
  String _userEmail = "";

  void _signIn() async {
    final User? user = (await _auth.signInWithEmailAndPassword(
            email: _emailEditingController.text,
            password: _passwordEditingController.text))
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
        msg: "Login Successful!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[700]?.withOpacity(0.7),
        textColor: Colors.black,
        fontSize: 16.0
    );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
    }else{
      Fluttertoast.showToast(
        msg: "Login failed! Try Again",
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
                      "Login",
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
              controller: _emailEditingController,
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
              controller: _passwordEditingController,
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
          Container(
            margin: EdgeInsets.only(top: 20, right: 20),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()))
              },
            ),
          ),
          GestureDetector(
            onTap: () async {
              //Login Navigator
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => HomePage()))
              _signIn();
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
                "LOGIN",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              //Login Navigator
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()))
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
                "Skip For Now",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 40),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Don't Have Account?",
                style: TextStyle(fontSize: 20),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()))
                },
                child: Text(
                  "Register Now",
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
