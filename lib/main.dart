import 'package:flutter/material.dart';
import 'package:nekxolivro/ui/screens/ForgotPasswordPage.dart';
import 'package:nekxolivro/ui/screens/LoginPage.dart';
import 'package:nekxolivro/ui/screens/PhoneVerificationPage.dart';
import 'package:nekxolivro/ui/screens/RegisterPage.dart';
import 'package:nekxolivro/values/AppRoutes.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/StringRes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nekxo Livro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cursorColor: Palette.greyText,
        fontFamily: StringRes.Avenir_Book,
        primaryColor: Palette.colorPrimary,
      ),
      initialRoute: '/',
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
        return ForgotPasswordPage();
      case AppRoutes.forgotPassword:
        return ForgotPasswordPage();
      case AppRoutes.login:
        return LoginPage();
      case AppRoutes.register:
        return RegisterPage();
      case AppRoutes.phoneVerification:
        return PhoneVerificationPage();
    }
  }
}
