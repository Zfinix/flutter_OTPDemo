import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:viren_demo/utils/margin.dart';
import 'package:viren_demo/utils/navigation.dart';
import 'package:viren_demo/viewmodels/home_vm.dart';

import 'otp_page.dart';

class HomePage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const YMargin(50),
                    Text(
                      "Verify Account",
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: Colors.blueGrey[500],
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const YMargin(80),
                    Lottie.asset(
                      'assets/lottie/phone.json',
                      height: screenWidth(context, percent: 0.6),
                      width: screenWidth(context, percent: 0.6),
                      animate: false,
                    ),
                    const YMargin(80),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Phone Number',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              )),
                          const YMargin(10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              color: Color(0xFFEDEDED),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: Row(
                                      children: <Widget>[
                                        const XMargin(10),
                                        CountryCodePicker(
                                          onChanged: provider.onCountryChange,
                                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                          initialSelection: 'NG',
                                          textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Color.fromRGBO(87, 93, 107, 1)),
                                          favorite: ['+234', 'NG'],

                                          showFlag: true,
                                          showCountryOnly: true,
                                          alignLeft: false,
                                        ),
                                        Icon(Icons.arrow_drop_down,
                                            color: Colors.grey[300])
                                      ],
                                    ),
                                  ),
                                  const XMargin(10),
                                  Flexible(
                                    flex: 5,
                                    child: Container(
                                      child: TextFormField(
                                          validator: (value) {
                                            if (value.length >= 10) {
                                              provider.phone =
                                                  '${provider?.countryCode ?? "+234"}' +
                                                      value;

                                              return null;
                                            } else if (value.isEmpty) {
                                              return "This field can't be left empty";
                                            } else {
                                              return "Invalid phone number";
                                            }
                                          },
                                          controller: provider.phoneTEC,
                                          onChanged: (val) {
                                            if (provider?.countryCode == '+234' &&
                                                    val == '08' ||
                                                val == '07' ||
                                                val == '09') {
                                              provider.phoneTEC.text = provider
                                                  .phoneTEC.text
                                                  .substring(1);
                                            }
                                          },
                                          keyboardType: TextInputType.phone,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.black),
                                          decoration: InputDecoration.collapsed(
                                              filled: true,
                                              fillColor: Color(0xFFEDEDED),
                                              hintText: '')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const YMargin(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: FlatButton(
                            onPressed: () {
                              if (_formKey.currentState.validate())
                                navigate(context, OTPPage());
                            },
                            child: Text("Continue"),
                            textColor: Colors.white,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0))),
                      ),
                    )
                  ])
            ],
          )),
    );
  }
}
