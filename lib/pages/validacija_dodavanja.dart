import 'dart:ffi';

import 'package:booking/model/register_request_model.dart';
import 'package:booking/model/validacija_request_model.dart';
import 'package:booking/pages/home.dart';

import 'package:booking/services/shared_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:flutter/src/widgets/icon.dart';

import '../config.dart';
import '../services/api_service.dart';

class ValidacijaPage extends StatefulWidget {
  ValidacijaPage({Key? key}) : super(key: key);

  @override
  State<ValidacijaPage> createState() => _ValidacijaPage();
}

class _ValidacijaPage extends State<ValidacijaPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  int? id;
  String? userId;
  String? createdAt;
  String? updatedAt;
  bool? isDeleted;
  String? jib;
  String? fullName;
  String? email;
  bool? isApproved = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "BOOKING",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => GlavnaStranica())));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset("assets/kljuc2.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Center(
                  child: Text(
                    "Želiš dodati svoj objekat/atrakciju?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 30, top: 30, right: 5),
            child: Text(
              "Prije objave neophodno je da pročitate i prihvatite uslove korištenja nakon čega će administrator pregledati i odobriti Vašu prijavu te ćete moći objaviti Vašu uslugu na servis.",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 67, 64, 64),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "nesto",
              "  Grad",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Ime grada ne može biti prazno.';
                }

                return null;
              },
              (onSavedVal) => {
                fullName = onSavedVal,
              },
              initialValue: "",
              obscureText: false,
              borderFocusColor: Colors.black,
              prefixIconColor: Colors.white,
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
              "fullName",
              "  Vaša adresa",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Morate unijeti Vašu adresu! .';
                }

                return null;
              },
              (onSavedVal) => {
                fullName = onSavedVal,
              },
              initialValue: "",
              obscureText: false,
              borderFocusColor: Colors.black,
              prefixIconColor: Colors.white,
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
              "jib",
              "  JMBG",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Morate unijeti JMBG.';
                }

                return null;
              },
              (onSavedVal) => {
                jib = onSavedVal,
              },
              initialValue: "",
              obscureText: false,
              borderFocusColor: Colors.black,
              prefixIconColor: Colors.white,
              borderColor: Colors.grey,
              textColor: Colors.black,
              hintColor: Colors.grey.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: FormHelper.submitButton(
              "Pošalji zahtjev",
              () {
                if (validateAndSave()) {
                  setState(() {
                    isAPIcallProcess = true;
                  });

                  ValidacijaRequestModel model = ValidacijaRequestModel(
                    id: id!,
                    userId: userId!,
                    createdAt: createdAt!,
                    updatedAt: updatedAt!,
                    isDeleted: isDeleted!,
                    jib: jib!,
                    fullName: fullName!,
                    email: email!,
                    isApproved: isApproved!,
                  );

                  APIService.validacija(model).then(
                    (response) {
                      setState(() {
                        isAPIcallProcess = false;
                      });

                      if (response.requestResult != null) {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          "Upješno ste poslali zahtjev za validaciju!",
                          "OK",
                          () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/proces_verifikacije',
                              (route) => false,
                            );
                          },
                        );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          response.errorCode,
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
              btnColor: Colors.transparent,
              borderColor: Colors.white,
              txtColor: Colors.blue,
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
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
