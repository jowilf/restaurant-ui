import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:nekxolivro/ui/screens/AccountScreen.dart';
import 'package:nekxolivro/ui/screens/FoodDetailPage.dart';
import 'package:nekxolivro/ui/screens/ForgotPasswordPage.dart';
import 'package:nekxolivro/ui/screens/HomePage.dart';
import 'package:nekxolivro/ui/screens/LocationPickerPage.dart';
import 'package:nekxolivro/ui/screens/LoginPage.dart';
import 'package:nekxolivro/ui/screens/PhoneVerificationPage.dart';
import 'package:nekxolivro/ui/screens/RegisterPage.dart';
import 'package:nekxolivro/ui/screens/ResetPasswordPage.dart';
import 'package:nekxolivro/ui/screens/RestoDetailPage.dart';
import 'package:nekxolivro/values/AppRoutes.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/StringRes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white.withOpacity(0.4));
    return MaterialApp(
      title: 'Nekxo Livro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cursorColor: Palette.greyText,
        fontFamily: StringRes.Avenir_Book,
        primaryColor: Palette.colorPrimary,
      ),
      initialRoute: '/',
      navigatorObservers: [HeroController()],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => makeRoute(
              context: context,
              routeName: settings.name,
              arguments: settings.arguments),
          maintainState: true,
        );
      },
    );
  }

  Widget makeRoute(
      {@required BuildContext context,
      @required String routeName,
      Object arguments}) {
    final Widget child = _buildRoute(
        context: context, routeName: routeName, arguments: arguments);
    return child;
  }

  Widget _buildRoute({
    @required BuildContext context,
    @required String routeName,
    Object arguments,
  }) {
    print('-----------------');
    print("Navigate to: " + routeName);
    print('-----------------');
    switch (routeName) {
      case AppRoutes.root:
        return HomePage();
      case AppRoutes.resetPassword:
        return ResetPasswordPage();
      case AppRoutes.forgotPassword:
        return ForgotPasswordPage();
      case AppRoutes.login:
        return LoginPage();
      case AppRoutes.register:
        return RegisterPage();
      case AppRoutes.phoneVerification:
        return PhoneVerificationPage(arguments);
      case AppRoutes.restoDetail:
        return RestoDetailPage(arguments);
      case AppRoutes.foodDetail:
        return FoodDetailPage(arguments);
      case AppRoutes.location_picker:
        return LocationPickerPage();
      case AppRoutes.account:
        return AccountScreen();
    }
  }
}
