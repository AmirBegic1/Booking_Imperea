import 'package:booking/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class ProcesVerifikacije extends StatefulWidget {
  const ProcesVerifikacije({Key? key}) : super(key: key);

  @override
  State<ProcesVerifikacije> createState() => _ProcesVerifikacijeState();
}

class _ProcesVerifikacijeState extends State<ProcesVerifikacije> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isAPIcallProcess = false;
  bool hidePassword = true;

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
            Image.asset("assets/cekaj.png"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Center(
                    child: Text(
                      "Profil u procesu verifikacije...",
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
                "Nakon što administrator pregleda Vaš profil, dobit ćete mail nakon čega ćete moći objaviti Vašu uslugu.",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 67, 64, 64),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
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
