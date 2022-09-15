import 'package:booking/model/ValidacijaUsera/validacija_request_model.dart';

import 'package:booking/pages/proces_verifikacije.dart';

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../../config.dart';
import '../../services/api_service.dart';

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
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _validacijaUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _validacijaUI(BuildContext context) {
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
                padding: EdgeInsets.only(left: 20, top: 20),
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

                  Validacija model = Validacija(
                    jib: jib!,
                  );

                  APIService.slanjeValidacije(model).then(
                    (response) {
                      setState(() {
                        isAPIcallProcess = false;
                      });

                      if (response) {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName.toUpperCase(),
                          "Upješno ste poslali zahtjev za validaciju!",
                          "OK",
                          () {
                            Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const ProcesVerifikacije(),
                                ));
                          },
                        );
                      } else {
                        FormHelper.showSimpleAlertDialog(
                          context,
                          Config.appName,
                          "Greska sa serverom ili nista logirani",
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
