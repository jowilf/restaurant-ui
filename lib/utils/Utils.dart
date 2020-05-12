import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static void toast(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      fontSize: 16.0);
  }
}