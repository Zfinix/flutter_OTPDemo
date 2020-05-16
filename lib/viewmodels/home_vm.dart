import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  String _countryCode = '+234';
  String get countryCode => _countryCode;

  String _phone = '+234';
  String get phone => _phone;

  final TextEditingController phoneTEC = new TextEditingController();
  final TextEditingController controller1 = new TextEditingController();
  final TextEditingController controller2 = new TextEditingController();
  final TextEditingController controller3 = new TextEditingController();
  final TextEditingController controller4 = new TextEditingController();
  final TextEditingController controller5 = new TextEditingController();
  final TextEditingController controller6 = new TextEditingController();

  TextEditingController currController = new TextEditingController();

  set phone(String val) {
    _phone = val;
    notifyListeners();
  }

  set countryCode(String val) {
    _countryCode = val;
    notifyListeners();
  }

  void onCountryChange(CountryCode val) {
    _countryCode = val.dialCode;
    notifyListeners();
  }

  void inputTextToField(String str) {
    //Edit first textField
    if (currController == controller1) {
      controller1.text = str;
      currController = controller2;
    }

    //Edit second textField
    else if (currController == controller2) {
      controller2.text = str;
      currController = controller3;
    }

    //Edit third textField
    else if (currController == controller3) {
      controller3.text = str;
      currController = controller4;
    }

    //Edit fourth textField
    else if (currController == controller4) {
      controller4.text = str;
      currController = controller5;
    }

    //Edit fifth textField
    else if (currController == controller5) {
      controller5.text = str;
      currController = controller6;
    }

    //Edit sixth textField
    else if (currController == controller6) {
      controller6.text = str;
      currController = controller6;
    }
    notifyListeners();
  }

  void deleteText() {
    if (currController.text.length == 0) {
    } else {
      currController.text = "";
      currController = controller5;
      return;
    }

    if (currController == controller1) {
      controller1.text = "";
    } else if (currController == controller2) {
      controller1.text = "";
      currController = controller1;
    } else if (currController == controller3) {
      controller2.text = "";
      currController = controller2;
    } else if (currController == controller4) {
      controller3.text = "";
      currController = controller3;
    } else if (currController == controller5) {
      controller4.text = "";
      currController = controller4;
    } else if (currController == controller6) {
      controller5.text = "";
      currController = controller5;
    }
    notifyListeners();
  }

  void initS() {
    currController = controller1;
 
  }

  void disposeFields() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    notifyListeners();
  }

  void matchOtp(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Successfully"),
            content: Text("Otp matched successfully."),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}
