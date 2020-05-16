import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:viren_demo/utils/margin.dart';
import 'package:viren_demo/utils/navigation.dart';
import 'package:viren_demo/viewmodels/home_vm.dart';

class OTPPage extends StatefulWidget {
  @override
  OTPPageState createState() => OTPPageState();
}

class OTPPageState extends State<OTPPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    context.read<HomeViewModel>().initS();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => popView(context),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Verifying your account!",
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: Colors.blueGrey[500],
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text("Please type the verification code sent to",
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        color: Colors.blueGrey[300],
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    )),
                const YMargin(10),
                Text(
                  provider?.phone ?? '',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
                const YMargin(30),
                Lottie.asset(
                  'assets/lottie/phone.json',
                  height: screenWidth(context, percent: 0.5),
                  width: screenWidth(context, percent: 0.5),
                  animate: false,
                ),
              ],
            ),
            Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GridView.count(
                    crossAxisCount: 8,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    children: List<InputFields>.generate(
                      7,
                      (int index) => InputFields(index),
                    ),
                  ),
                ]),
            KeyPad(),
          ],
        ),
      ),
    );
  }
}

class KeyPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 16.0, right: 15, bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  KeyPadButton(number: 1),
                  KeyPadButton(number: 2),
                  KeyPadButton(number: 3),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 4.0, right: 15, bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  KeyPadButton(number: 4),
                  KeyPadButton(number: 5),
                  KeyPadButton(number: 6),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 4.0, right: 15, bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  KeyPadButton(number: 7),
                  KeyPadButton(number: 8),
                  KeyPadButton(number: 9),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 4.0, right: 15, bottom: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  KeyPadButton(
                    onTap: () => provider.deleteText(),
                    image: 'delete',
                  ),
                  KeyPadButton(number: 0),
                  KeyPadButton(
                    onTap: () => provider.matchOtp(context),
                    image: 'success',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KeyPadButton extends StatelessWidget {
  const KeyPadButton({this.number, this.image, this.onTap});
  final int number;
  final String image;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: IconButton(
        onPressed: onTap ??
            () {
              provider.inputTextToField("$number");
            },
        icon: image != null
            ? Image.asset('assets/images/$image.png', width: 25.0, height: 25.0)
            : Text("$number",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center),
      ),
    );
  }
}

class InputFields extends StatelessWidget {
  final int index;
  InputFields(this.index);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    List<Widget> widgetList = [
      const XMargin(30),
      InputController(provider.controller1),
      InputController(provider.controller2),
      InputController(provider.controller3),
      InputController(provider.controller4),
      InputController(provider.controller5),
      InputController(provider.controller6),
    ];

    return Center(child: widgetList[index]);
  }
}

class InputController extends StatelessWidget {
  final TextEditingController controller;
  const InputController(this.controller);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2.0, left: 2.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xFFEDEDED),
            // border: Border.all(width: 1.0, color: Color(0xFFEDEDED)),
            borderRadius: BorderRadius.circular(4.0)),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          enabled: false,
          controller: controller,
          autofocus: false,
          textAlign: TextAlign.center,
          decoration: InputDecoration(border: InputBorder.none),
          style: TextStyle(fontSize: 24.0, color: Colors.black),
        ),
      ),
    );
  }
}
