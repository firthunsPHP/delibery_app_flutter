
import 'package:delibery_app/pages/login_page/login_page.dart';
import 'package:delibery_app/pages/welcome_page/welcome_page.dart';
import 'package:flutter/widgets.dart';

final routes = <String, WidgetBuilder>{
  'welcome': (BuildContext context) => WelcomePage(),
  'login': (BuildContext context) => LoginPage()
};
