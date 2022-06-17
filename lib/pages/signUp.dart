import 'package:flutter/material.dart';
import 'package:flutter_application_ggggggggggggggggg/pages/home.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'package:flutter/gestures.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  void sigup(String email, username, password) async {
    try {
      Response response = await post(
          Uri.parse('http://127.0.0.1:8000/auth/register/'),
          body: {'email': email, 'username': username, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        //print(data['token']);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Second()));

        print('account created successfully');
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
                      controller: usernameController,
                      cursorColor: Color.fromARGB(255, 187, 181, 181),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 160, 157, 155),
                            size: 20,
                          ),
                          hintText: 'username',
                          border: InputBorder.none),
                    )),
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
                      controller: passwordController,
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
                    sigup(
                        emailController.text.toString(),
                        usernameController.text.toString(),
                        passwordController.text.toString());
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
                          'Sign up',
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
}
