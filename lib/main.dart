
import 'package:delibery_app/pages/login_page/provider/login_provider.dart';
import 'package:delibery_app/pages/register_page/provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/user_provider.dart';
import 'config/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        initialRoute: 'welcome',
        title: 'Flutter Demo',
        theme: ThemeData(
            accentColor: Color.fromRGBO(255, 140, 0, 1.0),
            primaryColor: Color.fromRGBO(10, 31, 68, 1.0),
            buttonColor: Color.fromRGBO(0, 122, 255, 1.0),
            disabledColor: Color.fromRGBO(142, 142, 147, 1.2),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme:
            AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
      ),
    );
  }
}