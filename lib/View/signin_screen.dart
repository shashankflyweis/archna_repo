import 'package:archna_frontend/View/Home_screen.dart';
import 'package:archna_frontend/View/signup_screen.dart';
import 'package:archna_frontend/constant/backgroundColor.dart';
import 'package:archna_frontend/constant/bottom_nav.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:archna_frontend/models/loginmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:archna_frontend/models/variables/service.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

late Loginmodel _loginmodel;

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _numberController = TextEditingController();

  TextEditingController _passwordcontoller = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<Loginmodel> signin(String email, String password) async {
      var response = await http.post(
          Uri.http("archana-metal-health.herokuapp.com", "api/users/login"),
          body: {"email": email, "password": password});
      var data = response.body;

      print(data);
      if (response.statusCode == 200) {
        String responseString = response.body;
        _loginmodel = Loginmodel.fromJson(jsonDecode(response.body));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', _loginmodel.token.toString());
        service.token = _loginmodel.token.toString();
        String? stringValue = prefs.getString('token');
        print(stringValue);

        dataModelFromJson(responseString);
        print(response.body);
        Get.to(()=>Bottom2());
        return Loginmodel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("failed");
      }
    }

    return Scaffold(
        body: BackgroundColor(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: 7.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Center(
                    child: TextFormField(
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: 16),
                      cursorHeight: 25.0,
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                          hintText: 'Email Address',
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                          prefixIconColor: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 7.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Center(
                    child: TextFormField(
                      obscureText: true,
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: 16),
                      cursorHeight: 25.0,
                      controller: _passwordcontoller,
                      decoration: InputDecoration(
                          hintText: 'password',
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () => signin(_emailcontroller.text.toString(),
                          _passwordcontoller.text.toString()),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Get.to(SignUpScreen()),
                      child: Text(
                        'Not have an account? Sign up',
                        style: text4,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'or continue as a guest',
                        style: text4,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
