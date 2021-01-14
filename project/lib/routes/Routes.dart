import 'package:flutter/widgets.dart';
import 'package:project/login_page.dart';

import 'package:project/screen/guest/Login.dart' as guest;
import 'package:project/screen/guest/Register.dart' as guest;
import 'package:project/screen/user/UserIndex.dart' as user;
import 'package:project/screen/user/donation/GoodPage.dart' as donation;
import 'package:project/screen/user/donation/CalculatePage.dart' as donation;
import 'package:project/screen/user/donation/DonePage.dart' as donation;
import 'package:project/screen/user/donation/MoneyPage.dart' as donation;


final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    '/login'                    : (context) => guest.Login(),
    '/register'                 : (context) => guest.Register(),
    
    '/users'                    : (context) => user.UserIndex(),
    '/donations/good'           : (context) => donation.GoodPage(),
    '/donations/calculate'      : (context) => donation.CalculatePage(),
    '/donations/done'           : (context) => donation.DonePage(),
    '/donations/money'           : (context) => donation.MoneyPage(),
};
