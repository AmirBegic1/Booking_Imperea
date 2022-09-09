import 'package:booking/config.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../../model/Login/login_request_model.dart';
import '../../services/api_service.dart';

class LoginSheet extends StatefulWidget {
  LoginSheet({Key? key}) : super(key: key);

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  bool isAPIcallProcess = false;
  bool hidePasswrod = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
        child: Form(
          key: globalFormKey,
          child: _loginUI(context),
        ),
        inAsyncCall: isAPIcallProcess,
        opacity: 0.3,
        key: UniqueKey(),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 50, top: 30),
            child: Text(
              "Prijava",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "email",
              "E-mail",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Email ne može biti prazan.';
                }

                return null;
              },
              (onSavedVal) => {
                email = onSavedVal,
              },
              initialValue: "",
              obscureText: false,
              borderFocusColor: Colors.blue,
              prefixIconColor: Colors.black,
              prefixIcon: const Icon(Icons.person),
              borderColor: Colors.grey,
              textColor: Colors.black,
              hintColor: Colors.grey.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "password",
              "Password",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Password ne može biti prazan.';
                }

                return null;
              },
              (onSavedVal) => {
                password = onSavedVal,
              },
              initialValue: "",
              obscureText: hidePasswrod,
              borderFocusColor: Colors.blue,
              prefixIconColor: Colors.black,
              borderColor: Colors.grey,
              textColor: Colors.black,
              borderRadius: 10,
              hintColor: Colors.grey.withOpacity(0.7),
              suffixIcon: IconButton(
                focusColor: Colors.black,
                onPressed: () {
                  setState(() {
                    hidePasswrod = !hidePasswrod;
                  });
                },
                color: Colors.black.withOpacity(0.7),
                icon: Icon(
                  hidePasswrod ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(
                right: 25,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Prijavi se",
              () {
                if (validateAndSave()) {
                  setState(() {
                    isAPIcallProcess = true;
                  });

                  LoginRequestModel model = LoginRequestModel(
                    email: email!,
                    password: password!,
                  );

                  APIService.login(model).then(
                    (response) {
                      setState(() {
                        isAPIcallProcess = false;
                      });

                      if (response) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                          (route) => false,
                        );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          "Pogrešan email ili password",
                          "OK",
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      }
                    },
                  );
                }
              },
              btnColor: Color.fromARGB(255, 217, 229, 240),
              borderColor: Colors.transparent,
              txtColor: Colors.blue,
              borderRadius: 10,
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
