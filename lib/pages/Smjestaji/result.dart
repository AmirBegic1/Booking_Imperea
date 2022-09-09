import 'package:booking/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class ZahjtevRezervacije extends StatefulWidget {
  const ZahjtevRezervacije({Key? key}) : super(key: key);

  @override
  State<ZahjtevRezervacije> createState() => _ZahjtevRezervacijeState();
}

class _ZahjtevRezervacijeState extends State<ZahjtevRezervacije> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isAPIcallProcess = false;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: procesCekanja(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget procesCekanja(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/posta1.png"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Center(
                    child: Text(
                      "Zahtjev za rezervaciju poslan!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
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
                "Dobit ćete obavještenje nakon što vlasnik objekta odobri Vašu rezervaciju.",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 67, 64, 64),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 80),
              child: FormHelper.submitButton(
                "Ok",
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const GlavnaStranica(),
                      ));
                },
                btnColor: Colors.transparent,
                borderColor: Colors.white,
                txtColor: Colors.blue,
                borderRadius: 10,
              ),
            )
          ]),
    );
  }
}
