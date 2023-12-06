import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:string_validator/string_validator.dart';
import '../userData/user_data.dart';
import '../widgets/appbar_widget.dart';

class EditPhoneFormPage extends HookWidget {
  EditPhoneFormPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var user = UserData.myUser;
    final phoneController = useTextEditingController();
    updateUserValue(String phone) {
      var formattedPhoneNumber =
          '(${phone.substring(0, 3)}) ${phone.substring(3, phone.length)}';
      user.phone = formattedPhoneNumber;
    }

    return Scaffold(
      appBar: buildAppBar(context),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width: 320,
              child: Text(
                "Số điện thoại của bạn là?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SizedBox(
                height: 80,
                width: 320,
                child: TextFormField(
                  // Handles Form Validation
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Hãy điền số điện thoại của bạn.';
                    } else if (isAlpha(value)) {
                      return 'Hãy chỉ điền số.';
                    } else if (value.length < 10) {
                      return 'Hãy điền đúng số điện thoại!';
                    }
                    return null;
                  },
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Số điện thoại của bạn',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 320,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate() &&
                          isNumeric(phoneController.text)) {
                        updateUserValue(phoneController.text);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Cập nhật',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
