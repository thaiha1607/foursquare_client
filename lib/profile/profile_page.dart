import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foursquare_client/profile/pages/edit_address.dart';
import 'pages/edit_email.dart';
import 'pages/edit_image.dart';
import 'pages/edit_name.dart';
import 'pages/edit_phone.dart';
import './widgets/display_image_widget.dart';
import 'userData/user_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;
    user.address;

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          InkWell(
              onTap: () {
                navigateSecondPage(const EditImagePage());
              },
              child: DisplayImage(
                imagePath: user.image,
                onPressed: () {},
              )),
          buildUserInfoDisplay(user.name, 'Tên', const EditNameFormPage()),
          buildUserInfoDisplay(
              user.phone, 'Số điện thoại', const EditPhoneFormPage()),
          buildUserInfoDisplay(user.email, 'Email', const EditEmailFormPage()),
          buildUserInfoDisplay(
              user.address, 'Địa chỉ', const EditAddressFormPage()),
        ],
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(
          String? getValue, String title, Widget editPage) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              width: 350,
              height: 40,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        if (getValue != null) {
                          navigateSecondPage(editPage);
                        }
                      },
                      child: Text(
                        getValue ??
                            "", // If getValue is null, use an empty string
                        style: const TextStyle(fontSize: 16, height: 1.4),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  )
                ],
              ),
            ),
          ],
        ),
      );

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
