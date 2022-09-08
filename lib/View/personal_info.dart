import 'package:archna_frontend/View/Home_screen.dart';
import 'package:archna_frontend/View/feeling_page.dart';
import 'package:archna_frontend/constant/backgroundColor.dart';
import 'package:archna_frontend/constant/bottom_nav.dart';
import 'package:archna_frontend/constant/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoder/geocoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:archna_frontend/models/profilemodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:archna_frontend/models/locationmodel.dart';
import 'package:archna_frontend/models/variables/service.dart';

class PersonalInfo extends StatefulWidget {
  PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final selected2 = "select your gender".obs;

  List dropdownText2 = [
    'select your gender',
    'male',
    'female',
    'other',
  ];

  void setSelected1(String value1) {
    selected2.value = value1;
  }

  final selected = "select your age".obs;

  List dropdownText = ['select your age', '20-25', '25-30', '30-35', '35+'];

  void setSelected(String value) {
    selected.value = value;
  }

  var locationMessage = "";

  String age = '';
  String gender = '';
  String token = '';
  void gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token').toString();
    service.token = prefs.getString('token').toString();
  }

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      //final coordinates =
      new Coordinates(position.latitude, position.longitude);
      locationMessage = "${position.latitude.toDouble()}," +
          '${position.longitude.toDouble()}';
      //var addresses = Geocoder.local.findAddressesFromCoordinates(coordinates);
    });
  }

  Future<Profilemodel> pinfo(String age, String gender) async {
    var response = await http.patch(
        Uri.http("archana-metal-health.herokuapp.com", "api/users/me"),
        body: {"age": age, "gender": gender},
        headers: {'Authorization': 'Bearer ${token}'});
    var data = response.body;

    print(data);
    if (response.statusCode == 200) {
      String responseString = response.body;

      dataModelFromJson(responseString);
      print(response.body);
      Get.to(() => Bottom2());
      return Profilemodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed");
    }
  }

  Future<Locationmodel> loca(String location) async {
    var response = await http.post(
        Uri.http(
            "archana-metal-health.herokuapp.com", "api/users/save-location"),
        body: {"latLng": location},
        headers: {'Authorization': 'Bearer ${token}'});
    var data = response.body;

    print(data);
    if (response.statusCode == 200) {
      String responseString = response.body;

      dataModelFromJson1(responseString);
      print(response.body);

      return Locationmodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed");
    }
  }

  @override
  void initState() {
    super.initState();
    gettoken();
    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundColor(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'We Can costumize this',
                    style: text5,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    'Experience for you',
                    style: text5,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'we would like to know',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Obx(
                    () => Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              // border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              iconEnabledColor: Colors.black,
                              iconSize: 24,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  letterSpacing: 2),
                              // menuMaxHeight: 140,
                              isDense: true,
                              itemHeight: 50,
                              // underline: Text('data'),
                              alignment: Alignment.centerLeft,
                              isExpanded: true,
                              hint: Text(
                                'Area',
                              ),
                              onChanged: (newValue) {
                                setSelected(newValue as String);
                                age = newValue;
                              },
                              value: selected.value,
                              items: dropdownText.map((selectedType) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    selectedType,
                                    style: TextStyle(color: Colors.black),
                                  ).pOnly(left: 12),
                                  value: selectedType,
                                );
                              }).toList(),
                            ).centered().pSymmetric(h: 4))
                        // .w(94.w)
                        .h(7.h)
                        .pOnly(top: 8)
                        .centered(),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(
                    () => Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              // border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              iconEnabledColor: Colors.black,
                              iconSize: 24,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  letterSpacing: 2),
                              // menuMaxHeight: 140,
                              isDense: true,
                              itemHeight: 50,
                              // underline: Text('data'),
                              alignment: Alignment.centerLeft,
                              isExpanded: true,
                              hint: Text(
                                'Area',
                              ),
                              onChanged: (newValue) {
                                setSelected1(newValue as String);
                                gender = newValue;
                              },
                              value: selected2.value,
                              items: dropdownText2.map((selectedType) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    selectedType,
                                    style: TextStyle(color: Colors.black),
                                  ).pOnly(left: 12),
                                  value: selectedType,
                                );
                              }).toList(),
                            ).centered().pSymmetric(h: 4))
                        // .w(94.w)
                        .h(7.h)
                        .pOnly(top: 8)
                        .centered(),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                      height: 7.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          locationMessage.isEmpty
                              ? Text(
                                  'Current Location',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  locationMessage,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                          IconButton(
                            icon: Icon(
                              Icons.zoom_in,
                              size: 17,
                            ),
                            onPressed: () {
                              getCurrentLocation();
                            },
                          )
                        ],
                      ).pOnly(left: 10, right: 10)),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Have you gone to a mental health professional',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    ' for anxiety or depression.',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () => {pinfo(age, gender), loca(locationMessage)},

                    //Get.to(FeelingScreen()),
                    child: Container(
                      height: 8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.black),
                      child: Center(
                        child: Text('Sumit',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                      child: TextButton(
                    onPressed: () {},
                    child: Text('Skip',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
