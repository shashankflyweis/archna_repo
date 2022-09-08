import 'package:archna_frontend/View/signin_screen.dart';
import 'package:archna_frontend/component/aboutus.dart';
import 'package:archna_frontend/component/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constant/contant1.dart';
import 'package:archna_frontend/models/variables/service.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffC8F6B6),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xffC8F6B6),
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xffC8F6B6)),
              accountName: Text(
                "${service.name}",
                style: txt1,
              ),
              accountEmail: Text("${service.email}", style: txet2),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Color(0xffC8F6B6),
                  child: CircleAvatar(
                    radius: 4.h,
                    child: Image.asset('assets/images/user.png'),
                  ) //Text
                  ), //circleAvatar
            ), //UserAccountDrawerHeader
          ),
          Divider(
            thickness: 2,
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(' Update Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_page_rounded),
            title: const Text(' Contact Us'),
            onTap: () {
              Get.to(() => ContactUsPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text(' Abouts Us'),
            onTap: () {
              Get.to(() => AboutUsPage());
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              Get.to(() => SignInScreen());
            },
          ),
        ],
      ),
    );
  }
}
