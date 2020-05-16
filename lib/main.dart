import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/provider_registry.dart';
import 'utils/theme.dart';
import 'views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: registerProviders,
      child: MaterialApp(
        title: 'OTP Example',
        debugShowCheckedModeBanner: false,
        theme: themeData(context),
        home: HomePage(),
      ),
    );
  }
}
