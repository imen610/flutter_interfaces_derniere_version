import 'package:flutter/material.dart';
import 'package:flutter_application_ggggggggggggggggg/pages/home.dart';
import 'package:flutter_application_ggggggggggggggggg/pages/signUp.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var passController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/sideImg.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('h:mm a').format(DateTime.now()),
                        // DateTime.now().toString(),
                        // "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.black)),
                    Expanded(child: Container()),
                  ],
                ),
                Row(
                  children: [
                    Text(
                        DateFormat('EEE, MMM d, ' 'yyyy')
                            .format(DateTime.now()),
                        // DateTime.now().toString(),
                        // "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.grey)),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 100, right: 93),
                    child: Column(children: [
                      Text(
                        'MyWallet',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ]),
                  ),
                ),
                Container(
                    width: 700,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromARGB(255, 217, 213, 213)),
                    child: TextField(
                      controller: emailController,
                      cursorColor: Color.fromARGB(255, 187, 181, 181),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 160, 157, 155),
                            size: 20,
                          ),
                          hintText: 'email',
                          border: InputBorder.none),
                    )),
                Container(
                    width: 700,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromARGB(255, 217, 213, 213)),
                    child: TextField(
                      controller: passController,
                      obscureText: true,
                      cursorColor: Color.fromARGB(255, 187, 181, 181),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.key,
                            color: Color.fromARGB(255, 160, 157, 155),
                            size: 20,
                          ),
                          hintText: 'password',
                          border: InputBorder.none),
                    )),
                InkWell(
                  onTap: () {
                    login_func();
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xffffac30),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 17,
                        )
                      ],
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signUp()))
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xffffac30),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create an account',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  width: 100,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> login_func() async {
    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://localhost:8000/auth/login/"),
          headers: {"Content-Type": "application/json"},
          body: (jsonEncode({
            "email": emailController.text,
            "password": passController.text
          })));
      print(response.statusCode);
      if (response.statusCode != 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("invalid")));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("black field not allowed")));
    }
  }
}
