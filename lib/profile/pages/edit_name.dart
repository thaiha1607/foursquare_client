// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:string_validator/string_validator.dart';
import '../userData/user_data.dart';
import '../widgets/appbar_widget.dart';

class EditNameFormPage extends HookWidget {
  EditNameFormPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final firstNameController = useTextEditingController();
    final secondNameController = useTextEditingController();
    var user = UserData.myUser;
    updateUserValue(String name) {
      user.name = name;
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
              width: 330,
              child: Text(
                "Tên của bạn là?",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                  child: SizedBox(
                    height: 100,
                    width: 150,
                    child: TextFormField(
                      // Handles Form Validation for First Name
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Hãy điền họ và tên đệm của bạn.';
                        } else if (!isAlpha(value)) {
                          return 'Hãy chỉ điền chữ.';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(labelText: 'Họ và tên đệm'),
                      controller: firstNameController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                  child: SizedBox(
                    height: 100,
                    width: 150,
                    child: TextFormField(
                      // Handles Form Validation for Last Name
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Hãy điền tên của bạn.';
                        } else if (!isAlpha(value)) {
                          return 'Hãy chỉ điền chữ.';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Tên'),
                      controller: secondNameController,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid,
                      // or false otherwise.
                      if (_formKey.currentState!.validate() &&
                          isAlpha(firstNameController.text +
                              secondNameController.text)) {
                        updateUserValue(firstNameController.text +
                            ' ' +
                            secondNameController.text);
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
            )
          ],
        ),
      ),
    );
  }
}
