// import 'dart:html';

import 'package:archna_frontend/View/personal_info.dart';
import 'package:archna_frontend/View/privacy_screen.dart';
import 'package:archna_frontend/View/signin_screen.dart';
import 'package:archna_frontend/constant/backgroundColor.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:archna_frontend/models/Signup_correct.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
late Signup_correct _signupmodel;
class _SignUpScreenState extends State<SignUpScreen> {
  
  TextEditingController _numberController = TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
     void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(value)
    ));
  }
    Future<Signup_correct> signup(
        String mobile, String email, String password) async {
      var response = await http.post(
          Uri.http("archana-metal-health.herokuapp.com", "api/users/signup"),
          body: {"email": email, "password": password, "mobile": mobile});
      var data = response.body;
      
      print(data);
      if (response.statusCode == 201) {
        String responseString = response.body;
        _signupmodel = Signup_correct.fromJson(jsonDecode(response.body));
        SharedPreferences prefs = await SharedPreferences.getInstance();
         prefs.setString('token', _signupmodel.token.toString());
        dataModelFromJson(responseString);
        print(response.body);
        
       
        _scaffoldkey.currentState!.showSnackBar(SnackBar(
            content: Text('Signup successful',
                style: TextStyle(
                  color: Colors.white,
                ))));
                await Future.delayed(const Duration(seconds: 1));
                 Get.to(PersonalInfo());
        return Signup_correct.fromJson(jsonDecode(response.body));
      }else if (response.statusCode == 500) {
         _scaffoldkey.currentState!.showSnackBar(SnackBar(
            content: Text('User already exists please login',
                style: TextStyle(
                  color: Colors.white,
                ))));
        await Future.delayed(const Duration(seconds: 1));

    
        Get.to(SignInScreen());
        
        return Signup_correct.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("failed");
      }
    }

    return Scaffold(
      key: _scaffoldkey,
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
                  'Create An Account',
                  style: TextStyle
                  (
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                      ),
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
                      controller: _numberController,
                      decoration: InputDecoration(
                          hintText: 'Mobile Number(optional)',
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.mobile_screen_share_outlined),
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
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'i agree to the',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () => Get.to(PrivacyScreen()),
                        child: Text(
                          'Terms of Service & privacy and policy',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: (() => signup(
                            _numberController.text.toString(),
                            _emailcontroller.text.toString(),
                            _passwordcontoller.text.toString())),
                  child: Container(
                    height: 8.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        'Create Account',
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
                      onPressed: () => {Get.to(SignInScreen())},
                      child: Text(
                        'Already have an account? Sign in',
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
                      onPressed: () {    Get.to(SignInScreen());
                        
                      },
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
